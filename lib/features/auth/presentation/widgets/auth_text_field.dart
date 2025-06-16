import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

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
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      maxLines: maxLines,
      enabled: enabled,
      style: const TextStyle(
        color: AppTheme.kTextColor,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: AppTheme.kSecondaryTextColor)
            : null,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTheme.kDefaultRadius),
          borderSide: BorderSide(
            color: AppTheme.kSecondaryTextColor.withOpacity(0.5),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTheme.kDefaultRadius),
          borderSide: BorderSide(
            color: AppTheme.kSecondaryTextColor.withOpacity(0.5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTheme.kDefaultRadius),
          borderSide: const BorderSide(
            color: AppTheme.kAccentColor,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTheme.kDefaultRadius),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTheme.kDefaultRadius),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        labelStyle: TextStyle(
          color: AppTheme.kSecondaryTextColor,
        ),
        hintStyle: TextStyle(
          color: AppTheme.kSecondaryTextColor.withOpacity(0.5),
        ),
        errorStyle: const TextStyle(
          color: Colors.red,
        ),
        filled: true,
        fillColor: AppTheme.kBackgroundColor.withOpacity(0.5),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 16.0,
        ),
      ),
    );
  }
}
