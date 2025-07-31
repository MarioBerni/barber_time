import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/theme/app_theme.dart';

/// AppBar premium reutilizable para formularios de registro
class PremiumAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Título del AppBar
  final String title;

  /// Función de navegación hacia atrás personalizada
  final VoidCallback? onBack;

  /// Constructor
  const PremiumAppBar({super.key, this.title = 'Crear Cuenta', this.onBack});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      leading: IconButton(
        onPressed: onBack ?? () => Navigator.of(context).pop(),
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
            Icons.arrow_back_ios_new_rounded,
            color: AppTheme.kOffWhite,
            size: 16,
          ),
        ),
      ),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
