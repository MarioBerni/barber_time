import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/theme/app_theme_extensions.dart';
import '../../../../../core/widgets/inputs/themed_phone_field.dart';
import '../../../../../core/widgets/inputs/themed_text_field.dart';

/// Sección del formulario manual con campos de registro
class ManualFormSection extends StatelessWidget {
  /// Controlador del nombre
  final TextEditingController nameController;

  /// Controlador del email
  final TextEditingController emailController;

  /// Controlador del teléfono
  final PhoneController phoneController;

  /// Callback cuando cambia el nombre
  final ValueChanged<String>? onNameChanged;

  /// Callback cuando cambia el email
  final ValueChanged<String>? onEmailChanged;

  /// Callback cuando cambia el teléfono
  final ValueChanged<PhoneNumber?>? onPhoneChanged;

  /// Constructor
  const ManualFormSection({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    this.onNameChanged,
    this.onEmailChanged,
    this.onPhoneChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Título de información personal
        _buildSectionTitle(context),

        const SizedBox(height: 24),

        // Campo de nombre
        ThemedTextField(
          controller: nameController,
          labelText: 'Nombre completo',
          hintText: 'Ingresa tu nombre y apellido',
          prefixIcon: Icons.person_outline_rounded,
          showValidation: true,
          validator: (value) =>
              value?.isEmpty == true ? 'El nombre es requerido' : null,
          accentColor: AppTheme.kPrimaryColor,
          backgroundColor: AppTheme.kSurfaceColor.withAlpha(
            (0.6 * 255).round(),
          ),
          onChanged: onNameChanged,
        ),

        const SizedBox(height: 20),

        // Campo de email
        ThemedTextField(
          controller: emailController,
          labelText: 'Email',
          hintText: 'tu.email@ejemplo.com',
          prefixIcon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
          showValidation: true,
          validator: (value) {
            if (value?.isEmpty == true) return 'El email es requerido';
            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value!)) {
              return 'Ingresa un email válido';
            }
            return null;
          },
          accentColor: AppTheme.kPrimaryColor,
          backgroundColor: AppTheme.kSurfaceColor.withAlpha(
            (0.6 * 255).round(),
          ),
          onChanged: onEmailChanged,
        ),

        const SizedBox(height: 20),

        // Descripción del WhatsApp
        _buildWhatsAppDescription(context),

        const SizedBox(height: 12),

        // Campo de teléfono
        ThemedPhoneField(
          controller: phoneController,
          labelText: 'WhatsApp',
          hintText: 'Número de WhatsApp',
          prefixIcon: Icons.phone_outlined,
          showValidation: true,
          validator: (value) {
            if (value == null || !value.isValid()) {
              return 'Ingresa un número válido';
            }
            return null;
          },
          accentColor: AppTheme.kPrimaryColor,
          backgroundColor: AppTheme.kSurfaceColor.withAlpha(
            (0.6 * 255).round(),
          ),
          onChanged: onPhoneChanged,
        ),

        const SizedBox(height: 32),

        // Información de seguridad
        _buildSecurityInfo(context),
      ],
    );
  }

  /// Construye el título de la sección
  Widget _buildSectionTitle(BuildContext context) {
    return Row(
      children: [
        // Icono contenedor
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppTheme.kPrimaryColor.withAlpha((0.2 * 255).round()),
                AppTheme.kPrimaryLightColor.withAlpha((0.1 * 255).round()),
              ],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.person_add_rounded,
            color: AppTheme.kPrimaryColor,
            size: 20,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Información Personal',
                style: context.h3.copyWith(
                  color: AppTheme.kOffWhite,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Completa tus datos para crear tu cuenta',
                style: context.bodySmall.copyWith(
                  color: AppTheme.kOffWhite.withAlpha((0.7 * 255).round()),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Construye la descripción del WhatsApp
  Widget _buildWhatsAppDescription(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.phone_outlined, color: AppTheme.kPrimaryColor, size: 16),
            const SizedBox(width: 8),
            Text(
              'Número de WhatsApp (Recomendado)',
              style: context.bodyMedium.copyWith(
                color: AppTheme.kOffWhite,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            'Para notificaciones de citas y promociones exclusivas',
            style: context.bodySmall.copyWith(
              color: AppTheme.kOffWhite.withAlpha((0.7 * 255).round()),
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  /// Construye la información de seguridad
  Widget _buildSecurityInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.kCharcoalDark.withAlpha((0.6 * 255).round()),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppTheme.kPrimaryColor.withAlpha((0.2 * 255).round()),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.kPrimaryColor.withAlpha((0.1 * 255).round()),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.security_rounded,
              color: AppTheme.kPrimaryColor,
              size: 16,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Datos protegidos',
                  style: context.bodyMedium.copyWith(
                    color: AppTheme.kOffWhite,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Tu información está encriptada y nunca será compartida '
                  'con terceros.',
                  style: context.caption.copyWith(
                    color: AppTheme.kPrimaryColor.withAlpha(
                      (0.8 * 255).round(),
                    ),
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
