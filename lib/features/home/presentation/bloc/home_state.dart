import 'package:equatable/equatable.dart';

import '../../domain/entities/salon.dart';
import '../../domain/entities/service_category.dart';
import '../../domain/entities/special_offer.dart';

/// Representa los diferentes estados de la página de inicio
abstract class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object?> get props => [];
}

/// Estado inicial cuando se carga la página
class HomeInitial extends HomeState {
  const HomeInitial();
}

/// Estado de carga de datos
class HomeLoading extends HomeState {
  const HomeLoading();
}

/// Estado cuando la carga de datos es exitosa
class HomeLoaded extends HomeState {
  final String userName;
  final bool hasNotifications;
  final List<SpecialOffer> specialOffers;
  final List<ServiceCategory> serviceCategories;
  final List<Salon> topRatedSalons;
  final bool isSearchActive;
  
  const HomeLoaded({
    required this.userName,
    required this.hasNotifications,
    required this.specialOffers,
    required this.serviceCategories,
    required this.topRatedSalons,
    this.isSearchActive = false,
  });
  
  @override
  List<Object?> get props => [
    userName,
    hasNotifications,
    specialOffers,
    serviceCategories,
    topRatedSalons,
    isSearchActive,
  ];
  
  /// Crea una copia del estado con los campos actualizados
  HomeLoaded copyWith({
    String? userName,
    bool? hasNotifications,
    List<SpecialOffer>? specialOffers,
    List<ServiceCategory>? serviceCategories,
    List<Salon>? topRatedSalons,
    bool? isSearchActive,
  }) {
    return HomeLoaded(
      userName: userName ?? this.userName,
      hasNotifications: hasNotifications ?? this.hasNotifications,
      specialOffers: specialOffers ?? this.specialOffers,
      serviceCategories: serviceCategories ?? this.serviceCategories,
      topRatedSalons: topRatedSalons ?? this.topRatedSalons,
      isSearchActive: isSearchActive ?? this.isSearchActive,
    );
  }
}

/// Estado de error al cargar datos
class HomeError extends HomeState {
  final String message;
  
  const HomeError(this.message);
  
  @override
  List<Object> get props => [message];
}
