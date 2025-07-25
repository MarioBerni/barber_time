import 'package:flutter/material.dart';

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
  /// 
  /// En lugar de usar StyledIcon directamente en el constructor factory,
  /// creamos íconos básicos que luego se modifican en el método build.
  factory AppBottomNavigationBar.main({
    required int currentIndex,
    required Function(int) onTap,
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
          icon: Icon(Icons.favorite_border, size: 24),
          activeIcon: Icon(Icons.favorite, size: 24),
          label: 'Favoritos',
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
    return Container(
      decoration: BoxDecoration(
        // Fondo con nueva escala de grises refinada
        color: context.charcoalDark, // Carbón oscuro para navigation
        boxShadow: [
          BoxShadow(
            color: context.blackPure.withOpacity(0.3),
            blurRadius: 12.0,
            offset: const Offset(0, -4),
          ),
          BoxShadow(
            color: context.bluePrimary.withOpacity(0.05),
            blurRadius: 8.0,
            offset: const Offset(0, -2),
          ),
        ],
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
            selectedItemColor: context.bluePrimary, // Azul para elementos activos
            unselectedItemColor: context.grayLight, // Gris claro de la nueva escala
            selectedLabelStyle: context.bodySmall.copyWith(
              fontWeight: FontWeight.bold,
              color: context.bluePrimary, // Azul para texto activo
            ),
            unselectedLabelStyle: context.bodySmall.copyWith(
              color: context.grayLight, // Gris claro de la nueva escala
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

  /// Construye un icono con estilo uniforme para la barra de navegación
  /// Actualizado para usar la nueva paleta azul + dorado
  Widget _buildIcon(BuildContext context, Widget icon, bool isActive) {
    // Si el icono ya es un widget personalizado o no es un Icon, lo devolvemos tal cual
    if (icon is! Icon) return icon;
    
    final IconData? iconData = icon.icon;
    final double? size = icon.size;
    
    if (iconData == null) return icon;
    
    // Usar el componente StyledIcon con nueva paleta premium
    return StyledIcon(
      icon: iconData,
      isActive: isActive,
      hasGlowEffect: isActive,
      iconColor: isActive 
          ? context.bluePrimary // Azul para iconos activos
          : context.grayLight, // Gris claro de la nueva escala
      backgroundColor: isActive 
          ? context.charcoalLight // Fondo carbón claro para activo
          : Colors.transparent, // Sin fondo para inactivos (minimalista)
      iconSize: size ?? 24,
      circleSize: 42,
    );
  }
}
