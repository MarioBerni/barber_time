import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../../../../core/theme/app_design_constants.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/widgets/backgrounds/animated_gradient_background.dart';
import '../../../../core/widgets/buttons/buttons.dart';
import '../../../../core/widgets/buttons/enhanced_button.dart';
import '../../../../core/widgets/spacers/app_spacers.dart';
import '../bloc/profile_cubit.dart';
import '../bloc/profile_state.dart';
import 'registration/confirmation_dialog.dart';

/// Formulario moderno de registro para barberías
/// Diseño premium con animaciones y validaciones robustas
class BusinessRegistrationForm extends StatefulWidget {
  /// Constructor
  const BusinessRegistrationForm({super.key});

  @override
  State<BusinessRegistrationForm> createState() =>
      _BusinessRegistrationFormState();
}

class _BusinessRegistrationFormState extends State<BusinessRegistrationForm>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _businessNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = PhoneController(
    initialValue: PhoneNumber.parse('+598'),
  );

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _loadExistingData();
    _initializeAnimations();
  }

  @override
  void dispose() {
    _businessNameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  /// Inicializa las animaciones
  void _initializeAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    _animationController.forward();
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
    showDialog<void>(
      context: context,
      builder: (dialogContext) => ConfirmationDialog(
        formData: {
          'Nombre de Barbería': _businessNameController.text,
          'Dirección': _addressController.text,
          'Teléfono': _phoneController.value.international,
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

        // Navegar de vuelta usando el cubit
        context.read<ProfileCubit>().backToUserTypeSelection();

        // Mostrar mensaje de éxito
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('¡Barbería registrada exitosamente!'),
            backgroundColor: AppTheme.kPrimaryColor,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppDesignConstants.borderRadiusMD,
              ),
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Fondo animado
          AnimatedGradientBackground(
            primaryColor: AppTheme.kBackgroundColor,
            secondaryColor: AppTheme.kSurfaceColor,
            lineCount: 20,
          ),

          // Overlay sutil
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppTheme.kBackgroundColor.withAlpha(102),
                  AppTheme.kBackgroundColor.withAlpha(51),
                  AppTheme.kBackgroundColor.withAlpha(102),
                ],
              ),
            ),
          ),

          // Contenido principal
          SafeArea(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Column(
                  children: [
                    // Botón de retorno
                    _buildBackButton(),

                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(24.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Header premium
                              _buildHeader(),
                              AppSpacers.xl,

                              // Progreso visual
                              _buildProgressIndicator(),
                              AppSpacers.lg,

                              // Formulario
                              _buildForm(),
                              AppSpacers.xl,

                              // Botón de envío
                              _buildSubmitButton(),
                              AppSpacers.lg,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Construye el botón de retorno
  Widget _buildBackButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0),
      child: Row(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppTheme.kSurfaceColor.withAlpha(204),
              borderRadius: BorderRadius.circular(
                AppDesignConstants.borderRadiusMD,
              ),
              border: Border.all(color: AppTheme.kPrimaryColor.withAlpha(77)),
              boxShadow: AppDesignConstants.shadowSubtle,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(
                  AppDesignConstants.borderRadiusMD,
                ),
                onTap: () {
                  // Navegar hacia atrás usando el cubit
                  context.read<ProfileCubit>().backToUserTypeSelection();
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.arrow_back_ios_rounded,
                        color: AppTheme.kPrimaryColor,
                        size: 20,
                      ),
                      AppSpacers.hXs,
                      Text(
                        'Volver',
                        style: context.bodyMedium.copyWith(
                          color: AppTheme.kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Construye el header premium
  Widget _buildHeader() {
    return Column(
      children: [
        // Icono premium
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppTheme.kPrimaryColor, AppTheme.kPrimaryLightColor],
            ),
            borderRadius: BorderRadius.circular(
              AppDesignConstants.borderRadiusXL,
            ),
            boxShadow: AppDesignConstants.shadowPronounced,
          ),
          child: Icon(Icons.store_rounded, color: Colors.white, size: 40),
        ),
        AppSpacers.lg,

        // Título
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [AppTheme.kPrimaryColor, AppTheme.kPrimaryLightColor],
          ).createShader(bounds),
          child: Text(
            'Registra tu Barbería',
            style: context.h1.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 32,
              letterSpacing: 0.8,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        AppSpacers.sm,

        // Subtítulo
        Text(
          'Únete a nuestra red y conecta con más clientes',
          style: context.bodyLarge.copyWith(
            color: AppTheme.kOffWhite,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  /// Construye el indicador de progreso
  Widget _buildProgressIndicator() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.kSurfaceColor.withAlpha(77),
        borderRadius: BorderRadius.circular(AppDesignConstants.borderRadiusLG),
        border: Border.all(color: AppTheme.kPrimaryColor.withAlpha(51)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.check_circle, color: AppTheme.kPrimaryColor, size: 20),
              AppSpacers.hSm,
              Expanded(
                child: Text(
                  'Paso 1 de 1: Información del negocio',
                  style: context.bodyMedium.copyWith(
                    color: AppTheme.kOffWhite,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          AppSpacers.sm,
          LinearProgressIndicator(
            value: 1.0,
            backgroundColor: AppTheme.kSurfaceColor.withAlpha(77),
            valueColor: AlwaysStoppedAnimation<Color>(AppTheme.kPrimaryColor),
            borderRadius: BorderRadius.circular(
              AppDesignConstants.borderRadiusXS,
            ),
          ),
        ],
      ),
    );
  }

  /// Construye el formulario
  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Título de sección
        Text(
          'Información del Negocio',
          style: context.titleLarge.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
        AppSpacers.md,

        // Campo Nombre de Barbería
        _buildTextField(
          controller: _businessNameController,
          label: 'Nombre de Barbería',
          hint: 'Ej: Barbería Premium',
          icon: Icons.store_outlined,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'El nombre de la barbería es requerido';
            }
            if (value.length < 3) {
              return 'El nombre debe tener al menos 3 caracteres';
            }
            return null;
          },
          onChanged: (value) => _updateField('businessName', value),
        ),
        AppSpacers.md,

        // Campo Dirección
        _buildTextField(
          controller: _addressController,
          label: 'Dirección',
          hint: 'Ej: Av. 18 de Julio 1234, Montevideo',
          icon: Icons.location_on_outlined,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'La dirección es requerida';
            }
            if (value.length < 10) {
              return 'La dirección debe ser más específica';
            }
            return null;
          },
          onChanged: (value) => _updateField('address', value),
        ),
        AppSpacers.md,

        // Campo Teléfono
        _buildPhoneField(),
      ],
    );
  }

  /// Construye un campo de texto personalizado
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required String? Function(String?) validator,
    required void Function(String) onChanged,
  }) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDesignConstants.borderRadiusLG),
        boxShadow: AppDesignConstants.shadowSubtle,
      ),
      child: TextFormField(
        controller: controller,
        style: context.bodyLarge.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(icon, color: AppTheme.kPrimaryColor),
          labelStyle: context.bodyMedium.copyWith(
            color: AppTheme.kOffWhite,
            fontWeight: FontWeight.w500,
          ),
          hintStyle: context.bodyMedium.copyWith(
            color: AppTheme.kOffWhite.withAlpha(128),
          ),
          filled: true,
          fillColor: AppTheme.kSurfaceColor.withAlpha(204),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppDesignConstants.borderRadiusLG,
            ),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppDesignConstants.borderRadiusLG,
            ),
            borderSide: BorderSide(color: AppTheme.kPrimaryColor.withAlpha(77)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppDesignConstants.borderRadiusLG,
            ),
            borderSide: BorderSide(color: AppTheme.kPrimaryColor, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppDesignConstants.borderRadiusLG,
            ),
            borderSide: BorderSide(color: Colors.red.withAlpha(179)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppDesignConstants.borderRadiusLG,
            ),
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
          errorStyle: context.bodySmall.copyWith(
            color: Colors.red.withAlpha(204),
            fontWeight: FontWeight.w500,
          ),
        ),
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }

  /// Construye el campo de teléfono
  Widget _buildPhoneField() {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDesignConstants.borderRadiusLG),
        boxShadow: AppDesignConstants.shadowSubtle,
      ),
      child: PhoneFormField(
        controller: _phoneController,
        decoration: InputDecoration(
          labelText: 'Teléfono',
          hintText: '+598 9X XXX XXX',
          prefixIcon: Icon(Icons.phone_outlined, color: AppTheme.kPrimaryColor),
          labelStyle: context.bodyMedium.copyWith(
            color: AppTheme.kOffWhite,
            fontWeight: FontWeight.w500,
          ),
          hintStyle: context.bodyMedium.copyWith(
            color: AppTheme.kOffWhite.withAlpha(128),
          ),
          filled: true,
          fillColor: AppTheme.kSurfaceColor.withAlpha(204),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppDesignConstants.borderRadiusLG,
            ),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppDesignConstants.borderRadiusLG,
            ),
            borderSide: BorderSide(color: AppTheme.kPrimaryColor.withAlpha(77)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppDesignConstants.borderRadiusLG,
            ),
            borderSide: BorderSide(color: AppTheme.kPrimaryColor, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppDesignConstants.borderRadiusLG,
            ),
            borderSide: BorderSide(color: Colors.red.withAlpha(179)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppDesignConstants.borderRadiusLG,
            ),
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
          errorStyle: context.bodySmall.copyWith(
            color: Colors.red.withAlpha(204),
            fontWeight: FontWeight.w500,
          ),
        ),
        validator: (value) {
          if (value == null || !value.isValid()) {
            return 'El teléfono es requerido';
          }
          return null;
        },
        onChanged: (value) {
          _updateField('phone', value.international);
        },
      ),
    );
  }

  /// Construye el botón de envío usando el sistema centralizado
  Widget _buildSubmitButton() {
    return EnhancedButton(
      text: _isSubmitting ? 'Registrando barbería...' : 'Registrar mi barbería',
      onPressed: _isFormValid() && !_isSubmitting
          ? _showConfirmationDialog
          : null,
      isLoading: _isSubmitting,
      isEnabled: _isFormValid() && !_isSubmitting,
      icon: _isSubmitting ? null : Icons.store_rounded,
      height: 60,
      borderRadius: AppDesignConstants.borderRadiusLG,
      textColor: Colors.white,
    );
  }
}
