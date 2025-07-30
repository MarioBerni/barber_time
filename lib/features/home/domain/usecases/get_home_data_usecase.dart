import '../entities/salon.dart';
import '../entities/service_category.dart';
import '../entities/special_offer.dart';
import '../repositories/home_repository.dart';

/// Caso de uso para obtener todos los datos necesarios para la página de inicio
class GetHomeDataUsecase {
  final HomeRepository _repository;

  /// Constructor que recibe el repositorio como dependencia
  GetHomeDataUsecase(this._repository);

  /// Ejecuta el caso de uso para obtener los datos de la página de inicio
  ///
  /// Retorna un [HomeData] con toda la información necesaria para la UI
  Future<HomeData> execute() async {
    final specialOffers = await _repository.getSpecialOffers();
    final serviceCategories = await _repository.getServiceCategories();
    final topRatedSalons = await _repository.getTopRatedSalons();
    final userName = await _repository.getUserDisplayName();
    final hasNotifications = await _repository.hasUnreadNotifications();

    return HomeData(
      userName: userName,
      hasNotifications: hasNotifications,
      specialOffers: specialOffers,
      serviceCategories: serviceCategories,
      topRatedSalons: topRatedSalons,
    );
  }
}

/// Clase que encapsula todos los datos necesarios para la página de inicio
class HomeData {
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

  /// Constructor de HomeData.
  HomeData({
    required this.userName,
    required this.hasNotifications,
    required this.specialOffers,
    required this.serviceCategories,
    required this.topRatedSalons,
  });
}
