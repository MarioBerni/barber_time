import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    // Usamos directamente un SingleChildScrollView para garantizar scroll
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Barra superior con información de usuario
          _buildSimpleAppBar(state),
          
          // Sección de ofertas especiales
          _buildSimpleSectionTitle('Ofertas especiales'),
          _buildSpecialOffersSection(state),
          
          // Se eliminó la sección de categorías de servicios
          
          // Sección de salones mejor calificados
          _buildSimpleSectionTitle('Salones mejor calificados'),
          _buildSimpleTopSalonsSection(state),
          
          // Espaciado final
          const SizedBox(height: 80),
        ],
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
  
  /// Construye un título de sección simplificado
  Widget _buildSimpleSectionTitle(String title) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: theme.textTheme.titleLarge,
          ),
          TextButton(
            onPressed: () {
              // Navegar a ver todos
            },
            child: const Text('Ver todos'),
          ),
        ],
      ),
    );
  }
  
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
              const Icon(Icons.search_off, size: 48, color: Colors.grey),
              const SizedBox(height: 16),
              Text(
                'No se encontraron barberías con "${state.searchQuery}"',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  _searchController.clear();
                  context.read<HomeCubit>().clearSearch();
                },
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
        // Implementar navegación
      },
    );
  }
}
