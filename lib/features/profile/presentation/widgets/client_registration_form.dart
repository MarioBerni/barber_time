import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/backgrounds/animated_gradient_background.dart';
import '../bloc/profile_cubit.dart';
import '../bloc/profile_state.dart';
import 'registration/confirmation_dialog.dart';
import 'registration/continue_divider.dart';
import 'registration/error_message.dart';
import 'registration/google_signup_button.dart';
import 'registration/manual_form_section.dart';
import 'registration/premium_app_bar.dart';
import 'registration/registration_header.dart';
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
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: PremiumAppBar(
        onBack: () => context.read<ProfileCubit>().backToUserTypeSelection(),
      ),
      body: Stack(
        children: [
          // Fondo con gradiente premium como Home
          AnimatedGradientBackground(
            primaryColor: AppTheme.kBackgroundColor,
            secondaryColor: AppTheme.kSurfaceColor,
            showBouncingCircles: false,
            lineOpacity: 0.03,
            lineCount: 25,
          ),

          // Contenido principal
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24), // Espacio para el AppBar
                  // Header premium
                  const RegistrationHeader(),

                  const SizedBox(height: 40),

                  // Formulario premium modular
                  _buildModularForm(context),

                  const SizedBox(height: 28),

                  // Botón de envío modular
                  SubmitButton(
                    isEnabled: _isFormValid(),
                    isLoading: widget.state.isSubmitting,
                    onPressed: _showConfirmationDialog,
                  ),

                  // Mensaje de error modular
                  ErrorMessage(message: widget.state.registrationError ?? ''),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Construye el formulario modular
  Widget _buildModularForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppTheme.kSurfaceColor.withAlpha((0.95 * 255).round()),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppTheme.kPrimaryColor.withAlpha((0.3 * 255).round()),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.3 * 255).round()),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
          BoxShadow(
            color: AppTheme.kPrimaryColor.withAlpha((0.1 * 255).round()),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Column(
        children: [
          // Opción de Google
          GoogleSignUpButton(onPressed: _handleGoogleSignUp),

          // Divider elegante
          const ContinueDivider(),

          // Formulario manual
          ManualFormSection(
            nameController: _nameController,
            emailController: _emailController,
            phoneController: _phoneController,
            onNameChanged: _updateFormData,
            onEmailChanged: _updateFormData,
            onPhoneChanged: _updatePhoneData,
          ),
        ],
      ),
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
  void _updateFormData(String value) {
    // Los cambios se reflejan automáticamente en los controladores
    setState(() {}); // Trigger rebuild para validación
  }

  /// Actualiza los datos del teléfono
  void _updatePhoneData(PhoneNumber? phoneNumber) {
    // Los cambios se reflejan automáticamente en el controlador
    setState(() {}); // Trigger rebuild para validación
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
