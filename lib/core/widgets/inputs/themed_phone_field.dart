import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../../theme/app_theme.dart';
import '../../theme/app_theme_extensions.dart';

/// Campo de teléfono temático con estilo premium que integra PhoneFormField
/// manteniendo la coherencia visual con el resto de la aplicación
class ThemedPhoneField extends StatelessWidget {
  /// Controlador del campo de teléfono
  final PhoneController? controller;

  /// Texto de la etiqueta
  final String labelText;

  /// Texto de ayuda/placeholder
  final String hintText;

  /// Icono a mostrar al inicio del campo
  final IconData? prefixIcon;

  /// Si debe mostrar validación visual
  final bool showValidation;

  /// Función validadora personalizada
  final String? Function(PhoneNumber?)? validator;

  /// Color de acento del campo
  final Color accentColor;

  /// Color de fondo del campo
  final Color backgroundColor;

  /// Función que se ejecuta cuando cambia el valor
  final void Function(PhoneNumber)? onChanged;

  /// Función que se ejecuta cuando se envía el formulario
  final void Function(PhoneNumber?)? onSaved;

  /// Si el campo está habilitado
  final bool enabled;

  /// País inicial (código ISO)
  final String initialCountryCode;

  /// Constructor
  const ThemedPhoneField({
    super.key,
    this.controller,
    required this.labelText,
    this.hintText = '',
    this.prefixIcon,
    this.showValidation = false,
    this.validator,
    this.accentColor = Colors.teal,
    this.backgroundColor = const Color(0xFF2A2A2A),
    this.onChanged,
    this.onSaved,
    this.enabled = true,
    this.initialCountryCode = 'UY', // Uruguay por defecto
  });

  @override
  Widget build(BuildContext context) {
    return PhoneFormField(
      controller: controller,
      enabled: enabled,

      // Configuración de estilo premium
      decoration: _buildInputDecoration(context),

      // Estilo del botón de país
      countryButtonStyle: CountryButtonStyle(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        textStyle: context.bodyMedium.copyWith(
          color: AppTheme.kOffWhite,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
        flagSize: 24,
        borderRadius: BorderRadius.circular(12),
      ),

      // Configuración del selector de país con diseño premium
      countrySelectorNavigator: CountrySelectorNavigator.modalBottomSheet(
        height: 600,
        favorites: const [
          IsoCode.UY,
          IsoCode.AR,
          IsoCode.BR,
          IsoCode.CL,
          IsoCode.PY,
        ],
        showDialCode: true,
        sortCountries: true,
        noResultMessage: 'No se encontraron países',
      ),

      // Validación
      validator: validator ?? _defaultValidator,
      autovalidateMode: showValidation
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,

      // Callbacks
      onChanged: onChanged,
      onSaved: onSaved,

      // Estilo del cursor
      cursorColor: accentColor,
    );
  }

  /// Construye la decoración del input manteniendo el estilo premium
  InputDecoration _buildInputDecoration(BuildContext context) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,

      // Estilo de texto
      labelStyle: context.bodyMedium.copyWith(
        color: AppTheme.kOffWhite.withAlpha((0.8 * 255).round()),
        fontWeight: FontWeight.w500,
      ),
      hintStyle: context.bodyMedium.copyWith(
        color: AppTheme.kOffWhite.withAlpha((0.5 * 255).round()),
      ),

      // Icono de prefijo si existe
      prefixIcon: prefixIcon != null
          ? Container(
              margin: const EdgeInsets.only(right: 12),
              child: Icon(prefixIcon, color: accentColor, size: 20),
            )
          : null,

      // Relleno interno
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),

      // Bordes y estados
      enabledBorder: _buildBorder(
        color: AppTheme.kCharcoalLight.withAlpha((0.6 * 255).round()),
      ),
      focusedBorder: _buildBorder(color: accentColor, width: 2.0),
      errorBorder: _buildBorder(color: AppTheme.kAccentColor, width: 1.5),
      focusedErrorBorder: _buildBorder(
        color: AppTheme.kAccentColor,
        width: 2.0,
      ),
      disabledBorder: _buildBorder(
        color: AppTheme.kCharcoalLight.withAlpha((0.3 * 255).round()),
      ),

      // Color de fondo
      filled: true,
      fillColor: enabled
          ? backgroundColor
          : backgroundColor.withAlpha((0.5 * 255).round()),

      // Estilo de error
      errorStyle: context.caption.copyWith(
        color: AppTheme.kAccentColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  /// Construye el borde del campo
  OutlineInputBorder _buildBorder({required Color color, double width = 1.0}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  /// Validador por defecto
  String? _defaultValidator(PhoneNumber? phoneNumber) {
    if (phoneNumber == null || phoneNumber.international.isEmpty) {
      return null; // Campo opcional
    }

    if (!phoneNumber.isValid()) {
      return 'Número de teléfono inválido';
    }

    return null;
  }
}
