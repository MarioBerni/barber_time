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
import 'registration/submit_button.dart';

/// Formulario simplificado de registro para barberías
/// Solicita solo la información esencial para agilizar el proceso
class BusinessRegistrationForm extends StatefulWidget {
  /// Constructor
  const BusinessRegistrationForm({super.key});

  @override
  State<BusinessRegistrationForm> createState() =>
      _BusinessRegistrationFormState();
}

class _BusinessRegistrationFormState extends State<BusinessRegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _businessNameController = TextEditingController();
  final _addressController = TextEditingController();
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
    _businessNameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  /// Carga datos existentes del estado
  void _loadExistingData() {
    final cubit = context.read<ProfileCubit>();
    final state = cubit.state;

    if (state is ProfileBusinessRegistration) {
      final existingName = state.formData['businessName'];
      if (existingName != null && existingName.isNotEmpty) {
        _businessNameController.text = existingName;
      }
      _addressController.text = state.formData['address'] ?? '';

      if (state.formData['phone']?.isNotEmpty == true) {
        try {
          _phoneController.value = PhoneNumber.parse(state.formData['phone']!);
        } catch (e) {
          _phoneController.value = PhoneNumber.parse('+598');
        }
      }
    }
  }

  /// Actualiza un campo del formulario
  void _updateField(String field, String value) {
    context.read<ProfileCubit>().updateBusinessFormField(field, value);
  }

  /// Verifica si el formulario es válido
  bool _isFormValid() {
    return _formKey.currentState?.validate() == true &&
        _businessNameController.text.isNotEmpty &&
        _addressController.text.isNotEmpty &&
        _phoneController.value.isValid();
  }

  /// Muestra el diálogo de confirmación
  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) => ConfirmationDialog(
        formData: {
          'Nombre de Barbería': _businessNameController.text,
          'Dirección': _addressController.text,
          'Teléfono': _phoneController.value.international ?? '',
        },
        onConfirm: _submitForm,
      ),
    );
  }

  /// Envía el formulario
  void _submitForm() {
    if (_formKey.currentState?.validate() == true) {
      setState(() {
        _isSubmitting = true;
      });

      final cubit = context.read<ProfileCubit>();

      // Guardar campos en el estado
      _updateField('businessName', _businessNameController.text);
      _updateField('address', _addressController.text);
      _updateField('phone', _phoneController.value.international ?? '');

      // Enviar formulario
      cubit.submitBusinessRegistration();
    }
  }

  @override
  Widget build(BuildContext context) {
    return RegistrationScaffold(
      title: 'Registra tu barbería',
      onBackPressed: () =>
          context.read<ProfileCubit>().backToUserTypeSelection(),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sección de información básica
            AppContainers.card(
              child: FormSection(
                title: 'Información Básica',
                description: 'Datos principales de tu barbería',
                icon: Icons.business,
                child: Column(
                  children: [
                    // Nombre de la barbería
                    EnhancedTextField(
                      labelText: 'Nombre de la barbería',
                      controller: _businessNameController,
                      prefixIcon: Icons.business,
                      isRequired: true,
                      validator: (value) =>
                          FormValidationHelper.validateRequired(
                            value,
                            'Nombre de la barbería',
                          ),
                      onChanged: (value) => _updateField('businessName', value),
                    ),

                    AppSpacers.md,

                    // Dirección
                    EnhancedTextField(
                      labelText: 'Dirección',
                      controller: _addressController,
                      prefixIcon: Icons.location_on,
                      isRequired: true,
                      validator: (value) =>
                          FormValidationHelper.validateRequired(
                            value,
                            'Dirección',
                          ),
                      onChanged: (value) => _updateField('address', value),
                    ),

                    AppSpacers.md,

                    // Teléfono de contacto
                    ThemedPhoneField(
                      labelText: 'Teléfono de contacto',
                      controller: _phoneController,
                      validator: (value) =>
                          value?.isValid() == false ? 'Número inválido' : null,
                      onChanged: (phoneNumber) => _updateField(
                        'phone',
                        phoneNumber.international ?? '',
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Nota informativa
            AppContainers.glass(
              child: InfoCard.info(
                message:
                    'Podrás añadir más información sobre tu barbería después del registro (fotos, personal, servicios, etc.).',
                icon: Icons.info_outline,
              ),
            ),

            AppSpacers.lg,

            // Botón de envío
            SubmitButton(
              text: _isSubmitting ? 'Registrando...' : 'Registrar Barbería',
              isEnabled: _isFormValid(),
              isLoading: _isSubmitting,
              onPressed: _showConfirmationDialog,
            ),
          ],
        ),
      ),
    );
  }
}
