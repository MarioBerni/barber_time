import 'package:flutter/material.dart';

/// Controlador de animaciones para el StylizedButton
///
/// Encapsula la lógica de animaciones de escala y opacidad utilizadas 
/// para los efectos visuales del botón estilizado
class StylizedButtonAnimationController extends StatefulWidget {
  /// El widget hijo que se animará
  final Widget child;
  
  /// Si se debe mostrar un efecto de presión animado
  final bool showPressEffect;
  
  /// Constructor para el controlador de animaciones
  const StylizedButtonAnimationController({
    super.key,
    required this.child,
    required this.showPressEffect,
  });

  @override
  State<StylizedButtonAnimationController> createState() => 
      StylizedButtonAnimationControllerState();
}

class StylizedButtonAnimationControllerState 
    extends State<StylizedButtonAnimationController> 
    with SingleTickerProviderStateMixin {
  
  /// Controlador para la animación de presión
  late AnimationController _pressController;
  
  /// Animación para el efecto de escala
  late Animation<double> _scaleAnimation;
  
  /// Animación para el efecto de opacidad
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    
    // Inicializar animaciones
    _pressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.96,
    ).animate(CurvedAnimation(
      parent: _pressController,
      curve: Curves.easeInOut,
    ));
    
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _pressController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _pressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pressController,
      builder: (context, child) {
        final scale = widget.showPressEffect ? _scaleAnimation.value : 1.0;
        
        return Transform.scale(
          scale: scale,
          child: widget.child,
        );
      }
    );
  }
  
  /// Iniciar la animación de presión
  void forward() {
    if (!widget.showPressEffect) return;
    _pressController.forward();
  }
  
  /// Revertir la animación de presión
  void reverse() {
    if (!widget.showPressEffect) return;
    _pressController.reverse();
  }
  
  /// Obtener el valor actual de la animación de opacidad
  double get opacityValue => _opacityAnimation.value;
}
