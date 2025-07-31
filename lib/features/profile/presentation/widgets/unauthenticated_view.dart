import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/widgets/backgrounds/animated_gradient_background.dart';
import '../../../../core/widgets/spacers/app_spacers.dart';
import '../bloc/profile_cubit.dart';
import '../bloc/profile_state.dart';
import 'business_registration_form.dart';
import 'create_account_page.dart';
import 'user_type_option.dart';

/// Widget que muestra la vista para usuarios no autenticados
/// Permite seleccionar entre cliente y negocio
/// para el proceso de registro
class UnauthenticatedView extends StatelessWidget {
  /// Constructor
  const UnauthenticatedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        // Mostrar formulario de cliente si está en registro de cliente
        if (state is ProfileClientRegistration) {
          return const CreateAccountPage();
        }

        // Mostrar formulario de negocio si está en registro de negocio
        if (state is ProfileBusinessRegistration) {
          return const BusinessRegistrationForm();
        }

        // Mostrar selección de tipo de usuario por defecto
        return Scaffold(
          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          body: Stack(
            children: [
              // Fondo con gradiente premium mejorado
              // (como en las páginas de registro)
              AnimatedGradientBackground(
                primaryColor: AppTheme.kBackgroundColor,
                secondaryColor: AppTheme.kSurfaceColor,
                lineOpacity: 0.03, // Sutil como en registration_scaffold
                lineCount: 25, // Como en registration_scaffold
              ),

              // Overlay sutil para mejorar contraste
              // (como en business_registration_form)
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

              // Contenido
              Center(
                child: SingleChildScrollView(
                  child: SafeArea(child: _buildUserTypeSelection(context)),
                ),
              ),
            ],
          ),
        );
      },
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
          // Título con gradiente mejorado
          // (como en business_registration_form)
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [AppTheme.kPrimaryColor, AppTheme.kPrimaryLightColor],
            ).createShader(bounds),
            child: Text(
              'Selecciona tu tipo de usuario',
              style: context.h1.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 32,
                letterSpacing: 0.8,
                height: 1.1,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          AppSpacers.lg,

          // Subtítulo mejorado con estilo premium
          // (como en business_registration_form)
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppTheme.kSurfaceColor.withAlpha(77),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppTheme.kPrimaryColor.withAlpha(51)),
            ),
            child: Text(
              'Para brindarte la mejor experiencia, necesitamos saber '
              'qué tipo de usuario eres.',
              style: context.bodyLarge.copyWith(
                color: AppTheme.kOffWhite,
                fontWeight: FontWeight.w500,
                fontSize: 18,
                height: 1.5,
                letterSpacing: 0.3,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          AppSpacers.xl,

          // Opciones de usuario con animación mejorada
          AnimatedOpacity(
            opacity: 1.0,
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeOutCubic,
            child: Column(
              children: [
                // Opción de cliente
                UserTypeOption(
                  title: 'Cliente',
                  description: 'Para personas que buscan servicios de barbería',
                  icon: Icons.person,
                  onTap: () => cubit.startClientRegistration(),
                ),

                AppSpacers.md,

                // Opción de negocio
                UserTypeOption(
                  title: 'Barbería',
                  description:
                      'Para registrar tu barbería o local de servicios',
                  icon: Icons.store,
                  onTap: () => cubit.startBusinessRegistration(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
