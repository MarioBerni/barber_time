
/// Clase para almacenar datos de círculos animados
/// 
/// Encapsula toda la información necesaria para generar y animar
/// círculos flotantes en fondos decorativos
class AnimatedCircle {
  /// Posición horizontal relativa (0.0 - 1.0)
  double posX;
  
  /// Posición vertical relativa (0.0 - 1.0)
  double posY;
  
  /// Velocidad horizontal (relativa al tamaño de la pantalla)
  double velocityX;
  
  /// Velocidad vertical (relativa al tamaño de la pantalla)
  double velocityY;
  
  /// Radio del círculo en píxeles
  double radius;
  
  /// Opacidad del círculo (0.0 - 1.0)
  double opacity;
  
  /// Ancho del borde del círculo
  double strokeWidth;
  
  /// Constructor principal para círculos animados
  AnimatedCircle({
    required this.posX,
    required this.posY,
    required this.velocityX,
    required this.velocityY,
    required this.radius,
    required this.opacity,
    required this.strokeWidth,
  });
  
  /// Actualiza la posición del círculo basado en su velocidad
  /// Maneja rebotes en los bordes de la pantalla
  void updatePosition() {
    // Actualizar posición
    posX += velocityX;
    posY += velocityY;
    
    // Rebote en los bordes horizontales
    if (posX <= 0 || posX >= 1) {
      velocityX = -velocityX;
    }
    
    // Rebote en los bordes verticales
    if (posY <= 0 || posY >= 1) {
      velocityY = -velocityY;
    }
    
    // Mantener dentro de los límites
    posX = posX.clamp(0.0, 1.0);
    posY = posY.clamp(0.0, 1.0);
  }
}
