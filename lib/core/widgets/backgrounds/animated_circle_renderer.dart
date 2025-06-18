import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'animated_circle.dart';

/// Widget que renderiza círculos animados para el fondo
/// 
/// Encapsula la lógica de renderizado de círculos animados
/// para mantener el componente principal más limpio
class AnimatedCircleRenderer extends StatelessWidget {
  /// Lista de círculos a renderizar
  final List<AnimatedCircle> circles;
  
  /// Controlador de animación
  final Animation<double> animation;
  
  /// Color personalizado para círculos (opcional)
  final Color? circleColor;
  
  /// Constructor para el renderizador de círculos
  const AnimatedCircleRenderer({
    super.key,
    required this.circles,
    required this.animation,
    this.circleColor,
  });
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: circles.map((circle) {
        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Positioned(
              left: MediaQuery.of(context).size.width * circle.posX - circle.radius,
              top: MediaQuery.of(context).size.height * circle.posY - circle.radius,
              child: Opacity(
                opacity: circle.opacity,
                child: Container(
                  width: circle.radius * 2,
                  height: circle.radius * 2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: circleColor ?? AppTheme.kLightGold,
                      width: circle.strokeWidth,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
