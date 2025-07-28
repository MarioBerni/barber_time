import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/navigation/bottom_navigation_bar.dart';
import '../bloc/home_cubit.dart';
import '../bloc/home_state.dart';
import '../widgets/home_header.dart';
// Se eliminó import de service_categories_section.dart
import '../widgets/special_offers_section.dart';
import '../widgets/top_rated_salons_section.dart';

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

class _HomePageState extends State<HomePage> {
  // Controlador para el campo de búsqueda
  final TextEditingController _searchController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().loadHomeData();
  }
  
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial) {
            context.read<HomeCubit>().loadHomeData();
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeError) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is HomeLoaded) {
            return _buildHomeContent(state);
          }
          
          // Estado por defecto
          return const Center(child: CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHomeContent(HomeLoaded state) {
    // Usamos un SingleChildScrollView con física mejorada
    return Container(
      // Fondo principal con el nuevo color de fondo
      color: AppTheme.kBackgroundColor,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Barra superior con información de usuario
            _buildSimpleAppBar(state),
            
            // Espaciado superior mejorado
            const SizedBox(height: 24), // Más espacio
            
            // Sección de ofertas especiales con títulos modernos
            _buildPremiumSectionTitle('Ofertas Especiales', 'Ver todas'),
            const SizedBox(height: 16), // Más espacio
            _buildSpecialOffersSection(state),
            
            // Espaciado entre secciones mejorado
            const SizedBox(height: 40), // Aún más espacio entre secciones
            
            // Sección de salones mejor calificados
            _buildPremiumSectionTitle('Barberías Premium', 'Ver todas', showPremiumIcon: true),
            const SizedBox(height: 16), // Más espacio
            _buildSimpleTopSalonsSection(state),
            
            // Espaciado final
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
  
  /// Construye una barra de aplicación simplificada
  Widget _buildSimpleAppBar(HomeLoaded state) {
    return HomeHeader(
      userName: state.userName,
      hasNotifications: state.hasNotifications,
      searchController: _searchController,
      // Conectamos las acciones de búsqueda con el HomeCubit
      onSearch: (query) => context.read<HomeCubit>().searchSalons(query),
      onNeighborhoodSelected: (neighborhood) => 
          context.read<HomeCubit>().selectNeighborhood(neighborhood),
      onSearchPressed: () => context.read<HomeCubit>().toggleSearchMode(),
      isSearchActive: state.isSearchActive,
      style: HomeHeaderStyle.gray,
    );
  }
  
  /// Construye un título de sección con estilo moderno
  Widget _buildPremiumSectionTitle(String title, String actionText, {bool showPremiumIcon = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0), // Mayor padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Título con icono premium opcional
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 22, // Ligeramente más grande
                  fontWeight: FontWeight.w700,
                  color: AppTheme.kOffWhite, // Color blanco de la nueva paleta
                  letterSpacing: 0.3, // Mayor espaciado
                ),
              ),
              if (showPremiumIcon) ...[  
                const SizedBox(width: 10), // Más espacio
                Icon(
                  Icons.verified_rounded,
                  color: AppTheme.kAccentColor, // Naranja terracota de la nueva paleta
                  size: 20, // Ligeramente más grande
                )
              ],
            ],
          ),
          
          // Botón de acción con nuevo estilo
          TextButton(
            onPressed: () {
              // Navegar a ver todos
            },
            style: TextButton.styleFrom(
              foregroundColor: AppTheme.kPrimaryColor, // Color turquesa-menta de la nueva paleta
              backgroundColor: AppTheme.kSurfaceAlt.withAlpha(77), // Fondo sutil
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10), // Mayor padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Más redondeado
              ),
            ),
            child: Text(
              actionText,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppTheme.kPrimaryColor, // Turquesa-menta para cohesión
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  // Método eliminado por no ser usado
  
  /// Construye un listado simplificado de salones mejor calificados
  Widget _buildSimpleTopSalonsSection(HomeLoaded state) {
    // Mostrar los salones filtrados si la búsqueda está activa
    final salonsToShow = state.isSearchActive ? state.filteredSalons : state.topRatedSalons;
    
    // Mostrar mensaje cuando no hay resultados en la búsqueda
    if (state.isSearchActive && salonsToShow.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              Icon(Icons.search_off, size: 50, color: AppTheme.kMediumGray),
              const SizedBox(height: 16),
              Text(
                'No se encontraron barberías con "${state.searchQuery}"',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppTheme.kLightGray,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  _searchController.clear();
                  context.read<HomeCubit>().clearSearch();
                },
                style: TextButton.styleFrom(
                  foregroundColor: AppTheme.kPrimaryColor,
                  backgroundColor: AppTheme.kSurfaceAlt.withAlpha(77),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                ),
                child: const Text('Limpiar búsqueda'),
              ),
            ],
          ),
        ),
      );
    }
    
    // Mostrar la lista de salones
    return TopRatedSalonsSection(
      salons: salonsToShow,
      onFavoritePressed: (salonId) => context.read<HomeCubit>().toggleFavorite(salonId),
    );
  }





  Widget _buildSpecialOffersSection(HomeLoaded state) {
    return SpecialOffersSection(
      offers: state.specialOffers,
    );
  }

  // Se eliminó el método _buildServiceCategoriesSection



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
          case 2: // Favoritos
            // Podría ser una ruta específica para favoritos en el futuro
            break;
          case 3: // Perfil
            context.go(AppRoutes.profile);
            break;
        }
      },
    );
  }
}
