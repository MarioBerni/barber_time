import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/navigation/bottom_navigation_bar.dart';
import '../../../../core/widgets/spacers/spacers.dart';
import '../../../../core/widgets/states/states.dart';
import '../bloc/home_cubit.dart';
import '../bloc/home_state.dart';
import '../controllers/home_navigation_controller.dart';
import '../widgets/home_header.dart';
import '../widgets/home_tab_bar.dart';
import '../widgets/home_tab_content.dart';

/// Página de inicio de la aplicación
///
/// Muestra ofertas destacadas, categorías de servicios y salones recomendados
/// Permite navegar a otras secciones de la aplicación sin necesidad de registro
class HomePage extends StatefulWidget {
  /// Constructor de la página de inicio
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // Controlador para el campo de búsqueda
  final TextEditingController _searchController = TextEditingController();

  // Controladores para las pestañas y navegación
  late TabController _tabController;
  late PageController _pageController;
  late HomeNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    // Cargar datos iniciales
    context.read<HomeCubit>().loadHomeData();

    // Inicializar controladores
    _pageController = PageController();
    _tabController = TabController(length: 2, vsync: this);

    // Inicializar controlador de navegación
    _navigationController = HomeNavigationController(
      tabController: _tabController,
      pageController: _pageController,
      homeCubit: context.read<HomeCubit>(),
    );

    // Ya no necesitamos listener - se maneja directamente en los callbacks
  }

  @override
  void dispose() {
    // Ya no hay listener que remover
    _searchController.dispose();
    _pageController.dispose();
    _navigationController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial) {
            context.read<HomeCubit>().loadHomeData();
            return const Center(
              child: LoadingIndicatorWidget(size: LoadingIndicatorSize.large),
            );
          } else if (state is HomeError) {
            return ErrorMessageWidget(
              title: 'Ups, algo salió mal',
              message: state.message,
              onRetry: () => context.read<HomeCubit>().loadHomeData(),
            );
          } else if (state is HomeLoaded) {
            return _buildHomeContent(state);
          }

          // Estado por defecto (incluye cualquier otro estado de carga)
          return const Center(
            child: LoadingIndicatorWidget(size: LoadingIndicatorSize.large),
          );
        },
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  /// Construye la navegación inferior
  Widget _buildBottomNavigationBar() {
    return AppBottomNavigationBar.main(
      currentIndex: 0,
      onTap: (index) {
        // Navegar a la página correspondiente según el índice seleccionado
        switch (index) {
          case 0: // Inicio
            // Ya estamos en la página de inicio, no es necesario navegar
            break;
          case 1: // Citas
            context.go(AppRoutes.appointments);
            break;
          case 2: // Ofertas
            context.go(AppRoutes.profile);
            break;
          case 3: // Perfil
            context.go(AppRoutes.profile);
            break;
        }
      },
    );
  }

  /// Construye el contenido principal de la pantalla de inicio
  Widget _buildHomeContent(HomeLoaded state) {
    // Sincronizar el TabController con el estado actual
    _navigationController.syncWithState(state);

    return Container(
      color: AppTheme.kBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Barra superior con información de usuario - SIN PADDING LATERAL
          _buildSimpleAppBar(state),

          // Contenido con padding lateral para elementos internos
          Expanded(
            child: Column(
              children: [
                // Espaciado superior mejorado
                AppSpacers.md,

                // TabBar para navegación entre categorías con animaciones
                HomeTabBar(
                  tabController: _tabController,
                  pageController: _pageController,
                ),

                // Contenido principal con PageView para deslizamiento lateral
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    physics: const BouncingScrollPhysics(),
                    onPageChanged: _navigationController.onPageChanged,
                    children: [
                      // Pestañas con contenido filtrado
                      HomeTabContent(
                        state: state,
                        tab: HomeTab.cercanos,
                        onFavoritePressed: (salonId) =>
                            context.read<HomeCubit>().toggleFavorite(salonId),
                        onClearSearch: _clearSearch,
                      ),
                      HomeTabContent(
                        state: state,
                        tab: HomeTab.mejorValorados,
                        onFavoritePressed: (salonId) =>
                            context.read<HomeCubit>().toggleFavorite(salonId),
                        onClearSearch: _clearSearch,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Método para limpiar la búsqueda
  void _clearSearch() {
    _searchController.clear();
    context.read<HomeCubit>().clearSearch();
  }

  /// Construye una barra de aplicación simplificada
  Widget _buildSimpleAppBar(HomeLoaded state) {
    return HomeHeader(
      userName: state.userName,
      hasNotifications: state.hasNotifications,
      searchController: _searchController,
      onSearch: (query) {
        // ✅ SOLO confirmar búsqueda (ENTER)
        context.read<HomeCubit>().searchSalonsWithDebounce(query);
      },
      onSearchChanged: (query) {
        // ✅ SOLO búsqueda en tiempo real (SIN guardar en historial)
        context.read<HomeCubit>().searchSalonsWithDebounce(query);
        context.read<HomeCubit>().getSearchSuggestions(query);
      },
      onNeighborhoodSelected: (neighborhood) {
        _searchController.text = neighborhood;
        context.read<HomeCubit>().selectNeighborhood(neighborhood);
      },
      isSearchActive: state.isSearchActive,
      onSearchPressed: () {
        context.read<HomeCubit>().toggleSearchMode();
      },
      onNotificationsPressed: () {
        // TODO: Implementar navegación a notificaciones
      },
      onUserAvatarPressed: () {
        context.go(AppRoutes.profile);
      },

      salones: state.topRatedSalons,

      onBarberiaSelected: (barberia) {
        _searchController.text = barberia;
        context.read<HomeCubit>().searchSalonsWithDebounce(barberia);
        context.read<HomeCubit>().hideSuggestions();
      },
    );
  }
}
