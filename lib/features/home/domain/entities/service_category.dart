/// Entidad que representa una categoría de servicio en la aplicación
class ServiceCategory {
  /// Identificador único de la categoría
  final String id;
  
  /// Nombre de la categoría de servicio
  final String name;
  
  /// Icono asociado a la categoría
  final String iconName;
  
  /// URL del icono (alternativa al iconName)
  final String? iconUrl;
  
  /// Color asociado a la categoría (opcional)
  final String? colorHex;
  
  /// Indica si la categoría está activa o no
  final bool isActive;
  
  /// Constructor de la entidad
  const ServiceCategory({
    required this.id,
    required this.name,
    required this.iconName,
    this.iconUrl,
    this.colorHex,
    this.isActive = true,
  });
}
