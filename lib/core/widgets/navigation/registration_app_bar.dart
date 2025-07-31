import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/app_theme.dart';
import '../../theme/app_theme_extensions.dart';

/// AppBar reutilizable para formularios de registro
/// Mantiene consistencia visual en todos los formularios
class RegistrationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  /// Título del formulario
  final String title;

  /// Función de retroceso
  final VoidCallback? onBackPressed;

  /// Constructor
  const RegistrationAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          // Botón de retroceso personalizado
          IconButton(
            onPressed: onBackPressed,
            icon: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppTheme.kSurfaceColor.withAlpha((0.9 * 255).round()),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppTheme.kPrimaryColor.withAlpha((0.3 * 255).round()),
                ),
              ),
              child: Icon(
                Icons.arrow_back_rounded,
                color: AppTheme.kOffWhite,
                size: 16,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Título con gradiente centrado
          Expanded(
            child: Center(
              child: ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: [AppTheme.kPrimaryColor, AppTheme.kPrimaryLightColor],
                ).createShader(bounds),
                child: Text(
                  title,
                  style: context.textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
