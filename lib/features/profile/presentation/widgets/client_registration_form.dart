import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/widgets/forms/info_card.dart';
import '../../../../core/widgets/spacers/spacers.dart';
import '../bloc/profile_cubit.dart';
import '../bloc/profile_state.dart';
import 'registration/confirmation_dialog.dart';
import 'registration/submit_button.dart';

/// Formulario simplificado de registro para clientes
/// Solicita solo la información esencial para agilizar el proceso
class ClientRegistrationForm extends StatefulWidget {
  /// Estado del perfil para mostrar datos existentes
  final ProfileClientRegistration state;

  /// Constructor
  const ClientRegistrationForm({super.key, required this.state});

  @override
  State<ClientRegistrationForm> createState() => _ClientRegistrationFormState();
}

class _ClientRegistrationFormState extends State<ClientRegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = PhoneController(
    initialValue: PhoneNumber.parse('+598'),
  );

  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _loadExistingData();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  /// Carga datos existentes del estado
  void _loadExistingData() {
    final existingFirstName = widget.state.formData['firstName'];
    if (existingFirstName != null && existingFirstName.isNotEmpty) {
      _firstNameController.text = existingFirstName;
    }

    final existingLastName = widget.state.formData['lastName'];
    if (existingLastName != null && existingLastName.isNotEmpty) {
      _lastNameController.text = existingLastName;
    }

    if (widget.state.formData['phone']?.isNotEmpty == true) {
      try {
        _phoneController.value = PhoneNumber.parse(
          widget.state.formData['phone']!,
        );
      } catch (e) {
        _phoneController.value = PhoneNumber.parse('+598');
      }
    }
  }

  /// Actualiza un campo del formulario
  void _updateField(String field, String value) {
    context.read<ProfileCubit>().updateClientFormField(field, value);
  }

  /// Verifica si el formulario es válido
  bool _isFormValid() {
    return _formKey.currentState?.validate() == true &&
        _firstNameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty &&
        _phoneController.value.isValid();
  }

  /// Muestra el diálogo de confirmación
  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) => ConfirmationDialog(
        formData: {
          'Nombre': _firstNameController.text,
          'Apellido': _lastNameController.text,
          'Teléfono': _phoneController.value.international ?? '',
        },
        onConfirm: _submitForm,
      ),
    );
  }

  /// Envía el formulario
  void _submitForm() {
    if (!_isFormValid()) return;

    setState(() {
      _isSubmitting = true;
    });

    // Simular envío
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });

        // Navegar de vuelta o mostrar éxito
        Navigator.of(context).pop();

        // Mostrar mensaje de éxito
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Perfil actualizado correctamente'),
            backgroundColor: Colors.green,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpacers.lg,

              // Título
              Text(
                'Completa tu Perfil',
                style: context.textTheme.headlineMedium?.copyWith(
                  color: context.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),

              AppSpacers.sm,

              Text(
                'Cuéntanos un poco sobre ti para personalizar tu experiencia',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.secondaryTextColor,
                ),
              ),

              AppSpacers.lg,

              // Información del formulario
              InfoCard.info(
                message: 'Solo necesitamos algunos datos básicos para comenzar',
                icon: Icons.person_outline,
              ),

              AppSpacers.md,

              // Campos del formulario
              Text(
                'Datos Personales',
                style: context.textTheme.headlineSmall?.copyWith(
                  color: context.textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),

              AppSpacers.sm,

              // Nombre
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  hintText: 'Tu nombre',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El nombre es requerido';
                  }
                  return null;
                },
                onChanged: (value) => _updateField('firstName', value),
              ),

              AppSpacers.sm,

              // Apellido
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  labelText: 'Apellido',
                  hintText: 'Tu apellido',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El apellido es requerido';
                  }
                  return null;
                },
                onChanged: (value) => _updateField('lastName', value),
              ),

              AppSpacers.sm,

              // Teléfono
              TextFormField(
                controller: TextEditingController(
                  text: _phoneController.value.international ?? '',
                ),
                decoration: InputDecoration(
                  labelText: 'Teléfono',
                  hintText: '+598 9X XXX XXX',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El teléfono es requerido';
                  }
                  return null;
                },
                onChanged: (value) => _updateField('phone', value),
              ),

              AppSpacers.xl,

              // Botón de envío
              SubmitButton(
                text: 'Completar Registro',
                isLoading: _isSubmitting,
                isEnabled: _isFormValid(),
                onPressed: _showConfirmationDialog,
              ),

              AppSpacers.lg,
            ],
          ),
        ),
      ),
    );
  }
}
