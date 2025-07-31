import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../../../../core/utils/form_validation_helper.dart';
import '../../../../core/widgets/containers/containers.dart';
import '../../../../core/widgets/forms/form_section.dart';
import '../../../../core/widgets/forms/info_card.dart';
import '../../../../core/widgets/inputs/enhanced_text_field.dart';
import '../../../../core/widgets/inputs/themed_phone_field.dart';
import '../../../../core/widgets/spacers/spacers.dart';
import '../bloc/profile_cubit.dart';
import '../bloc/profile_state.dart';
import 'registration/confirmation_dialog.dart';
import 'registration/continue_divider.dart';
import 'registration/google_signup_button.dart';
import 'registration/submit_button.dart';

/// Formulario de registro para nuevos clientes - Versión Refactorizada
class ClientRegistrationForm extends StatefulWidget {
  /// Estado del registro de cliente
  final ProfileClientRegistration state;

  /// Constructor
  const ClientRegistrationForm({super.key, required this.state});

  @override
  State<ClientRegistrationForm> createState() => _ClientRegistrationFormState();
}

class _ClientRegistrationFormState extends State<ClientRegistrationForm> {
  // Controladores para los campos de texto
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final PhoneController _phoneController;

  @override
  void initState() {
    super.initState();

    // Inicializar controladores con datos existentes del estado
    _nameController = TextEditingController(
      text: widget.state.formData['name'] ?? '',
    );
    _emailController = TextEditingController(
      text: widget.state.formData['email'] ?? '',
    );

    // Inicializar controlador de teléfono con Uruguay por defecto
    _phoneController = PhoneController();

    // Establecer valor inicial si existe
    final phoneValue = widget.state.formData['phone'];
    if (phoneValue?.isNotEmpty == true) {
      try {
        _phoneController.value = PhoneNumber.parse(phoneValue!);
      } catch (e) {
        // Si hay error en el parsing, usar valor por defecto
        _phoneController.value = PhoneNumber.parse('+598');
      }
    } else {
      // Establecer Uruguay por defecto
      _phoneController.value = PhoneNumber.parse('+598');
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RegistrationScaffold(
      title: 'Crear tu cuenta',
      onBackPressed: () =>
          context.read<ProfileCubit>().backToUserTypeSelection(),
      child: _buildForm(context),
    );
  }

  /// Construye el formulario sin contenedor
  Widget _buildForm(BuildContext context) {
    return Column(
      children: [
        // Opción de Google
        GoogleSignUpButton(onPressed: _handleGoogleSignUp),

        const SizedBox(height: 24),

        // Divider elegante
        const ContinueDivider(),

        const SizedBox(height: 24),

        // Sección de información personal
        AppContainers.card(
          child: FormSection(
            title: 'Información Personal',
            description: 'Completa tus datos para crear tu cuenta',
            icon: Icons.person_outline,
            child: Column(
              children: [
                // Campo de nombre
                EnhancedTextField(
                  controller: _nameController,
                  labelText: 'Nombre completo',
                  hintText: 'Juan Pérez',
                  prefixIcon: Icons.person_outline,
                  isRequired: true,
                  validator: (value) => FormValidationHelper.validateRequired(
                    value,
                    'Nombre completo',
                  ),
                  onChanged: (value) => _updateField('name', value),
                ),

                AppSpacers.md,

                // Campo de email
                EnhancedTextField(
                  controller: _emailController,
                  labelText: 'Email',
                  hintText: 'juan@ejemplo.com',
                  prefixIcon: Icons.email_outlined,
                  isRequired: true,
                  keyboardType: TextInputType.emailAddress,
                  validator: FormValidationHelper.validateEmail,
                  onChanged: (value) => _updateField('email', value),
                ),
              ],
            ),
          ),
        ),

        // Sección de WhatsApp
        AppContainers.glass(
          child: FormSection(
            title: 'Número de WhatsApp (Recomendado)',
            description:
                'Para notificaciones de citas y promociones exclusivas',
            icon: Icons.phone_outlined,
            child: ThemedPhoneField(
              controller: _phoneController,
              labelText: 'WhatsApp',
              hintText: 'Número de WhatsApp',
              prefixIcon: Icons.phone_outlined,
              showValidation: true,
              validator: (value) =>
                  value?.isValid() == false ? 'Número inválido' : null,
              onChanged: (phoneNumber) =>
                  _updateField('phone', phoneNumber.international ?? ''),
            ),
          ),
        ),

        AppSpacers.xl,

        // Botón de envío
        SubmitButton(
          isEnabled: _isFormValid(),
          isLoading: widget.state.isSubmitting,
          onPressed: _showConfirmationDialog,
        ),

        // Mensaje de error
        if (widget.state.registrationError?.isNotEmpty == true) ...[
          AppSpacers.md,
          AppContainers.bordered(
            borderColor: Colors.red.withAlpha(100),
            child: InfoCard.error(
              message: widget.state.registrationError!,
              icon: Icons.error_outline,
            ),
          ),
        ],
      ],
    );
  }

  /// Valida si el formulario es válido
  bool _isFormValid() {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();

    // Validar nombre
    if (name.isEmpty) return false;

    // Validar email
    if (email.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      return false;
    }

    return true;
  }

  /// Maneja el registro con Google
  void _handleGoogleSignUp() {
    // TODO: Implementar lógica de Google Sign-Up
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Google Sign-Up próximamente')),
    );
  }

  /// Actualiza los datos del formulario
  void _updateField(String key, String value) {
    context.read<ProfileCubit>().updateClientFormField(key, value);
  }

  /// Muestra el diálogo de confirmación
  Future<void> _showConfirmationDialog() async {
    final formData = {
      'name': _nameController.text.trim(),
      'email': _emailController.text.trim(),
      'phone': _phoneController.value.international,
    };

    final result = await ConfirmationDialog.show(context, formData: formData);

    if (result == true && mounted) {
      context.read<ProfileCubit>().submitClientRegistration();
    }
  }
}
