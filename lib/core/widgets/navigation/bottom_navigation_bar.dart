import 'package:flutter/material.dart';

import '../../theme/app_design_constants.dart';
import '../../theme/app_theme_extensions.dart';
import '../icons/styled_icon.dart';

/// Widget reutilizable para la barra de navegación inferior de la aplicación.
///
/// Proporciona una barra de navegación estilizada con gradiente, efectos
/// visuales para los íconos activos, y diseño consistente con el tema.
class AppBottomNavigationBar extends StatelessWidget {
  /// Índice del ítem actualmente seleccionado.
  final int currentIndex;

  /// Callback que se ejecuta cuando se selecciona un nuevo ítem.
  final ValueChanged<int> onTap;

  /// Lista de ítems de la barra de navegación.
  final List<BottomNavigationBarItem> items;

  /// Constructor principal.
  const AppBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  /// Constructor con los ítems predeterminados de navegación principal.
  ///
  /// En lugar de usar StyledIcon directamente en el constructor factory,
  /// creamos íconos básicos que luego se modifican en el método build.
  factory AppBottomNavigationBar.main({
    required int currentIndex,
    required ValueChanged<int> onTap,
  }) {
    return AppBottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, size: 24),
          activeIcon: Icon(Icons.home, size: 24),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_outlined, size: 24),
          activeIcon: Icon(Icons.calendar_today, size: 24),
          label: 'Citas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_offer_outlined, size: 24),
          activeIcon: Icon(Icons.local_offer, size: 24),
          label: 'Ofertas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline, size: 24),
          activeIcon: Icon(Icons.person, size: 24),
          label: 'Perfil',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        // Fondo oscuro moderno para el tema dark
        color: context.surfaceColor, // Superficie oscura para navigation
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.3 * 255).round()),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
          BoxShadow(
            color: context.primaryColor.withAlpha((0.05 * 255).round()),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDesignConstants.borderRadiusXL),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: context.spacingXS),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            selectedItemColor: context.primaryColor,
            unselectedItemColor: Colors.grey[400],
            selectedLabelStyle: context.bodySmall.copyWith(
              fontWeight: FontWeight.bold,
              color: context.primaryColor,
            ),
            unselectedLabelStyle: context.bodySmall.copyWith(
              color: Colors.grey[400],
            ),
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            items: List.generate(
              items.length,
              (index) => BottomNavigationBarItem(
                icon: _buildIcon(context, items[index].icon, false),
                activeIcon: _buildIcon(context, items[index].activeIcon, true),
                label: items[index].label,
              ),
            ),
            onTap: onTap,
          ),
        ),
      ),
    );
  }

  /// Construye un icono con estilo uniforme para la barra de navegación.
  Widget _buildIcon(BuildContext context, Widget icon, bool isActive) {
    if (icon is! Icon) return icon;

    final IconData? iconData = icon.icon;
    final double? size = icon.size;

    if (iconData == null) return icon;

    return StyledIcon(
      icon: iconData,
      isActive: isActive,
      hasGlowEffect: isActive,
      iconColor: isActive ? context.primaryColor : Colors.grey[400],
      backgroundColor: isActive
          ? context.primaryColor.withAlpha(38)
          : Colors.transparent,
      iconSize: size ?? 24,
      circleSize: 42,
    );
  }
}
