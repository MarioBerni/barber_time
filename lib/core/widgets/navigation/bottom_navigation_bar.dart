import 'package:flutter/material.dart';

import '../../theme/app_theme_extensions.dart';

/// Widget reutilizable para la barra de navegación inferior de la aplicación.
/// 
/// Proporciona una barra de navegación estilizada con gradiente, efectos
/// visuales para los íconos activos, y diseño consistente con el tema.
class AppBottomNavigationBar extends StatelessWidget {
  /// Índice del ítem actualmente seleccionado.
  final int currentIndex;

  /// Callback que se ejecuta cuando se selecciona un nuevo ítem.
  final Function(int) onTap;

  /// Lista de ítems de la barra de navegación.
  final List<BottomNavigationBarItem> items;

  const AppBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  /// Constructor con los ítems predeterminados de navegación principal.
  factory AppBottomNavigationBar.main({
    required int currentIndex,
    required Function(int) onTap,
  }) {
    return AppBottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, size: 26),
          activeIcon: Icon(Icons.home, size: 26),
          label: 'Inicio',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_outlined, size: 25),
          activeIcon: Icon(Icons.calendar_today, size: 25),
          label: 'Citas',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border, size: 26),
          activeIcon: Icon(Icons.favorite, size: 26),
          label: 'Favoritos',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person_outline, size: 26),
          activeIcon: Icon(Icons.person, size: 26),
          label: 'Perfil',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            context.deepBlue, 
            context.primaryColor,
          ],
        ),
        boxShadow: context.elevatedShadow,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.spacingXS,
          ),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            selectedItemColor: context.accentColor,
            unselectedItemColor: context.surfaceColor.withOpacity(0.7),
            selectedLabelStyle: context.bodySmall.copyWith(
              fontWeight: FontWeight.bold,
              color: context.accentColor,
            ),
            unselectedLabelStyle: context.bodySmall,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            items: List.generate(
              items.length,
              (index) => BottomNavigationBarItem(
                icon: items[index].icon,
                activeIcon: _buildActiveIcon(context, items[index].activeIcon),
                label: items[index].label,
              ),
            ),
            onTap: onTap,
          ),
        ),
      ),
    );
  }

  /// Construye un icono activo con efecto brillante
  Widget _buildActiveIcon(BuildContext context, Widget icon) {
    // Si el icono ya es un widget personalizado, lo devolvemos tal cual
    if (icon is! Icon) return icon;
    
    final IconData? iconData = icon.icon;
    final double? size = icon.size;
    
    if (iconData == null) return icon;
    
    return Stack(
      alignment: Alignment.center,
      children: [
        // Efecto de brillo
        Icon(
          iconData,
          size: size,
          color: context.accentLightColor.withOpacity(0.4),
        ),
        // Icono principal
        Icon(
          iconData,
          size: size,
          color: context.accentColor,
        ),
      ],
    );
  }
}
