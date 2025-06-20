/// Entidad que representa un salón de estética en la aplicación
class Salon {
  /// Identificador único del salón
  final String id;
  
  /// Nombre del salón
  final String name;
  
  /// Dirección del salón
  final String address;
  
  /// URL de la imagen principal del salón
  final String imageUrl;
  
  /// Lista de URLs de imágenes adicionales
  final List<String>? additionalImages;
  
  /// Calificación promedio del salón (1-5)
  final double rating;
  
  /// Número de reseñas del salón
  final int reviewCount;
  
  /// Precio promedio o rango de precios
  final String price;
  
  /// Indica si el salón está marcado como favorito
  final bool isFavorite;
  
  /// Distancia al salón (opcional)
  final String? distance;
  
  /// Constructor de la entidad
  const Salon({
    required this.id,
    required this.name,
    required this.address,
    required this.imageUrl,
    this.additionalImages,
    required this.rating,
    required this.reviewCount,
    required this.price,
    this.isFavorite = false,
    this.distance,
  });
}
