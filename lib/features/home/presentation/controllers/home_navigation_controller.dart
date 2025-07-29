import 'package:flutter/material.dart';
import '../bloc/home_cubit.dart';
import '../bloc/home_state.dart';
import '../widgets/home_tab_bar.dart';

/// Controlador para gestionar la navegación y sincronización entre pestañas en la Home Page
class HomeNavigationController {
  /// TabController para gestionar las pestañas
  final TabController tabController;
  
  /// PageController para gestionar el deslizamiento horizontal
  final PageController pageController;
  
  /// Cubit para gestionar el estado
  final HomeCubit homeCubit;
  
  /// Constructor
  HomeNavigationController({
    required this.tabController,
    required this.pageController,
    required this.homeCubit,
  }) {
    _setupListeners();
  }
  
  /// Configura los listeners para sincronizar controladores
  void _setupListeners() {
    // Sincronizar TabController con el estado
    tabController.addListener(_onTabControllerChanged);
    
    // No necesitamos listener para pageController ya que la sincronización
    // se hace directamente en el widget cuando cambia la página
  }
  
  /// Se ejecuta cuando el TabController cambia
  void _onTabControllerChanged() {
    if (!tabController.indexIsChanging) {
      final selectedTab = HomeTabBar.getHomeTabFromIndex(tabController.index);
      homeCubit.selectTab(selectedTab);
    }
  }
  
  /// Maneja el cambio de página en PageView
  void onPageChanged(int index) {
    tabController.animateTo(index);
    final selectedTab = HomeTabBar.getHomeTabFromIndex(index);
    homeCubit.selectTab(selectedTab);
  }
  
  /// Sincroniza el TabController con el estado actual
  void syncWithState(HomeLoaded state) {
    final tabIndex = HomeTabBar.getTabIndexFromHomeTab(state.selectedTab);
    if (tabController.index != tabIndex) {
      tabController.animateTo(tabIndex);
    }
  }
  
  /// Libera recursos
  void dispose() {
    tabController.removeListener(_onTabControllerChanged);
  }
}
