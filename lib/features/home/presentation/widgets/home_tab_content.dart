import 'package:flutter/material.dart';
import '../bloc/home_state.dart';
import 'section_title_widget.dart';
import 'search_empty_state.dart';
import 'top_rated_salons_section.dart';
import 'special_offers_section.dart';

/// Widget que representa el contenido de una pestaña en la Home Page
class HomeTabContent extends StatelessWidget {
  /// Estado actual de la página Home
  final HomeLoaded state;
  
  /// Pestaña seleccionada actualmente
  final HomeTab tab;
  
  /// Callback cuando se presiona favorito en un salón
  final Function(String) onFavoritePressed;
  
  /// Callback para limpiar la búsqueda
  final VoidCallback onClearSearch;
  
  /// Constructor
  const HomeTabContent({
    super.key,
    required this.state,
    required this.tab,
    required this.onFavoritePressed,
    required this.onClearSearch,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          
          // Título de sección filtrada
          _buildTabSectionTitle(),
          
          const SizedBox(height: 16),
          
          // Lista de salones filtrados por pestaña
          _buildTabFilteredSalonsSection(),
          
          const SizedBox(height: 24),
          
          // Título para ofertas especiales
          const SectionTitleWidget(
            title: 'Ofertas Especiales',
            actionText: 'Ver todas',
          ),
          
          const SizedBox(height: 16),
          
          // Ofertas especiales
          SpecialOffersSection(
            offers: state.specialOffers,
          ),
          
          const SizedBox(height: 32),
        ],
      ),
    );
  }
  
  /// Construye el título de sección según la pestaña seleccionada
  Widget _buildTabSectionTitle() {
    String title;
    bool showPremiumIcon = false;
    
    switch (tab) {
      case HomeTab.destacados:
        title = 'Barberías Premium';
        showPremiumIcon = true;
        break;
      case HomeTab.cercanos:
        title = 'Barberías Cercanas';
        break;
      case HomeTab.mejorValorados:
        title = 'Mejor Valoradas';
        break;
    }
    
    return SectionTitleWidget(
      title: title,
      actionText: 'Ver todas',
      showPremiumIcon: showPremiumIcon,
    );
  }

  /// Construye la sección de salones filtrada por la pestaña seleccionada
  Widget _buildTabFilteredSalonsSection() {
    final salonsToShow = state.isSearchActive ? state.filteredSalons : state.tabFilteredSalons;
    
    // Mostrar mensaje cuando no hay resultados en la búsqueda
    if (state.isSearchActive && salonsToShow.isEmpty) {
      return SearchEmptyState(
        searchQuery: state.searchQuery,
        onClearSearch: onClearSearch,
      );
    }
    
    // Mostrar la lista de salones
    return TopRatedSalonsSection(
      salons: salonsToShow,
      onFavoritePressed: onFavoritePressed,
    );
  }
}
