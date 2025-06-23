import 'package:flutter/material.dart';
import 'animated_circle.dart';

/// Versión simplificada del renderizador de círculos
/// 
/// No muestra ningún círculo pero mantiene la compatibilidad
/// con el código existente
class AnimatedCircleRenderer extends StatelessWidget {
  /// Lista de círculos a renderizar (ignorados en esta versión)
  final List<AnimatedCircle> circles;
  
  /// Controlador de animación (ignorado en esta versión)
  final Animation<double> animation;
  
  /// Color personalizado para círculos (ignorado en esta versión)
  final Color? circleColor;
  
  /// Constructor simplificado
  const AnimatedCircleRenderer({
    super.key,
    required this.circles,
    required this.animation,
    this.circleColor,
  });
  
  @override
  Widget build(BuildContext context) {
    // No renderiza nada, simplemente devuelve un contenedor vacío
    return Container();
  }
}
