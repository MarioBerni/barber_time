import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/widgets/backgrounds/animated_gradient_background.dart';
import '../../../../core/widgets/inputs/themed_phone_field.dart';
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
    return Column(
      children: [
        // Opción de registro con Google
        _buildGoogleSignUpOption(context),

        const SizedBox(height: 24),

        // Divider "O continúa con"
        _buildOrContinueWithDivider(context),

        const SizedBox(height: 24),

        // Formulario manual
        _buildManualForm(context),
      ],
    );
  }

  /// Construye la opción de registro con Google
  Widget _buildGoogleSignUpOption(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 64,
      decoration: BoxDecoration(
        color: AppTheme.kSurfaceColor.withAlpha((0.7 * 255).round()),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppTheme.kOffWhite.withAlpha((0.2 * 255).round()),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.1 * 255).round()),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          // TODO: Implementar registro con Google
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: AppTheme.kOffWhite,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Center(
                child: Text(
                  'G',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Continuar con Google',
              style: context.bodyLarge.copyWith(
                color: AppTheme.kOffWhite,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Construye el divider "O continúa con"
  Widget _buildOrContinueWithDivider(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  AppTheme.kOffWhite.withAlpha((0.3 * 255).round()),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'O continúa con tu email',
            style: context.bodySmall.copyWith(
              color: AppTheme.kOffWhite.withAlpha((0.7 * 255).round()),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  AppTheme.kOffWhite.withAlpha((0.3 * 255).round()),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Construye el formulario manual
  Widget _buildManualForm(BuildContext context) {
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
          // Título del formulario mejorado
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.kPrimaryColor.withAlpha((0.2 * 255).round()),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.edit_rounded,
                  color: AppTheme.kPrimaryColor,
                  size: 18,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Información Personal',
                      style: context.titleMedium.copyWith(
                        color: AppTheme.kOffWhite,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Completa tus datos para personalizar tu experiencia',
                      style: context.bodySmall.copyWith(
                        color: AppTheme.kOffWhite.withAlpha(
                          (0.7 * 255).round(),
                        ),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 28),

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

          const SizedBox(height: 22),

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

          const SizedBox(height: 22),

          // Campo de teléfono mejorado con nueva descripción
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.phone_outlined,
                    color: AppTheme.kPrimaryColor,
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Número de WhatsApp (Recomendado)',
                    style: context.bodySmall.copyWith(
                      color: AppTheme.kPrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Para notificaciones de citas y promociones exclusivas',
                style: context.caption.copyWith(
                  color: AppTheme.kOffWhite.withAlpha((0.6 * 255).round()),
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 12),
              ThemedPhoneField(
                controller: _phoneController,
                labelText: 'WhatsApp',
                hintText: '+598 99 123 456',
                showValidation: true,
                validator: (phoneNumber) => widget.state.fieldErrors['phone'],
                accentColor: AppTheme.kPrimaryColor,
                backgroundColor: AppTheme.kCharcoalDark,
                onChanged: (phoneNumber) {
                  context.read<ProfileCubit>().updateClientFormField(
                    'phone',
                    phoneNumber.international,
                  );
                },
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Nota informativa mejorada
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppTheme.kPrimaryColor.withAlpha((0.08 * 255).round()),
                  AppTheme.kPrimaryColor.withAlpha((0.05 * 255).round()),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
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
                    color: AppTheme.kPrimaryColor.withAlpha(
                      (0.2 * 255).round(),
                    ),
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
                        style: context.bodySmall.copyWith(
                          color: AppTheme.kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Tu información está encriptada y nunca será compartida con terceros.',
                        style: context.caption.copyWith(
                          color: AppTheme.kPrimaryColor.withAlpha(
                            (0.8 * 255).round(),
                          ),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Construye el botón premium con efectos visuales mejorados
  Widget _buildPremiumSubmitButton(BuildContext context) {
    final isFormValid = _isFormValid();
    final isSubmitting = widget.state.isSubmitting;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: double.infinity,
      height: 62, // Ligeramente más alto para mejor presencia
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: isFormValid
            ? LinearGradient(
                colors: [
                  AppTheme.kMediumGold,
                  AppTheme.kDarkGold,
                  AppTheme.kMediumGold,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.0, 0.5, 1.0],
              )
            : null,
        color: isFormValid ? null : AppTheme.kCharcoalLight,
        border: isFormValid
            ? Border.all(
                color: AppTheme.kLightGold.withAlpha((0.6 * 255).round()),
                width: 2.0,
              )
            : Border.all(
                color: AppTheme.kPrimaryColor.withAlpha((0.3 * 255).round()),
              ),
        boxShadow: isFormValid
            ? [
                // Sombra principal
                BoxShadow(
                  color: AppTheme.kDarkGold.withAlpha((0.6 * 255).round()),
                  blurRadius: 30,
                  offset: const Offset(0, 12),
                  spreadRadius: 2,
                ),
                // Resplandor turquesa
                BoxShadow(
                  color: AppTheme.kPrimaryColor.withAlpha((0.3 * 255).round()),
                  blurRadius: 20,
                  offset: const Offset(0, 6),
                ),
                // Resplandor dorado intenso
                BoxShadow(
                  color: AppTheme.kLightGold.withAlpha((0.15 * 255).round()),
                  blurRadius: 50,
                  spreadRadius: 5,
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: (isFormValid && !isSubmitting)
              ? () => _showConfirmationDialog(context)
              : null,
          child: DecoratedBox(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: isSubmitting
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 3.0,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppTheme.kOffWhite,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Creando cuenta...',
                          style: context.button.copyWith(
                            color: AppTheme.kOffWhite,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: Icon(
                            isFormValid
                                ? Icons.rocket_launch_rounded
                                : Icons.edit_rounded,
                            size: 22,
                            color: isFormValid
                                ? Colors.white
                                : AppTheme.kOffWhite.withAlpha(
                                    (0.8 * 255).round(),
                                  ),
                            key: ValueKey(isFormValid),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          isFormValid
                              ? 'Crear Cuenta Premium'
                              : 'Completa los campos',
                          style: context.button.copyWith(
                            color: isFormValid
                                ? Colors.white
                                : AppTheme.kOffWhite.withAlpha(
                                    (0.8 * 255).round(),
                                  ),
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  /// Muestra el diálogo de confirmación premium
  Future<void> _showConfirmationDialog(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) =>
          _buildConfirmationDialog(dialogContext),
    );

    if (result == true && mounted) {
      context.read<ProfileCubit>().submitClientRegistration();
    }
  }

  /// Construye el diálogo de confirmación con diseño premium
  Widget _buildConfirmationDialog(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: AppTheme.kSurfaceColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: AppTheme.kPrimaryColor.withAlpha((0.4 * 255).round()),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha((0.5 * 255).round()),
              blurRadius: 40,
              offset: const Offset(0, 20),
            ),
            BoxShadow(
              color: AppTheme.kPrimaryColor.withAlpha((0.2 * 255).round()),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icono y título
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppTheme.kPrimaryColor.withAlpha((0.2 * 255).round()),
                    AppTheme.kPrimaryLightColor.withAlpha((0.1 * 255).round()),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                Icons.stars_rounded,
                color: AppTheme.kMediumGold,
                size: 32,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              '¡Bienvenido a Barber Time!',
              style: context.h2.copyWith(
                color: AppTheme.kOffWhite,
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 12),

            Text(
              'Estás a punto de crear tu cuenta premium.\n¿Confirmas que todos los datos son correctos?',
              style: context.bodyMedium.copyWith(
                color: AppTheme.kOffWhite.withAlpha((0.8 * 255).round()),
                fontWeight: FontWeight.w400,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 24),

            // Información resumida
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.kCharcoalDark.withAlpha((0.6 * 255).round()),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppTheme.kPrimaryColor.withAlpha((0.2 * 255).round()),
                ),
              ),
              child: Column(
                children: [
                  _buildInfoRow(
                    Icons.person_outline_rounded,
                    'Nombre',
                    widget.state.formData['name'] ?? '',
                  ),
                  const SizedBox(height: 8),
                  _buildInfoRow(
                    Icons.email_outlined,
                    'Email',
                    widget.state.formData['email'] ?? '',
                  ),
                  if (widget.state.formData['phone']?.isNotEmpty == true) ...[
                    const SizedBox(height: 8),
                    _buildInfoRow(
                      Icons.phone_outlined,
                      'WhatsApp',
                      widget.state.formData['phone'] ?? '',
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Botones
            Row(
              children: [
                // Botón cancelar
                Expanded(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppTheme.kCharcoalLight),
                    ),
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      style: TextButton.styleFrom(
                        foregroundColor: AppTheme.kOffWhite.withAlpha(
                          (0.8 * 255).round(),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        'Revisar',
                        style: context.button.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                // Botón confirmar
                Expanded(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [AppTheme.kMediumGold, AppTheme.kDarkGold],
                      ),
                    ),
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check_rounded, size: 18),
                          const SizedBox(width: 6),
                          Text(
                            'Confirmar',
                            style: context.button.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Construye una fila de información en el diálogo
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: AppTheme.kPrimaryColor, size: 16),
        const SizedBox(width: 10),
        Text(
          '$label:',
          style: context.bodySmall.copyWith(
            color: AppTheme.kOffWhite.withAlpha((0.7 * 255).round()),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: context.bodySmall.copyWith(
              color: AppTheme.kOffWhite,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
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
