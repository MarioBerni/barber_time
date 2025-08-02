import 'package:equatable/equatable.dart';

import '../../domain/entities/salon.dart';
import '../../domain/entities/service_category.dart';
import '../../domain/entities/special_offer.dart';

/// Enum que define las pestañas disponibles en la página de inicio
enum HomeTab {
  /// Pestaña de barberías cercanas (filtradas por distancia)
  cercanos,

  /// Pestaña de mejor valorados (filtrados por rating)
  mejorValorados,
}

/// Representa los diferentes estados de la página de inicio
abstract class HomeState extends Equatable {
  /// Constructor de la clase base para todos los estados
  /// de la página de inicio.
  const HomeState();

  @override
  List<Object?> get props => [];
}

/// Estado inicial cuando se carga la página
class HomeInitial extends HomeState {
  /// Constructor del estado inicial de la página de inicio.
  const HomeInitial();
}

/// Estado cuando se está realizando una búsqueda
class HomeSearching extends HomeState {
  /// Texto de búsqueda actual
  final String searchQuery;

  /// Resultados previos de búsqueda
  final List<Salon> previousResults;

  /// Constructor del estado de búsqueda
  const HomeSearching({
    required this.searchQuery,
    required this.previousResults,
  });

  @override
  List<Object?> get props => [searchQuery, previousResults];
}

/// Estado cuando la carga de datos es exitosa
class HomeLoaded extends HomeState {
  /// Nombre de usuario para el saludo personalizado.
  final String userName;

  /// Indica si hay notificaciones no leídas.
  final bool hasNotifications;

  /// Lista de ofertas especiales.
  final List<SpecialOffer> specialOffers;

  /// Lista de categorías de servicios.
  final List<ServiceCategory> serviceCategories;

  /// Lista de salones mejor valorados.
  final List<Salon> topRatedSalons;

  /// Indica si el modo de búsqueda está activo.
  final bool isSearchActive;

  /// Texto de búsqueda actual
  final String searchQuery;

  /// Salones filtrados según la búsqueda
  final List<Salon> filteredSalons;

  /// Pestaña actualmente seleccionada
  final HomeTab selectedTab;

  /// Salones filtrados según la pestaña seleccionada
  final List<Salon> tabFilteredSalons;

  /// Sugerencias de búsqueda actuales
  final List<String> searchSuggestions;

  /// Historial de búsquedas recientes
  final List<String> searchHistory;

  /// Indica si se deben mostrar las sugerencias
  final bool showSuggestions;

  /// Constructor de HomeLoaded.
  /// Constructor de HomeLoaded.
  const HomeLoaded({
    required this.userName,
    required this.hasNotifications,
    required this.specialOffers,
    required this.serviceCategories,
    required this.topRatedSalons,
    this.isSearchActive = false,
    this.searchQuery = '',
    List<Salon>? filteredSalons,
    this.selectedTab = HomeTab.cercanos,
    List<Salon>? tabFilteredSalons,
    this.searchSuggestions = const [],
    this.searchHistory = const [],
    this.showSuggestions = false,
  }) : filteredSalons = filteredSalons ?? topRatedSalons,
       tabFilteredSalons = tabFilteredSalons ?? topRatedSalons;

  @override
  List<Object?> get props => [
    userName,
    hasNotifications,
    specialOffers,
    serviceCategories,
    topRatedSalons,
    isSearchActive,
    searchQuery,
    filteredSalons,
    selectedTab,
    tabFilteredSalons,
    searchSuggestions,
    searchHistory,
    showSuggestions,
  ];

  /// Crea una copia del estado con los campos actualizados
  HomeLoaded copyWith({
    String? userName,
    bool? hasNotifications,
    List<SpecialOffer>? specialOffers,
    List<ServiceCategory>? serviceCategories,
    List<Salon>? topRatedSalons,
    bool? isSearchActive,
    String? searchQuery,
    List<Salon>? filteredSalons,
    HomeTab? selectedTab,
    List<Salon>? tabFilteredSalons,
    List<String>? searchSuggestions,
    List<String>? searchHistory,
    bool? showSuggestions,
  }) {
    return HomeLoaded(
      userName: userName ?? this.userName,
      hasNotifications: hasNotifications ?? this.hasNotifications,
      specialOffers: specialOffers ?? this.specialOffers,
      serviceCategories: serviceCategories ?? this.serviceCategories,
      topRatedSalons: topRatedSalons ?? this.topRatedSalons,
      isSearchActive: isSearchActive ?? this.isSearchActive,
      searchQuery: searchQuery ?? this.searchQuery,
      filteredSalons: filteredSalons ?? this.filteredSalons,
      selectedTab: selectedTab ?? this.selectedTab,
      tabFilteredSalons: tabFilteredSalons ?? this.tabFilteredSalons,
      searchSuggestions: searchSuggestions ?? this.searchSuggestions,
      searchHistory: searchHistory ?? this.searchHistory,
      showSuggestions: showSuggestions ?? this.showSuggestions,
    );
  }
}

/// Estado de error al cargar datos
class HomeError extends HomeState {
  /// Mensaje de error.
  final String message;

  /// Constructor de HomeError.
  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}
