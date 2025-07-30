import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/widgets/backgrounds/animated_gradient_background.dart';
import '../../../../core/widgets/inputs/themed_text_field.dart';
import '../bloc/profile_cubit.dart';
import '../bloc/profile_state.dart';

/// Formulario de registro para nuevos clientes
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
  late final TextEditingController _phoneController;

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
    _phoneController = TextEditingController(
      text: widget.state.formData['phone'] ?? '',
    );
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
      appBar: _buildPremiumAppBar(context),
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
                  _buildPremiumHeader(context),

                  const SizedBox(height: 40),

                  // Formulario con contenedor elegante
                  _buildPremiumForm(context),

                  const SizedBox(height: 32),

                  // Botón premium
                  _buildPremiumSubmitButton(context),

                  // Mensaje de error si existe
                  if (widget.state.registrationError != null) ...[
                    const SizedBox(height: 24),
                    _buildPremiumErrorMessage(context),
                  ],

                  const SizedBox(height: 32), // Espacio final
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Construye la AppBar premium con estilo de Home
  PreferredSizeWidget _buildPremiumAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: AppTheme.kOffWhite,
      title: Text(
        'Crear Cuenta',
        style: context.titleLarge.copyWith(
          color: AppTheme.kOffWhite,
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppTheme.kSurfaceColor.withAlpha((0.7 * 255).round()),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.kPrimaryDarkColor.withAlpha(102)),
        ),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: AppTheme.kOffWhite,
            size: 20,
          ),
          onPressed: () =>
              context.read<ProfileCubit>().backToUserTypeSelection(),
        ),
      ),
    );
  }

  /// Construye el header premium con tipografía elegante
  Widget _buildPremiumHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.kSurfaceColor.withAlpha((0.3 * 255).round()),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.kPrimaryColor.withAlpha((0.2 * 255).round()),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icono y título en fila
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppTheme.kPrimaryColor,
                      AppTheme.kPrimaryDarkColor,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.kPrimaryColor.withAlpha(
                        (0.3 * 255).round(),
                      ),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.content_cut_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [
                      AppTheme.kPrimaryColor,
                      AppTheme.kPrimaryLightColor,
                      AppTheme.kAccentColor,
                    ],
                    stops: const [0.0, 0.7, 1.0],
                  ).createShader(bounds),
                  child: Text(
                    'Barber Time',
                    style: context.h1.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                      fontSize: 26,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Subtítulo elegante
          Text(
            'Descubre las mejores barberías y personaliza tu experiencia premium',
            style: context.bodyLarge.copyWith(
              color: AppTheme.kOffWhite,
              fontWeight: FontWeight.w500,
              height: 1.4,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 8),

          // Punto destacado
          Row(
            children: [
              Icon(Icons.star_rounded, color: AppTheme.kPrimaryColor, size: 16),
              const SizedBox(width: 6),
              Text(
                'Completa tus datos para comenzar',
                style: context.bodyMedium.copyWith(
                  color: AppTheme.kPrimaryColor,
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Construye el formulario premium con efectos visuales
  Widget _buildPremiumForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        // Fondo más sólido para mejor contraste
        color: AppTheme.kSurfaceColor.withAlpha((0.9 * 255).round()),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppTheme.kPrimaryColor.withAlpha((0.3 * 255).round()),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.3 * 255).round()),
            blurRadius: 30,
            offset: const Offset(0, 12),
          ),
          // Sombra turquesa sutil
          BoxShadow(
            color: AppTheme.kPrimaryColor.withAlpha((0.1 * 255).round()),
            blurRadius: 15,
            offset: const Offset(0, -3),
          ),
          // Resplandor interior
          BoxShadow(
            color: AppTheme.kPrimaryLightColor.withAlpha((0.05 * 255).round()),
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          // Título del formulario
          Row(
            children: [
              Icon(Icons.edit_rounded, color: AppTheme.kPrimaryColor, size: 20),
              const SizedBox(width: 8),
              Text(
                'Información Personal',
                style: context.titleMedium.copyWith(
                  color: AppTheme.kOffWhite,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Campo de nombre con estilo premium
          ThemedTextField(
            controller: _nameController,
            labelText: 'Nombre completo',
            hintText: 'Ej: Juan Pérez',
            prefixIcon: Icons.person_outline_rounded,
            showValidation: true,
            validator: (value) => widget.state.fieldErrors['name'],
            accentColor: AppTheme.kPrimaryColor,
            backgroundColor: AppTheme.kCharcoalDark,
            onChanged: (value) {
              context.read<ProfileCubit>().updateClientFormField('name', value);
            },
          ),

          const SizedBox(height: 20),

          // Campo de email con estilo premium
          ThemedTextField(
            controller: _emailController,
            labelText: 'Correo electrónico',
            hintText: 'ejemplo@correo.com',
            prefixIcon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            showValidation: true,
            validator: (value) => widget.state.fieldErrors['email'],
            accentColor: AppTheme.kPrimaryColor,
            backgroundColor: AppTheme.kCharcoalDark,
            onChanged: (value) {
              context.read<ProfileCubit>().updateClientFormField(
                'email',
                value,
              );
            },
          ),

          const SizedBox(height: 20),

          // Campo de teléfono (opcional) con estilo premium
          ThemedTextField(
            controller: _phoneController,
            labelText: 'Teléfono (opcional)',
            hintText: '+598 99 123 456',
            prefixIcon: Icons.phone_outlined,
            keyboardType: TextInputType.phone,
            showValidation: true,
            validator: (value) => widget.state.fieldErrors['phone'],
            accentColor: AppTheme.kPrimaryColor,
            backgroundColor: AppTheme.kCharcoalDark,
            onChanged: (value) {
              context.read<ProfileCubit>().updateClientFormField(
                'phone',
                value,
              );
            },
          ),

          const SizedBox(height: 20),

          // Divider decorativo
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        AppTheme.kMediumGold.withAlpha(
                          (0.4 * 255).round(),
                        ), // Toque dorado sutil
                        AppTheme.kPrimaryColor.withAlpha(
                          (0.2 * 255).round(),
                        ), // Turquesa sutil
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.3, 0.7, 1.0],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Icon(
                  Icons.auto_awesome_rounded,
                  color: AppTheme.kMediumGold, // Estrella dorada premium
                  size: 16,
                ),
              ),
              Expanded(
                child: Container(
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        AppTheme.kMediumGold.withAlpha(
                          (0.4 * 255).round(),
                        ), // Toque dorado sutil
                        AppTheme.kPrimaryColor.withAlpha(
                          (0.2 * 255).round(),
                        ), // Turquesa sutil
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.3, 0.7, 1.0],
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Nota informativa
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.kPrimaryColor.withAlpha((0.1 * 255).round()),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppTheme.kPrimaryColor.withAlpha((0.2 * 255).round()),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline_rounded,
                  color: AppTheme.kPrimaryColor,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Tus datos están protegidos y serán usados solo para mejorar tu experiencia.',
                    style: context.caption.copyWith(
                      color: AppTheme.kPrimaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Construye el botón premium con efectos visuales
  Widget _buildPremiumSubmitButton(BuildContext context) {
    final isFormValid = _isFormValid();
    final isSubmitting = widget.state.isSubmitting;

    return Container(
      width: double.infinity,
      height: 58,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: isFormValid
            ? LinearGradient(
                colors: [AppTheme.kMediumGold, AppTheme.kDarkGold],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: isFormValid
            ? null
            : AppTheme.kCharcoalLight, // Estado deshabilitado más visible
        border: isFormValid
            ? Border.all(
                color: AppTheme.kMediumGold.withAlpha((0.4 * 255).round()),
                width: 1.5,
              )
            : Border.all(
                color: AppTheme.kPrimaryColor.withAlpha((0.3 * 255).round()),
              ),
        boxShadow: isFormValid
            ? [
                BoxShadow(
                  color: AppTheme.kPrimaryColor.withAlpha((0.5 * 255).round()),
                  blurRadius: 25,
                  offset: const Offset(0, 10),
                ),
                BoxShadow(
                  color: AppTheme.kDarkGold.withAlpha((0.3 * 255).round()),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
                // Resplandor dorado sutil
                BoxShadow(
                  color: AppTheme.kLightGold.withAlpha((0.1 * 255).round()),
                  blurRadius: 40,
                ),
              ]
            : [
                BoxShadow(
                  color: Colors.black.withAlpha((0.1 * 255).round()),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
      ),
      child: ElevatedButton(
        onPressed: (isFormValid && !isSubmitting)
            ? () => context.read<ProfileCubit>().submitClientRegistration()
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          elevation: 0,
        ),
        child: isSubmitting
            ? SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(AppTheme.kOffWhite),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.auto_awesome_rounded,
                    size: 20,
                    color: isFormValid
                        ? Colors.white
                        : AppTheme.kOffWhite.withAlpha((0.8 * 255).round()),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Comenzar Experiencia Premium',
                    style: context.button.copyWith(
                      color: isFormValid
                          ? Colors.white
                          : AppTheme.kOffWhite.withAlpha((0.8 * 255).round()),
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      letterSpacing: 0.8,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  /// Construye el mensaje de error premium
  Widget _buildPremiumErrorMessage(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.kAccentColor.withAlpha((0.1 * 255).round()),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.kAccentColor.withAlpha((0.4 * 255).round()),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.kAccentColor.withAlpha((0.1 * 255).round()),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.kAccentColor.withAlpha((0.2 * 255).round()),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.warning_rounded,
              color: AppTheme.kAccentColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              widget.state.registrationError!,
              style: context.bodyMedium.copyWith(
                color: AppTheme.kAccentColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Verifica si el formulario es válido para habilitar el botón
  bool _isFormValid() {
    final formData = widget.state.formData;
    final name = formData['name']?.trim() ?? '';
    final email = formData['email']?.trim() ?? '';

    return name.isNotEmpty &&
        email.isNotEmpty &&
        widget.state.fieldErrors.isEmpty;
  }
}
