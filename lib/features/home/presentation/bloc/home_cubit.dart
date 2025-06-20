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
      ));
    }
  }
  
  /// Marca o desmarca un salón como favorito
  void toggleFavorite(String salonId) {
    final currentState = state;
    if (currentState is HomeLoaded) {
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
      
      emit(currentState.copyWith(topRatedSalons: updatedSalons));
    }
  }
}
