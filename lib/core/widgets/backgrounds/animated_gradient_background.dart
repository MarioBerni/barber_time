import 'dart:math' show Random;

import 'package:flutter/material.dart';

import '../../theme/app_theme_extensions.dart';
// Importamos nuestros módulos
import 'animated_circle.dart';
import 'animated_circle_renderer.dart';
import 'striped_pattern_painter.dart';

/// Widget que proporciona un fondo con degradado y burbujas animadas
///
/// Este componente crea un efecto visual sofisticado
/// mediante múltiples capas:
/// 1. Un degradado lineal principal en dirección vertical
///    con colores de la paleta
/// 2. Un degradado radial para crear efecto de profundidad
/// 3. Círculos animados que rebotan por la pantalla para un efecto dinámico
class AnimatedGradientBackground extends StatefulWidget {
  /// Color primario para el degradado.
  final Color? primaryColor;

  /// Color secundario para el degradado.
  final Color? secondaryColor;

  /// Opacidad del degradado (0.0 - 1.0).
  final double opacity;

  /// Color adicional para el degradado.
  final Color? accentColor;

  /// Determina si se muestran elementos decorativos adicionales.
  final bool showDecorationElements;

  /// Determina si se muestra el círculo animado que rebota.
  final bool showBouncingCircles;

  /// Número de líneas para el patrón de fondo
  final int lineCount;

  /// Opacidad base de las líneas
  final double lineOpacity;

  /// Multiplicador de opacidad para los círculos
  final double circleOpacityFactor;

  /// Constructor del fondo.
  const AnimatedGradientBackground({
    super.key,
    this.primaryColor,
    this.secondaryColor,
    this.accentColor,
    this.opacity = 0.9,
    this.showDecorationElements = true,
    this.showBouncingCircles = true,
    this.lineCount = 40,
    this.lineOpacity = 0.05,
    this.circleOpacityFactor = 1.0,
  });

  /// Métodos factory movidos a GradientBackgroundFactory
  /// Usar GradientBackgroundFactory.professional(), etc.

  @override
  State<AnimatedGradientBackground> createState() =>
      _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState extends State<AnimatedGradientBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late List<AnimatedCircle> _circles;

  @override
  void initState() {
    super.initState();

    // Inicializar círculos animados
    _initCircles();

    // Configurar controlador de animación
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();

    // Escuchar cada frame para actualizar posición
    _animationController.addListener(_updatePosition);
  }

  /// Inicializa los círculos animados con mayor visibilidad
  void _initCircles() {
    final random = Random();
    _circles = [];

    // Definir 3 tamaños de círculos con mayor opacidad
    final circleSizes = [
      // radio, opacidad, grosor de borde
      [16.0, 0.35, 1.5], // Pequeño
      [22.0, 0.32, 1.8], // Mediano
      [28.0, 0.30, 2.0], // Grande
    ];

    // Crear círculos, uno de cada tamaño
    for (int i = 0; i < 3; i++) {
      final sizeData = circleSizes[i % circleSizes.length];
      final radius = sizeData[0];
      final opacity = sizeData[1] * widget.circleOpacityFactor;
      final strokeWidth = sizeData[2];

      final posX = random.nextDouble() * 0.8 + 0.1;
      final posY = random.nextDouble() * 0.8 + 0.1;

      final baseSpeed = 0.002 + (random.nextDouble() * 0.002);
      final speedFactor = 1.0 - (radius / 60.0);
      final velocityX = baseSpeed * speedFactor;
      final velocityY = baseSpeed * speedFactor;

      _circles.add(
        AnimatedCircle(
          posX: posX,
          posY: posY,
          velocityX: random.nextBool() ? velocityX : -velocityX,
          velocityY: random.nextBool() ? velocityY : -velocityY,
          radius: radius,
          opacity: opacity,
          strokeWidth: strokeWidth,
        ),
      );
    }
  }

  /// Actualiza la posición de todos los círculos
  void _updatePosition() {
    if (!widget.showBouncingCircles) return;

    setState(() {
      for (var circle in _circles) {
        circle.updatePosition();
      }
    });
  }

  @override
  void dispose() {
    _animationController
      ..removeListener(_updatePosition)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Obtener colores del tema actual o usar los proporcionados
    final Color baseColor = widget.primaryColor ?? context.backgroundColor;
    final Color secondaryColor = widget.secondaryColor ?? context.deepBlue;

    return Stack(
      children: [
        // Fondo base usando el color del tema
        Container(
          color: context.backgroundColor,
          width: double.infinity,
          height: double.infinity,
        ),

        // Degradado principal mejorado
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [baseColor, secondaryColor],
              stops: const [0.0, 1.0],
            ),
          ),
        ),

        // Patrón de líneas usando el CustomPainter modularizado
        CustomPaint(
          size: Size(size.width, size.height),
          painter: StripedPatternPainter(
            baseColor: baseColor,
            lineCount: widget.lineCount,
            baseOpacity: widget.lineOpacity,
          ),
        ),

        // Efectos de brillo y línea diagonal eliminados
        // para un fondo más limpio

        // Círculos animados usando el componente modularizado
        Visibility(
          visible: widget.showBouncingCircles,
          child: AnimatedCircleRenderer(
            circles: _circles,
            animation: _animationController,
          ),
        ),
      ],
    );
  }

  // Métodos de efectos visuales eliminados para un diseño más limpio
}
