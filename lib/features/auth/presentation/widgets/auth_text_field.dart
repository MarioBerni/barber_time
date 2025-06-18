import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/theme/app_spacing.dart';

/// Widget de campo de texto personalizado para formularios de autenticación
///
/// Proporciona un estilo consistente para todos los campos de formulario
/// en las pantallas de autenticación
class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final int? maxLines;
  final bool enabled;

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
  });

  @override
  Widget build(BuildContext context) {
    // Usar las extensiones para simplificar el acceso al tema
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      maxLines: maxLines,
      enabled: enabled,
      style: context.bodyMedium,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: context.secondaryTextColor)
            : null,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: context.textFieldBorderRadius,
          borderSide: BorderSide(
            color: context.secondaryTextColor.withOpacity(0.5),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: context.textFieldBorderRadius,
          borderSide: BorderSide(
            color: context.secondaryTextColor.withOpacity(0.5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: context.textFieldBorderRadius,
          borderSide: BorderSide(
            color: context.accentColor,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: context.textFieldBorderRadius,
          borderSide: BorderSide(
            color: context.errorColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: context.textFieldBorderRadius,
          borderSide: BorderSide(
            color: context.errorColor,
            width: 2,
          ),
        ),
        labelStyle: context.bodyMedium.copyWith(
          color: context.secondaryTextColor,
        ),
        hintStyle: context.bodySmall.copyWith(
          color: context.secondaryTextColor.withOpacity(0.5),
        ),
        errorStyle: context.bodySmall.copyWith(
          color: context.errorColor,
        ),
        filled: true,
        fillColor: context.surfaceColor,
        contentPadding: EdgeInsets.symmetric(
          vertical: AppSpacing.md,
          horizontal: AppSpacing.md,
        ),
      ),
    );
  }
}
