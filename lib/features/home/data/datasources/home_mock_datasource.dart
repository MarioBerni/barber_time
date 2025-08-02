import '../../domain/entities/salon.dart';
import '../../domain/entities/service_category.dart';

/// Fuente de datos mock para la página de inicio
///
/// Esta clase simula una API o base de datos real proporcionando
/// datos estáticos para desarrollo y pruebas
class HomeMockDatasource {
  /// Obtiene categorías de servicios mock
  Future<List<ServiceCategory>> getServiceCategories() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));

    return const [
      ServiceCategory(id: '1', name: 'Haircut', iconName: 'scissors'),
      ServiceCategory(id: '2', name: 'Shaving', iconName: 'content_cut'),
      ServiceCategory(id: '3', name: 'Styling', iconName: 'brush'),
      ServiceCategory(id: '4', name: 'Coloring', iconName: 'color_lens'),
      ServiceCategory(id: '5', name: 'Make Up', iconName: 'face'),
    ];
  }

  /// Obtiene salones mejor valorados mock
  Future<List<Salon>> getTopRatedSalons() async {
    await Future<void>.delayed(const Duration(milliseconds: 1000));

    return [
      const Salon(
        id: '1',
        name: 'GlowUp Studio',
        address: 'Tower Plaza, Sheikh Zayed Road',
        imageUrl:
            'https://images.unsplash.com/photo-1521590832167-7bcbfaa6381f',
        rating: 4.8,
        reviewCount: 128,
        price: '\$200',
        isFavorite: true,
      ),
      const Salon(
        id: '2',
        name: 'Supreme Cuts',
        address: 'Avenida Italia 4270, Montevideo',
        imageUrl:
            'https://images.unsplash.com/photo-1585747860715-2ba37e788b70',
        rating: 4.7,
        reviewCount: 94,
        price: '\$150',
      ),
      const Salon(
        id: '3',
        name: 'Barber Kings',
        address: 'Bulevar Artigas 1251, Montevideo',
        imageUrl:
            'https://images.unsplash.com/photo-1622288432207-ee648dfcc28d',
        rating: 4.6,
        reviewCount: 76,
        price: '\$120',
        isFavorite: true,
      ),
    ];
  }

  /// Obtiene los salones recomendados mock
  Future<List<Salon>> getRecommendedSalons() async {
    await Future<void>.delayed(const Duration(milliseconds: 900));

    return [
      const Salon(
        id: '4',
        name: 'Classic Men',
        address: '18 de Julio 1234, Montevideo',
        imageUrl:
            'https://images.unsplash.com/photo-1503951914875-452162b0f3f1',
        rating: 4.5,
        reviewCount: 62,
        price: '\$90',
      ),
      const Salon(
        id: '5',
        name: 'The Barber Shop',
        address: 'Luis Alberto de Herrera 2345, Montevideo',
        imageUrl:
            'https://images.unsplash.com/photo-1534297635766-a262cdcb8ee4',
        rating: 4.4,
        reviewCount: 53,
        price: '\$100',
      ),
    ];
  }

  /// Obtiene el nombre de usuario mock para el saludo
  Future<String> getUserDisplayName() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return 'Johny';
  }

  /// Simula si hay notificaciones no leídas
  Future<bool> hasUnreadNotifications() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return true;
  }
}
