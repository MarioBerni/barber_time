import '../../domain/entities/salon.dart';
import '../../domain/entities/service_category.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_mock_datasource.dart';

/// Implementación del repositorio de la página de inicio
class HomeRepositoryImpl implements HomeRepository {
  final HomeMockDatasource _datasource;

  /// Constructor que recibe la fuente de datos
  HomeRepositoryImpl(this._datasource);

  @override
  Future<List<ServiceCategory>> getServiceCategories() {
    return _datasource.getServiceCategories();
  }

  @override
  Future<List<Salon>> getTopRatedSalons() {
    return _datasource.getTopRatedSalons();
  }

  @override
  Future<List<Salon>> getRecommendedSalons() {
    return _datasource.getRecommendedSalons();
  }

  @override
  Future<String> getUserDisplayName() {
    return _datasource.getUserDisplayName();
  }

  @override
  Future<bool> hasUnreadNotifications() {
    return _datasource.hasUnreadNotifications();
  }
}
