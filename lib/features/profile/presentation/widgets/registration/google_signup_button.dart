import 'package:flutter/material.dart';

import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/widgets/buttons/enhanced_button.dart';

/// Botón premium para registro con Google
class GoogleSignUpButton extends StatelessWidget {
  /// Callback cuando se presiona el botón
  final VoidCallback? onPressed;

  /// Texto del botón
  final String text;

  /// Constructor
  const GoogleSignUpButton({
    super.key,
    this.onPressed,
    this.text = 'Continuar con Google',
  });

  @override
  Widget build(BuildContext context) {
    return EnhancedButton(
      text: text,
      onPressed: onPressed,
      icon: Icons.g_mobiledata, // Icono de Google
      color: AppTheme.kSurfaceColor,
      textColor: AppTheme.kOffWhite,
      height: 58,
      borderRadius: 18,
      width: double.infinity,
    );
  }
}
