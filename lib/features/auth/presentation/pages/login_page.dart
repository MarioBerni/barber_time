import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/widgets/backgrounds/gradient_background_factory.dart';
import '../../../../core/widgets/containers/glam_container.dart';
import '../bloc/auth_cubit.dart';
import '../bloc/auth_state.dart';
import '../widgets/login_form.dart';
import '../widgets/login_header.dart';
import '../widgets/login_register_link.dart';

/// Pantalla de inicio de sesión
class LoginPage extends StatefulWidget {
  /// Constructor de LoginPage.
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
            color: context.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: context.textColor),
      ),
      body: Stack(
        children: [
          // Utilizamos el preset claro con degradado suave
          // y burbujas más visibles
          GradientBackgroundFactory.lightBarber(),

          // Contenido de la página
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              // Mostrar mensajes de error si los hay
              if (state.status == AuthStatus.error &&
                  state.errorMessage != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage!),
                    backgroundColor: context.errorColor,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: context.cardBorderRadius,
                    ),
                    margin: EdgeInsets.all(context.spacingMD),
                  ),
                );
                context.read<AuthCubit>().clearError();
              }

              // Navegar a la pantalla principal si la autenticación
              // fue exitosa
              if (state.status == AuthStatus.authenticated) {
                context.go(AppRoutes.home);
              }
            },
            builder: (context, state) {
              // Usamos GlamContainer.surface para envolver todo el contenido
              // y dar un efecto visual mejorado
              return GlamContainer.surface(
                margin: EdgeInsets.zero,
                opacity: 0.1, // Muy sutil para no distraer
                baseColor: Colors.white,
                borderRadius: BorderRadius.zero, // Sin bordes redondeados
                // para cubrir toda la pantalla
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(
                    context.spacingXL,
                    100.0, // Mantenemos este valor específico
                    // para el diseño
                    context.spacingXL,
                    context.spacingXL,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Componente modular para el encabezado
                      const LoginHeader(),

                      SizedBox(height: context.spacingXL),

                      // Componente modular para el formulario
                      LoginForm(
                        isLoading: state.isLoading,
                        onLoginPressed: (_) {},
                      ),

                      SizedBox(height: context.spacingLG),

                      // Componente modular para enlace de registro
                      const LoginRegisterLink(),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
