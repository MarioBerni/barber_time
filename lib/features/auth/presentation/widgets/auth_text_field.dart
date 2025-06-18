import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/theme/app_spacing.dart';

/// Estado de validación para el campo de autenticación
enum AuthFieldValidationState {
  /// Estado inicial o normal
  neutral,

  /// Estado cuando el campo es válido
  valid,

  /// Estado cuando el campo tiene un error
  error,
}

/// Widget de campo de texto premium para formularios de autenticación
///
/// Proporciona un estilo consistente y moderno para todos los campos de formulario
/// en las pantallas de autenticación, con animaciones y efectos visuales mejorados
class AuthTextField extends StatefulWidget {
  /// Controlador del campo de texto
  final TextEditingController controller;
  
  /// Texto de la etiqueta
  final String labelText;
  
  /// Texto de sugerencia opcional
  final String? hintText;
  
  /// Icono prefijo opcional
  final IconData? prefixIcon;
  
  /// Widget sufijo opcional
  final Widget? suffixIcon;
  
  /// Si el texto debe ocultarse (para contraseñas)
  final bool obscureText;
  
  /// Tipo de teclado para la entrada
  final TextInputType keyboardType;
  
  /// Función de validación opcional
  final String? Function(String?)? validator;
  
  /// Callback cuando cambia el texto
  final void Function(String)? onChanged;
  
  /// Límite de líneas (1 por defecto)
  final int? maxLines;
  
  /// Si el campo está habilitado
  final bool enabled;
  
  /// Radio de borde personalizado (opcional)
  final double? customBorderRadius;
  
  /// Color de acento personalizado (opcional)
  final Color? accentColor;
  
  /// Estado de validación inicial
  final AuthFieldValidationState initialValidationState;

  /// Constructor principal para el campo de autenticación
  const AuthTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.maxLines = 1,
    this.enabled = true,
    this.customBorderRadius,
    this.accentColor,
    this.initialValidationState = AuthFieldValidationState.neutral,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> 
    with SingleTickerProviderStateMixin {
  // Controlador para la animación de enfoque
  late AnimationController _focusController;
  late Animation<double> _borderAnimation;
  late Animation<double> _elevationAnimation;
  
  // Estado de enfoque
  bool _isFocused = false;
  
  // Estado de validación
  AuthFieldValidationState _validationState = AuthFieldValidationState.neutral;
  
  // Controlador de foco
  final FocusNode _focusNode = FocusNode();
  
  @override
  void initState() {
    super.initState();
    
    // Inicializar estado de validación
    _validationState = widget.initialValidationState;
    
    // Configurar animaciones
    _focusController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    
    _borderAnimation = Tween<double>(
      begin: 1.0,
      end: 2.0,
    ).animate(CurvedAnimation(
      parent: _focusController,
      curve: Curves.easeOutCubic,
    ));
    
    _elevationAnimation = Tween<double>(
      begin: 0.0,
      end: 4.0,
    ).animate(CurvedAnimation(
      parent: _focusController,
      curve: Curves.easeOutCubic,
    ));
    
    // Configurar listener de foco
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusController.dispose();
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }
  
  // Manejar cambios en el estado de foco
  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
    
    if (_isFocused) {
      _focusController.forward();
    } else {
      _focusController.reverse();
    }
  }
  
  // Actualizar el estado de validación
  void _updateValidationState(String? value) {
    if (widget.validator == null) return;
    
    final String? errorText = widget.validator!(value);
    final AuthFieldValidationState newState = errorText == null
        ? (value != null && value.isNotEmpty)
            ? AuthFieldValidationState.valid
            : AuthFieldValidationState.neutral
        : AuthFieldValidationState.error;
    
    if (newState != _validationState) {
      setState(() {
        _validationState = newState;
      });
    }
  }
  
  // Obtener color según el estado de validación
  Color _getStateColor(BuildContext context) {
    switch (_validationState) {
      case AuthFieldValidationState.valid:
        return context.successColor;
      case AuthFieldValidationState.error:
        return context.errorColor;
      case AuthFieldValidationState.neutral:
        return _isFocused
            ? (widget.accentColor ?? context.accentColor)
            : context.secondaryTextColor.withOpacity(0.5);
    }
  }
  
  // Obtener icono de estado para el sufijo
  Widget? _getStateIcon() {
    if (!_isFocused && widget.controller.text.isEmpty) {
      return null;
    }
    
    switch (_validationState) {
      case AuthFieldValidationState.valid:
        return Icon(
          Icons.check_circle,
          color: context.successColor,
          size: 20,
        );
      case AuthFieldValidationState.error:
        return Icon(
          Icons.error,
          color: context.errorColor,
          size: 20,
        );
      case AuthFieldValidationState.neutral:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Usar las extensiones para simplificar el acceso al tema
    final borderRadius = widget.customBorderRadius != null
        ? BorderRadius.circular(widget.customBorderRadius!)
        : context.textFieldBorderRadius;
    
    final stateIcon = _getStateIcon();
    final stateColor = _getStateColor(context);

    return AnimatedBuilder(
      animation: _focusController,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            boxShadow: _isFocused ? [
              BoxShadow(
                color: stateColor.withOpacity(0.2),
                blurRadius: _elevationAnimation.value * 2,
                spreadRadius: _elevationAnimation.value / 4,
                offset: const Offset(0, 1),
              )
            ] : [],
          ),
          child: child,
        );
      },
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        onChanged: (value) {
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
          _updateValidationState(value);
        },
        focusNode: _focusNode,
        maxLines: widget.maxLines,
        enabled: widget.enabled,
        style: context.bodyMedium,
        cursorColor: widget.accentColor ?? context.accentColor,
        cursorWidth: 2.0,
        cursorRadius: const Radius.circular(2.0),
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon != null
              ? AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    widget.prefixIcon,
                    color: _isFocused ? stateColor : context.secondaryTextColor.withOpacity(0.7),
                  ),
                )
              : null,
          suffixIcon: widget.suffixIcon ?? stateIcon,
          border: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(
              color: context.secondaryTextColor.withOpacity(0.5),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(
              color: stateColor.withOpacity(0.6),
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(
              color: stateColor,
              width: _borderAnimation.value,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(
              color: context.errorColor,
              width: 1.5,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(
              color: context.errorColor,
              width: _borderAnimation.value,
            ),
          ),
          labelStyle: context.bodyMedium.copyWith(
            color: _isFocused ? stateColor : context.secondaryTextColor,
            fontWeight: _isFocused ? FontWeight.w500 : FontWeight.normal,
          ),
          hintStyle: context.bodySmall.copyWith(
            color: context.secondaryTextColor.withOpacity(0.5),
          ),
          errorStyle: context.bodySmall.copyWith(
            color: context.errorColor,
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          fillColor: _isFocused 
              ? context.backgroundColor.withOpacity(0.8)
              : context.surfaceColor,
          contentPadding: EdgeInsets.symmetric(
            vertical: AppSpacing.md + (_isFocused ? 1.0 : 0),
            horizontal: AppSpacing.md + (_isFocused ? 2.0 : 0),
          ),
          floatingLabelStyle: context.bodyMedium.copyWith(
            color: stateColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
