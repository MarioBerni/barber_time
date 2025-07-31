import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/widgets/backgrounds/animated_gradient_background.dart';
import '../bloc/profile_cubit.dart';
import '../bloc/profile_state.dart';
import 'user_type_option.dart';

/// Widget que muestra la vista para usuarios no autenticados
/// Permite seleccionar entre cliente y administrador
/// para el proceso de registro
class UnauthenticatedView extends StatelessWidget {
  /// Estado actual de perfil no autenticado
  final ProfileUnauthenticated state;

  /// Constructor
  const UnauthenticatedView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Fondo con gradiente premium
          AnimatedGradientBackground(
            primaryColor: AppTheme.kBackgroundColor,
            secondaryColor: AppTheme.kSurfaceColor,
            showBouncingCircles: false,
            lineOpacity: 0.03,
            lineCount: 25,
          ),

          // Contenido
          Center(
            child: SingleChildScrollView(
              child: SafeArea(child: _buildUserTypeSelection(context)),
            ),
          ),
        ],
      ),
    );
  }

  /// Construye la selección de tipo de usuario para registro
  Widget _buildUserTypeSelection(BuildContext context) {
    final cubit = context.read<ProfileCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Título con gradiente
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [AppTheme.kPrimaryColor, AppTheme.kPrimaryLightColor],
            ).createShader(bounds),
            child: Text(
              'Selecciona tu tipo de usuario',
              style: context.h2.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 28,
                letterSpacing: 0.5,
                height: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 16),

          // Subtítulo
          Text(
            'Para brindarte la mejor experiencia, necesitamos saber '
            'qué tipo de usuario eres.',
            style: context.bodyLarge.copyWith(
              color: AppTheme.kOffWhite,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              height: 1.5,
              letterSpacing: 0.2,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 48),

          // Opciones de usuario con animación
          AnimatedOpacity(
            opacity: 1.0,
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            child: Column(
              children: [
                // Opción de cliente
                UserTypeOption(
                  title: 'Cliente',
                  description: 'Para personas que buscan servicios de barbería',
                  icon: Icons.person,
                  onTap: () => cubit.startClientRegistration(),
                ),

                const SizedBox(height: 16),

                // Opción de administrador
                UserTypeOption(
                  title: 'Administrador',
                  description: 'Para propietarios y empleados de barberías',
                  icon: Icons.business,
                  onTap: () => cubit.startAdminRegistration(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
