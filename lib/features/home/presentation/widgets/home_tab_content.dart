import 'package:flutter/material.dart';

import '../../../../core/widgets/spacers/spacers.dart';
import '../../domain/entities/salon.dart';
import '../bloc/home_state.dart';
import 'home_salon_card.dart';
import 'search_empty_state.dart';
import 'section_title_widget.dart';

/// Widget que representa el contenido de una pestaña en la Home Page
class HomeTabContent extends StatelessWidget {
  /// Estado actual de la página Home
  final HomeLoaded state;

  /// Pestaña seleccionada actualmente
  final HomeTab tab;

  /// Callback cuando se presiona favorito en un salón
  final ValueChanged<String> onFavoritePressed;

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
    return _buildMainContent();
  }

  /// Construye el contenido principal con CustomScrollView para lazy loading
  Widget _buildMainContent() {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // Espacio superior
        AppSpacers.sliverLg,

        // Título de sección filtrada
        SliverToBoxAdapter(child: _buildTabSectionTitle()),

        AppSpacers.sliverMd,

        // Lista de salones filtrados por pestaña
        _buildTabFilteredSalonsSection(),

        AppSpacers.sliverXl,
      ],
    );
  }

  /// Construye el título de sección según la pestaña seleccionada
  Widget _buildTabSectionTitle() {
    String title;
    bool showPremiumIcon = false;

    switch (tab) {
      case HomeTab.cercanos:
        title = 'Barberías Cercanas';
        break;
      case HomeTab.mejorValorados:
        title = 'Mejor Valoradas';
        showPremiumIcon = true;
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
    final salonsToShow = state.isSearchActive
        ? state.filteredSalons
        : state.tabFilteredSalons;

    // Mostrar mensaje cuando no hay resultados en la búsqueda
    if (state.isSearchActive && salonsToShow.isEmpty) {
      return SliverToBoxAdapter(
        child: SearchEmptyState(
          searchQuery: state.searchQuery,
          onClearSearch: onClearSearch,
        ),
      );
    }

    // Mostrar la lista de salones con lazy loading
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => _buildSalonCard(salonsToShow[index]),
          childCount: salonsToShow.length,
        ),
      ),
    );
  }

  /// Construye una tarjeta de salón individual con padding vertical
  Widget _buildSalonCard(Salon salon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {}, // Aquí se puede implementar la navegación al detalle
        child: HomeSalonCard(
          salon: salon,
          onFavoritePressed: () => onFavoritePressed(salon.id),
        ),
      ),
    );
  }
}
