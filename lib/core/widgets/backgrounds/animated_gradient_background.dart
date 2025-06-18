import 'dart:math' show Random;
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../theme/app_theme_extensions.dart';

/// Clase para almacenar datos de círculos animados
class AnimatedCircle {
  double posX;
  double posY;
  double velocityX;
  double velocityY;
  double radius;
  double opacity;
  double strokeWidth;
  
  AnimatedCircle({
    required this.posX,
    required this.posY,
    required this.velocityX,
    required this.velocityY,
    required this.radius,
    required this.opacity,
    required this.strokeWidth,
  });
}

/// Painter personalizado para crear un patrón de líneas horizontales
/// Simula el estilo de una barbería vintage con líneas sutiles
class _StripedPatternPainter extends CustomPainter {
  final Color baseColor;
  
  _StripedPatternPainter({required this.baseColor});
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = baseColor.withOpacity(0.03)
      ..strokeWidth = 0.5;
    
    // Crear líneas horizontales muy sutiles como detalle de diseño
    final lineCount = 30;
    final lineSpacing = size.height / lineCount;
    
    for (var i = 0; i < lineCount; i++) {
      final y = i * lineSpacing;
      canvas.drawLine(
        Offset(0, y), 
        Offset(size.width, y), 
        paint
      );
    }
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Widget que proporciona un fondo con degradado y burbujas animadas
/// 
/// Este componente crea un efecto visual sofisticado mediante múltiples capas:
/// 1. Un degradado lineal principal en dirección vertical con colores de la paleta
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
  
  /// Constructor del fondo.
  const AnimatedGradientBackground({
    super.key,
    this.primaryColor,
    this.secondaryColor,
    this.accentColor,
    this.opacity = 0.9,
    this.showDecorationElements = true,
    this.showBouncingCircles = true,
  });
  
  @override
  State<AnimatedGradientBackground> createState() => _AnimatedGradientBackgroundState();
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
  
  /// Inicializa 3 círculos animados con mayor visibilidad
  void _initCircles() {
    final random = Random();
    _circles = [];
    
    // Definir 3 tamaños de círculos con tamaño moderado
    final circleSizes = [
      // radio, opacidad, grosor de borde
      [16.0, 0.22, 1.5],   // Pequeño
      [22.0, 0.20, 1.8],   // Mediano
      [28.0, 0.18, 2.0],   // Grande
    ];
    
    // Crear solo 3 círculos, uno de cada tamaño
    for (int i = 0; i < 3; i++) {
      // Seleccionar un tamaño específico para cada círculo
      final sizeData = circleSizes[i % circleSizes.length];
      final radius = sizeData[0];
      final opacity = sizeData[1];
      final strokeWidth = sizeData[2];
      
      // Posición inicial aleatoria
      final posX = random.nextDouble() * 0.8 + 0.1; // Entre 10% y 90% del ancho
      final posY = random.nextDouble() * 0.8 + 0.1; // Entre 10% y 90% del alto
      
      // Incrementar la velocidad base para todas las burbujas
      final baseSpeed = 0.002 + (random.nextDouble() * 0.002);
      final speedFactor = 1.0 - (radius / 60.0); // Ajuste para que las grandes no sean tan lentas
      final velocityX = baseSpeed * speedFactor;
      final velocityY = baseSpeed * speedFactor;
      
      // Añadir a la lista de círculos
      _circles.add(AnimatedCircle(
        posX: posX,
        posY: posY,
        velocityX: random.nextBool() ? velocityX : -velocityX,
        velocityY: random.nextBool() ? velocityY : -velocityY,
        radius: radius,
        opacity: opacity,
        strokeWidth: strokeWidth,
      ));
    }
  }
  
  /// Actualiza la posición de todos los círculos con efecto de rebote
  void _updatePosition() {
    if (!widget.showBouncingCircles) return;
    
    setState(() {
      // Actualizar todos los círculos
      for (var circle in _circles) {
        // Actualizar posición basada en velocidad
        circle.posX += circle.velocityX;
        circle.posY += circle.velocityY;
        
        // Verificar rebotes en bordes horizontales
        if (circle.posX <= 0 || circle.posX >= 1.0) {
          circle.velocityX *= -1; // Invertir dirección horizontal
          // Asegurar que se mueva al menos un poco lejos del borde
          circle.posX = circle.posX <= 0 ? 0.01 : 0.99;
        }
        
        // Verificar rebotes en bordes verticales
        if (circle.posY <= 0 || circle.posY >= 1.0) {
          circle.velocityY *= -1; // Invertir dirección vertical
          // Asegurar que se mueva al menos un poco lejos del borde
          circle.posY = circle.posY <= 0 ? 0.01 : 0.99;
        }
      }
    });
  }
  
  @override
  void dispose() {
    _animationController.removeListener(_updatePosition);
    _animationController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    // Obtener colores del tema actual usando las extensiones
    final baseColor = widget.primaryColor ?? context.backgroundColor;
    final accentColor = widget.accentColor ?? context.accentColor;
    
    return Stack(
      children: [
        // Fondo base usando el color del tema
        Container(
          color: context.backgroundColor,
          width: double.infinity,
          height: double.infinity,
        ),
        
        // Patrón de líneas finas horizontales (como las de una peluquería vintage)
        CustomPaint(
          size: Size(size.width, size.height),
          painter: _StripedPatternPainter(baseColor: baseColor),
        ),
        
        // Eliminado el resplandor superior derecho a petición del usuario

        
        // Efecto de brillo en parte inferior izquierda
        Positioned(
          bottom: -size.height * 0.1,
          left: -size.width * 0.2,
          child: Container(
            width: size.width * 0.8,
            height: size.width * 0.8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  baseColor.withOpacity(0.15),
                  Colors.transparent,
                ],
                stops: const [0.1, 0.9],
              ),
            ),
          ),
        ),
        
        // Línea diagonal (simboliza una navaja de afeitar)
        Positioned(
          top: size.height * 0.25,
          left: -size.width * 0.1,
          child: Transform.rotate(
            angle: -0.2,
            child: Container(
              height: 1.5,
              width: size.width * 1.2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    accentColor.withOpacity(0.6),
                    accentColor.withOpacity(0.8),
                    accentColor.withOpacity(0.6),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
                ),
              ),
            ),
          ),
        ),
        
        // Múltiples círculos animados que rebotan por la pantalla
        if (widget.showBouncingCircles && widget.showDecorationElements)
          ..._circles.map((circle) {
            return AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Positioned(
                  left: MediaQuery.of(context).size.width * circle.posX - circle.radius,
                  top: MediaQuery.of(context).size.height * circle.posY - circle.radius,
                  child: Opacity(
                    opacity: circle.opacity, // La opacidad ya es alta desde la inicialización
                    child: Container(
                      width: circle.radius * 2,
                      height: circle.radius * 2,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          // Color dorado suavizado para no ser tan intenso
                          color: AppTheme.kAccentColor.withOpacity(0.65),
                          width: circle.strokeWidth, // Borde ya definido más grueso
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
      ],
    );
  }
}
