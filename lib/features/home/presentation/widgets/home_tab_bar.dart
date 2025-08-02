import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/spacers/spacers.dart';
import '../bloc/home_state.dart';

/// Widget que implementa una barra de pestañas personalizada para la Home Page
///
/// Incluye efectos visuales mejorados, animaciones y estilo coherente con el
/// diseño de la app
class HomeTabBar extends StatelessWidget {
  /// Controlador de las pestañas
  final TabController tabController;

  /// Controlador del PageView asociado
  final PageController pageController;

  /// Callback cuando se cambia de pestaña
  final ValueChanged<int>? onTabChanged;

  /// Constructor
  const HomeTabBar({
    super.key,
    required this.tabController,
    required this.pageController,
    this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSpacers.symmetric(horizontal: 20) as EdgeInsets,
      child: TabBar(
        controller: tabController,
        onTap: (index) {
          // Animación sincronizada con el PageView
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );

          // Ejecutar callback si existe
          if (onTabChanged != null) {
            onTabChanged!(index);
          }
        },
        // Efectos visuales mejorados
        splashFactory: NoSplash.splashFactory,
        overlayColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) => Colors.transparent,
        ),
        // Indicador personalizado con animación
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 3, color: AppTheme.kPrimaryColor),
          insets: AppSpacers.symmetric(horizontal: 20) as EdgeInsets,
        ),
        indicatorSize: TabBarIndicatorSize.label,
        // Colores y estilos
        labelColor: AppTheme.kPrimaryColor,
        unselectedLabelColor: AppTheme.kMediumGray,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
        // Animación de selección de pestañas
        labelPadding: AppSpacers.symmetric(horizontal: 12) as EdgeInsets,
        tabs: const [
          Tab(text: 'Cerca de ti'),
          Tab(text: 'Mejor Valorados'),
        ],
      ),
    );
  }

  /// Obtiene el HomeTab correspondiente a un índice de TabBar
  static HomeTab getHomeTabFromIndex(int index) {
    switch (index) {
      case 0:
        return HomeTab.cercanos;
      case 1:
        return HomeTab.mejorValorados;
      default:
        return HomeTab.cercanos;
    }
  }

  /// Obtiene el índice de TabBar correspondiente a un HomeTab
  static int getTabIndexFromHomeTab(HomeTab tab) {
    switch (tab) {
      case HomeTab.cercanos:
        return 0;
      case HomeTab.mejorValorados:
        return 1;
    }
  }
}
