import '../entities/salon.dart';
import '../entities/service_category.dart';
import '../entities/special_offer.dart';

/// Repositorio para obtener datos de la página de inicio
///
/// Define la interfaz para acceder a los datos que se mostrarán
/// en la página de inicio
abstract class HomeRepository {
  /// Obtiene la lista de ofertas especiales
  Future<List<SpecialOffer>> getSpecialOffers();

  /// Obtiene las categorías de servicios disponibles
  Future<List<ServiceCategory>> getServiceCategories();

  /// Obtiene los salones mejor valorados
  Future<List<Salon>> getTopRatedSalons();

  /// Obtiene los salones recomendados para el usuario
  Future<List<Salon>> getRecommendedSalons();

  /// Obtiene el nombre de usuario para el saludo personalizado
  Future<String> getUserDisplayName();

  /// Devuelve si hay notificaciones no leídas
  Future<bool> hasUnreadNotifications();
}
