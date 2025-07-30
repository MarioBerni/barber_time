import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/widgets/buttons/stylized_button.dart';
import '../../../../core/widgets/containers/glam_container.dart';

/// Componente que muestra el enlace para registro en la página de login
///
/// Presenta un contenedor estilizado con texto y botón para ir
/// a la página de registro
class LoginRegisterLink extends StatelessWidget {
  /// Constructor de LoginRegisterLink.
  const LoginRegisterLink({super.key});

  @override
  Widget build(BuildContext context) {
    return GlamContainer.surface(
      opacity: 0.6,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '¿No tienes cuenta? ',
            style: context.bodyMedium.copyWith(
              color: Colors.white.withAlpha((0.9 * 255).round()),
              fontWeight: FontWeight.w500,
            ),
          ),
          StylizedButton.secondary(
            text: 'Regístrate aquí',
            onPressed: () {
              context.go(AppRoutes.register);
            },
          ),
        ],
      ),
    );
  }
}
