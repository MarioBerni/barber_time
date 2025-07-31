import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../backgrounds/animated_gradient_background.dart';
import '../navigation/registration_app_bar.dart';

/// Scaffold reutilizable para formularios de registro
/// Proporciona estructura consistente con fondo premium
class RegistrationScaffold extends StatelessWidget {
  /// Título del formulario
  final String title;

  /// Función de retroceso
  final VoidCallback? onBackPressed;

  /// Contenido del formulario
  final Widget child;

  /// Padding del contenido
  final EdgeInsetsGeometry? contentPadding;

  /// Constructor
  const RegistrationScaffold({
    super.key,
    required this.title,
    this.onBackPressed,
    required this.child,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: RegistrationAppBar(title: title, onBackPressed: onBackPressed),
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
          SafeArea(
            child: SingleChildScrollView(
              padding: contentPadding ?? const EdgeInsets.all(24.0),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
