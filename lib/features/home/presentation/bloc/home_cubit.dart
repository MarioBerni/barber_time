import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/salon.dart';
import '../../domain/usecases/get_home_data_usecase.dart';
import 'home_state.dart';

/// Cubit para gestionar el estado de la página de inicio
class HomeCubit extends Cubit<HomeState> {
  final GetHomeDataUsecase _getHomeDataUsecase;
  
  /// Constructor que recibe el caso de uso como dependencia
  HomeCubit(this._getHomeDataUsecase) : super(const HomeInitial());
  
  /// Carga los datos iniciales para la página de inicio
  Future<void> loadHomeData() async {
    emit(const HomeLoading());
    
    try {
      final homeData = await _getHomeDataUsecase.execute();
      
      emit(HomeLoaded(
        userName: homeData.userName,
        hasNotifications: homeData.hasNotifications,
        specialOffers: homeData.specialOffers,
        serviceCategories: homeData.serviceCategories,
        topRatedSalons: homeData.topRatedSalons,
      ));
    } catch (e) {
      emit(HomeError('Error al cargar los datos: ${e.toString()}'));
    }
  }
  
  /// Activa o desactiva el modo de búsqueda
  void toggleSearchMode() {
    final currentState = state;
    if (currentState is HomeLoaded) {
      emit(currentState.copyWith(
        isSearchActive: !currentState.isSearchActive,
        // Al desactivar la búsqueda, limpiamos el filtro
        searchQuery: currentState.isSearchActive ? '' : currentState.searchQuery,
        filteredSalons: currentState.isSearchActive ? currentState.topRatedSalons : currentState.filteredSalons,
      ));
    }
  }
  
  /// Realiza una búsqueda en los salones por nombre o ubicación
  void searchSalons(String query) {
    final currentState = state;
    if (currentState is HomeLoaded) {
      // Normalizar la consulta para buscar sin importar acentos o mayúsculas
      final normalizedQuery = _normalizeText(query.trim());
      
      // Si la consulta está vacía, mostrar todos los salones
      if (normalizedQuery.isEmpty) {
        emit(currentState.copyWith(
          searchQuery: query,
          filteredSalons: currentState.topRatedSalons,
          isSearchActive: false,
        ));
        return;
      }
      
      // Filtrar salones que coincidan con la consulta en nombre o dirección
      final filteredSalons = currentState.topRatedSalons.where((salon) {
        final normalizedName = _normalizeText(salon.name);
        final normalizedAddress = _normalizeText(salon.address);
        
        return normalizedName.contains(normalizedQuery) ||
               normalizedAddress.contains(normalizedQuery);
      }).toList();
      
      emit(currentState.copyWith(
        searchQuery: query,
        filteredSalons: filteredSalons,
        isSearchActive: true,
      ));
    }
  }
  
  /// Maneja la selección de un barrio específico
  void selectNeighborhood(String neighborhood) {
    final currentState = state;
    if (currentState is HomeLoaded) {
      // Filtrar salones que estén en el barrio seleccionado
      final filteredSalons = currentState.topRatedSalons.where((salon) {
        final normalizedAddress = _normalizeText(salon.address);
        final normalizedNeighborhood = _normalizeText(neighborhood);
        
        return normalizedAddress.contains(normalizedNeighborhood);
      }).toList();
      
      emit(currentState.copyWith(
        searchQuery: neighborhood,
        filteredSalons: filteredSalons,
        isSearchActive: true,
      ));
    }
  }
  
  /// Limpia los resultados de búsqueda
  void clearSearch() {
    final currentState = state;
    if (currentState is HomeLoaded) {
      emit(currentState.copyWith(
        searchQuery: '',
        filteredSalons: currentState.topRatedSalons,
        isSearchActive: false,
      ));
    }
  }
  
  /// Normaliza el texto para comparaciones (quita acentos, convierte a minúsculas)
  String _normalizeText(String text) {
    // Convertir a minúsculas
    String normalized = text.toLowerCase();
    
    // Reemplazar caracteres acentuados
    const acentos = {
      'á': 'a', 'é': 'e', 'í': 'i', 'ó': 'o', 'ú': 'u',
      'à': 'a', 'è': 'e', 'ì': 'i', 'ò': 'o', 'ù': 'u',
      'ä': 'a', 'ë': 'e', 'ï': 'i', 'ö': 'o', 'ü': 'u',
      'ñ': 'n'
    };
    
    for (final entry in acentos.entries) {
      normalized = normalized.replaceAll(entry.key, entry.value);
    }
    
    return normalized;
  }
  
  /// Marca o desmarca un salón como favorito
  void toggleFavorite(String salonId) {
    final currentState = state;
    if (currentState is HomeLoaded) {
      // Actualizar la lista principal de salones
      final updatedSalons = currentState.topRatedSalons.map((salon) {
        if (salon.id == salonId) {
          return Salon(
            id: salon.id,
            name: salon.name,
            address: salon.address,
            imageUrl: salon.imageUrl,
            additionalImages: salon.additionalImages,
            rating: salon.rating,
            reviewCount: salon.reviewCount,
            price: salon.price,
            isFavorite: !salon.isFavorite,
            distance: salon.distance,
          );
        }
        return salon;
      }).toList();
      
      // También actualizar los salones filtrados si hay búsqueda activa
      final updatedFilteredSalons = currentState.filteredSalons.map((salon) {
        if (salon.id == salonId) {
          return Salon(
            id: salon.id,
            name: salon.name,
            address: salon.address,
            imageUrl: salon.imageUrl,
            additionalImages: salon.additionalImages,
            rating: salon.rating,
            reviewCount: salon.reviewCount,
            price: salon.price,
            isFavorite: !salon.isFavorite,
            distance: salon.distance,
          );
        }
        return salon;
      }).toList();
      
      emit(currentState.copyWith(
        topRatedSalons: updatedSalons,
        filteredSalons: updatedFilteredSalons,
      ));
    }
  }
}
