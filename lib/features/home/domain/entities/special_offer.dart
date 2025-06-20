/// Entidad que representa una oferta especial en la aplicación
class SpecialOffer {
  /// Identificador único de la oferta
  final String id;
  
  /// Título de la oferta
  final String title;
  
  /// Descripción breve de la oferta
  final String description;
  
  /// Porcentaje o cantidad de descuento
  final String discount;
  
  /// URL de la imagen de la oferta
  final String imageUrl;
  
  /// Fecha de vencimiento de la oferta
  final DateTime? expiryDate;
  
  /// Código promocional asociado a la oferta (si existe)
  final String? promoCode;

  /// Constructor de la entidad
  const SpecialOffer({
    required this.id,
    required this.title,
    required this.description,
    required this.discount,
    required this.imageUrl,
    this.expiryDate,
    this.promoCode,
  });
}
