import 'package:flutter/material.dart';

import '../../theme/app_design_constants.dart';
import '../../theme/app_theme_extensions.dart';

/// Estado de validación para campos de texto
enum TextFieldValidationState {
  /// Estado inicial o normal
  neutral,

  /// Estado cuando el campo es válido
  valid,

  /// Estado cuando el campo tiene un error
  error,
}

/// Campo de texto reutilizable que sigue el sistema de diseño dark premium
///
/// Proporciona un estilo consistente para todos los campos de texto
/// de la aplicación, con animaciones sutiles y efectos visuales
class ThemedTextField extends StatefulWidget {
  /// Controlador del campo de texto
  final TextEditingController? controller;

  /// Texto de la etiqueta
  final String? labelText;

  /// Texto de sugerencia
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

  /// Callback cuando se envía el texto
  final void Function(String)? onSubmitted;

  /// Callback cuando se presiona el campo
  final VoidCallback? onTap;

  /// Límite de líneas (1 por defecto)
  final int? maxLines;

  /// Si el campo está habilitado
  final bool enabled;

  /// Radio de borde personalizado (opcional)
  final double? customBorderRadius;

  /// Color de acento personalizado (opcional)
  final Color? accentColor;

  /// Color de fondo personalizado (opcional)
  final Color? backgroundColor;

  /// Estado de validación inicial
  final TextFieldValidationState initialValidationState;

  /// Si debe mostrar validación visual
  final bool showValidation;

  /// Estilo compacto
  final bool compact;

  /// Constructor principal para el campo de texto temático
  const ThemedTextField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.maxLines = 1,
    this.enabled = true,
    this.customBorderRadius,
    this.accentColor,
    this.backgroundColor,
    this.initialValidationState = TextFieldValidationState.neutral,
    this.showValidation = false,
    this.compact = false,
  });

  @override
  State<ThemedTextField> createState() => _ThemedTextFieldState();
}

class _ThemedTextFieldState extends State<ThemedTextField>
    with SingleTickerProviderStateMixin {
  // Controlador para la animación de enfoque
  late AnimationController _focusController;

  // Estado de enfoque
  bool _isFocused = false;

  // Estado de validación
  TextFieldValidationState _validationState = TextFieldValidationState.neutral;

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
      duration: const Duration(milliseconds: 200),
    );

    // Configurar listener de foco
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusController.dispose();
    _focusNode
      ..removeListener(_handleFocusChange)
      ..dispose();
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
    if (!widget.showValidation || widget.validator == null) return;

    final String? errorText = widget.validator!(value);
    final TextFieldValidationState newState = errorText == null
        ? (value != null && value.isNotEmpty)
              ? TextFieldValidationState.valid
              : TextFieldValidationState.neutral
        : TextFieldValidationState.error;

    if (newState != _validationState) {
      setState(() {
        _validationState = newState;
      });
    }
  }

  // Obtener color según el estado de validación
  Color _getStateColor(BuildContext context) {
    if (!widget.showValidation) {
      return _isFocused
          ? (widget.accentColor ?? context.primaryColor)
          : context.grayMedium;
    }

    switch (_validationState) {
      case TextFieldValidationState.valid:
        return context.successColor;
      case TextFieldValidationState.error:
        return context.errorColor;
      case TextFieldValidationState.neutral:
        return _isFocused
            ? (widget.accentColor ?? context.primaryColor)
            : context.grayMedium;
    }
  }

  // Obtener icono de estado para el sufijo
  Widget? _getStateIcon() {
    if (!widget.showValidation ||
        (!_isFocused && widget.controller?.text.isEmpty != false)) {
      return null;
    }

    switch (_validationState) {
      case TextFieldValidationState.valid:
        return Icon(Icons.check_circle, color: context.successColor, size: 18);
      case TextFieldValidationState.error:
        return Icon(Icons.error, color: context.errorColor, size: 18);
      case TextFieldValidationState.neutral:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Usar el tema dark premium
    final borderRadius = widget.customBorderRadius != null
        ? BorderRadius.circular(widget.customBorderRadius!)
        : context.textFieldBorderRadius;

    final stateIcon = _getStateIcon();
    final stateColor = _getStateColor(context);
    final backgroundColor = widget.backgroundColor ?? context.charcoalMedium;

    return AnimatedBuilder(
      animation: _focusController,
      builder: (context, child) {
        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            boxShadow: _isFocused ? context.lightShadow : [],
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
        onFieldSubmitted: widget.onSubmitted,
        onTap: widget.onTap,
        focusNode: _focusNode,
        maxLines: widget.maxLines,
        enabled: widget.enabled,
        style: widget.compact
            ? context.bodySmall.copyWith(color: context.textColor)
            : context.bodyMedium.copyWith(color: context.textColor),
        cursorColor: widget.accentColor ?? context.primaryColor,
        cursorRadius: Radius.circular(AppDesignConstants.borderRadiusXS),
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon != null
              ? Icon(
                  widget.prefixIcon,
                  color: _isFocused ? stateColor : context.grayMedium,
                  size: widget.compact ? 18 : 20,
                )
              : null,
          suffixIcon: widget.suffixIcon ?? stateIcon,
          // Bordes para tema dark
          border: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(color: context.grayDark),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(color: context.grayDark),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(color: stateColor, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(color: context.errorColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(color: context.errorColor, width: 1.5),
          ),
          labelStyle: (widget.compact ? context.bodySmall : context.bodyMedium)
              .copyWith(
                color: _isFocused ? stateColor : context.secondaryTextColor,
                fontWeight: _isFocused ? FontWeight.w500 : FontWeight.normal,
              ),
          hintStyle: (widget.compact ? context.bodySmall : context.bodyMedium)
              .copyWith(color: context.tertiaryTextColor),
          errorStyle: context.bodySmall.copyWith(color: context.errorColor),
          filled: true,
          fillColor: backgroundColor,
          contentPadding: EdgeInsets.symmetric(
            vertical: widget.compact ? context.spacingXS : context.spacingSM,
            horizontal: context.spacingSM,
          ),
          floatingLabelStyle:
              (widget.compact ? context.bodySmall : context.bodyMedium)
                  .copyWith(color: stateColor, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
