import 'package:barber_time/core/widgets/spacers/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/app_theme.dart';
import '../../theme/app_theme_extensions.dart';

/// Campo de texto mejorado con animaciones y validación en tiempo real
class EnhancedTextField extends StatefulWidget {
  /// Controlador del campo
  final TextEditingController? controller;

  /// Etiqueta del campo
  final String labelText;

  /// Texto de ayuda
  final String? hintText;

  /// Icono del prefijo
  final IconData? prefixIcon;

  /// Icono del sufijo
  final IconData? suffixIcon;

  /// Función de validación
  final String? Function(String?)? validator;

  /// Función llamada cuando cambia el valor
  final void Function(String)? onChanged;

  /// Tipo de teclado
  final TextInputType? keyboardType;

  /// Número máximo de líneas
  final int? maxLines;

  /// Número máximo de caracteres
  final int? maxLength;

  /// Si el campo es requerido
  final bool isRequired;

  /// Si mostrar contador de caracteres
  final bool showCharacterCount;

  /// Si validar en tiempo real
  final bool validateOnChange;

  /// Si mostrar icono de validación
  final bool showValidationIcon;

  /// Si el campo está habilitado
  final bool enabled;

  /// Si el campo tiene foco automático
  final bool autofocus;

  /// Duración de las animaciones
  final Duration animationDuration;

  /// Constructor
  const EnhancedTextField({
    super.key,
    this.controller,
    required this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.maxLines = 1,
    this.maxLength,
    this.isRequired = false,
    this.showCharacterCount = false,
    this.validateOnChange = true,
    this.showValidationIcon = true,
    this.enabled = true,
    this.autofocus = false,
    this.animationDuration = const Duration(milliseconds: 300),
  });

  @override
  State<EnhancedTextField> createState() => _EnhancedTextFieldState();
}

class _EnhancedTextFieldState extends State<EnhancedTextField>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  bool _isFocused = false;
  bool _isValid = true;
  String? _errorText;
  String _currentValue = '';

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.02).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Validar valor inicial si existe
    if (widget.controller?.text.isNotEmpty == true) {
      _currentValue = widget.controller!.text;
      _validateField(_currentValue);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _validateField(String value) {
    if (widget.validator != null) {
      final error = widget.validator!(value);
      setState(() {
        _errorText = error;
        _isValid = error == null;
      });
    }
  }

  void _onFocusChanged(bool hasFocus) {
    setState(() {
      _isFocused = hasFocus;
    });

    if (hasFocus) {
      _animationController.forward();
      HapticFeedback.lightImpact();
    } else {
      _animationController.reverse();
    }
  }

  void _onChanged(String value) {
    setState(() {
      _currentValue = value;
    });

    if (widget.validateOnChange) {
      _validateField(value);
    }

    widget.onChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Campo de texto principal
              DecoratedBox(
                decoration: BoxDecoration(
                  color: AppTheme.kSurfaceColor.withAlpha(102),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _getBorderColor(),
                    width: _isFocused ? 2 : 1,
                  ),
                  boxShadow: _isFocused
                      ? [
                          BoxShadow(
                            color: AppTheme.kPrimaryColor.withAlpha(51),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : null,
                ),
                child: Focus(
                  onFocusChange: _onFocusChanged,
                  child: TextFormField(
                    controller: widget.controller,
                    decoration: InputDecoration(
                      labelText: widget.isRequired
                          ? '${widget.labelText} *'
                          : widget.labelText,
                      hintText: widget.hintText,
                      prefixIcon: widget.prefixIcon != null
                          ? Icon(
                              widget.prefixIcon,
                              color: _getIconColor(),
                              size: 20,
                            )
                          : null,
                      suffixIcon: _buildSuffixIcon(),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      labelStyle: context.textTheme.bodyMedium!.copyWith(
                        color: _getLabelColor(),
                      ),
                      hintStyle: context.textTheme.bodyMedium!.copyWith(
                        color: AppTheme.kOffWhite.withAlpha(102),
                      ),
                    ),
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: AppTheme.kOffWhite,
                    ),
                    keyboardType: widget.keyboardType,
                    maxLines: widget.maxLines,
                    maxLength: widget.maxLength,
                    enabled: widget.enabled,
                    autofocus: widget.autofocus,
                    onChanged: _onChanged,
                    validator: widget.validator,
                  ),
                ),
              ),

              // Contador de caracteres
              if (widget.showCharacterCount && widget.maxLength != null) ...[
                AppSpacers.xxs,
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '${_currentValue.length}/${widget.maxLength}',
                    style: context.textTheme.bodySmall!.copyWith(
                      color: AppTheme.kOffWhite.withAlpha(153),
                    ),
                  ),
                ),
              ],

              // Mensaje de error
              if (_errorText != null) ...[
                AppSpacers.xs,
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Row(
                    children: [
                      Icon(Icons.error_outline, color: Colors.red, size: 16),
                      AppSpacers.hXs,
                      Expanded(
                        child: Text(
                          _errorText!,
                          style: context.textTheme.bodySmall!.copyWith(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget? _buildSuffixIcon() {
    if (!widget.showValidationIcon) return null;

    if (_currentValue.isEmpty) return null;

    if (_isValid) {
      return Icon(Icons.check_circle, color: Colors.green, size: 20);
    } else {
      return Icon(Icons.error, color: Colors.red, size: 20);
    }
  }

  Color _getBorderColor() {
    if (!widget.enabled) {
      return AppTheme.kSurfaceColor.withAlpha(51);
    }

    if (_errorText != null) {
      return Colors.red;
    }

    if (_isFocused) {
      return AppTheme.kPrimaryColor;
    }

    return AppTheme.kSurfaceColor.withAlpha(102);
  }

  Color _getIconColor() {
    if (!widget.enabled) {
      return AppTheme.kOffWhite.withAlpha(102);
    }

    if (_isFocused) {
      return AppTheme.kPrimaryColor;
    }

    return AppTheme.kOffWhite.withAlpha(179);
  }

  Color _getLabelColor() {
    if (!widget.enabled) {
      return AppTheme.kOffWhite.withAlpha(102);
    }

    if (_isFocused) {
      return AppTheme.kPrimaryColor;
    }

    return AppTheme.kOffWhite.withAlpha(179);
  }
}
