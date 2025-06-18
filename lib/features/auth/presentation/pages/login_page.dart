import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/widgets/backgrounds/pattern_background.dart';
import '../../../../core/widgets/backgrounds/gradient_overlay_background.dart';
import '../bloc/auth_cubit.dart';
import '../bloc/auth_state.dart';
import '../widgets/login_header.dart';
import '../widgets/login_form.dart';
import '../widgets/login_register_link.dart';

/// Pantalla de inicio de sesión
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fondo transparente para que el appBar no tape el fondo animado
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Iniciar Sesión',
          style: context.h4.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Fondo de patrón con diseño de barbería
          PatternBackground(
            patternType: BarberPattern.diagonalStripes,
            primaryColor: context.darkGold.withOpacity(0.15),
            secondaryColor: context.primaryDarkColor.withOpacity(0.2),
            density: 1.0,
          ),
          
          // Overlay con gradiente para dar profundidad al fondo
          GradientOverlayBackground.cornerLight(
            opacity: 0.7,
            child: const SizedBox.expand(), // Contenido requerido
          ),
          
          // Contenido de la página
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              // Mostrar mensajes de error si los hay
              if (state.status == AuthStatus.error && state.errorMessage != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage!),
                    backgroundColor: context.errorColor,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.all(16),
                  ),
                );
                context.read<AuthCubit>().clearError();
              }

              // Navegar a la pantalla principal si la autenticación fue exitosa
              if (state.status == AuthStatus.authenticated) {
                context.go(AppRoutes.home);
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24.0, 100.0, 24.0, 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Componente modular para el encabezado
                    const LoginHeader(),
                    
                    SizedBox(height: context.spacingXL + 8),
                    
                    // Componente modular para el formulario
                    LoginForm(
                      isLoading: state.isLoading,
                      onLoginPressed: (_) {},
                    ),
                    
                    const SizedBox(height: 30),

                    // Componente modular para enlace de registro
                    const LoginRegisterLink(),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}