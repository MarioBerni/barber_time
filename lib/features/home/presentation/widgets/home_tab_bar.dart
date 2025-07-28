import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../bloc/home_state.dart';

/// Widget que implementa una barra de pestañas personalizada para la Home Page
///
/// Incluye efectos visuales mejorados, animaciones y estilo coherente con el diseño de la app
class HomeTabBar extends StatelessWidget {
  /// Controlador de las pestañas
  final TabController tabController;
  
  /// Controlador del PageView asociado
  final PageController pageController;
  
  /// Callback cuando se cambia de pestaña
  final Function(int)? onTabChanged;
  
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
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        // Sombra sutil para separación visual
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
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
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) => Colors.transparent,
        ),
        // Indicador personalizado con animación
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            width: 3,
            color: AppTheme.kPrimaryColor,
          ),
          insets: const EdgeInsets.symmetric(horizontal: 16),
        ),
        indicatorSize: TabBarIndicatorSize.label,
        // Colores y estilos
        labelColor: AppTheme.kPrimaryColor,
        unselectedLabelColor: AppTheme.kMediumGray,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
        // Animación de selección de pestañas
        labelPadding: const EdgeInsets.symmetric(horizontal: 12),
        tabs: const [
          Tab(text: 'Destacados'),
          Tab(text: 'Cerca de ti'),
          Tab(text: 'Mejor Valorados'),
        ],
      ),
    );
  }
  
  /// Obtiene el HomeTab correspondiente a un índice de TabBar
  static HomeTab getHomeTabFromIndex(int index) {
    switch (index) {
      case 0: return HomeTab.destacados;
      case 1: return HomeTab.cercanos;
      case 2: return HomeTab.mejorValorados;
      default: return HomeTab.destacados;
    }
  }
  
  /// Obtiene el índice de TabBar correspondiente a un HomeTab
  static int getTabIndexFromHomeTab(HomeTab tab) {
    switch (tab) {
      case HomeTab.destacados: return 0;
      case HomeTab.cercanos: return 1;
      case HomeTab.mejorValorados: return 2;
    }
  }
}
