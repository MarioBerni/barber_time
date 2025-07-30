/// Versión simplificada de la clase para círculos animados
///
/// Mantiene la estructura para compatibilidad pero sin implementación
/// de efectos visuales
class AnimatedCircle {
  /// Posición en el eje X.
  double posX = 0;

  /// Posición en el eje Y.
  double posY = 0;

  /// Velocidad en el eje X.
  double velocityX = 0;

  /// Velocidad en el eje Y.
  double velocityY = 0;

  /// Radio del círculo.
  double radius = 0;

  /// Opacidad del círculo.
  double opacity = 0;

  /// Ancho del borde del círculo.
  double strokeWidth = 0;

  /// Constructor simplificado
  AnimatedCircle({
    this.posX = 0,
    this.posY = 0,
    this.velocityX = 0,
    this.velocityY = 0,
    this.radius = 0,
    this.opacity = 0,
    this.strokeWidth = 0,
  });

  /// Método vacío que no hace nada (mantenido para compatibilidad)
  void updatePosition() {
    // No hace nada en esta implementación simplificada
  }
}
