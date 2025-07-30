import 'package:flutter/material.dart';

import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/theme/app_theme_extensions.dart';

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
    return Container(
      width: double.infinity,
      height: 58,
      decoration: BoxDecoration(
        color: AppTheme.kSurfaceColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppTheme.kCharcoalLight, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.1 * 255).round()),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: AppTheme.kPrimaryColor.withAlpha((0.1 * 255).round()),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icono de Google personalizado
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      'G',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                // Texto del botón
                Text(
                  text,
                  style: context.button.copyWith(
                    color: AppTheme.kOffWhite,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
