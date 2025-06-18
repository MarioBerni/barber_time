import 'package:flutter/material.dart';
import '../../theme/app_theme_extensions.dart';

/// Enumeración de tipos de degradados predefinidos
enum GradientType {
  /// Degradado profesional de arriba hacia abajo
  professionalVertical,
  
  /// Degradado con efecto de iluminación desde una esquina
  cornerLight,
  
  /// Viñeta estilizada con bordes oscurecidos
  vignette,
  
  /// Degradado radial desde el centro
  radialCenter,
  
  /// Efecto de luz superior tipo "spotlight"
  topSpotlight,
}

/// Widget que proporciona una superposición de degradado configurable
///
/// Este componente crea una capa de degradado que puede superponerse
/// sobre cualquier otro fondo o contenido para crear efectos visuales
/// como iluminación profesional, viñetas o destellos.
class GradientOverlayBackground extends StatelessWidget {
  /// Color primario del degradado
  final Color? primaryColor;
  
  /// Color secundario del degradado
  final Color? secondaryColor;
  
  /// Tipo de degradado a utilizar
  final GradientType gradientType;
  
  /// Opacidad general del degradado
  final double opacity;
  
  /// Intensidad del efecto (1.0 = normal, 2.0 = doble intensidad)
  final double intensity;
  
  /// Contenido a mostrar debajo del degradado
  final Widget child;
  
  /// Constructor de la superposición de degradado
  const GradientOverlayBackground({
    super.key,
    this.primaryColor,
    this.secondaryColor,
    this.gradientType = GradientType.professionalVertical,
    this.opacity = 0.7,
    this.intensity = 1.0,
    required this.child,
  });
  
  /// Crea una superposición con degradado profesional vertical
  factory GradientOverlayBackground.professional({
    required Widget child,
    Color? primaryColor,
    Color? secondaryColor,
    double opacity = 0.7,
    double intensity = 1.0,
  }) {
    return GradientOverlayBackground(
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      gradientType: GradientType.professionalVertical,
      opacity: opacity,
      intensity: intensity,
      child: child,
    );
  }
  
  /// Crea una superposición con efecto de iluminación desde una esquina
  factory GradientOverlayBackground.cornerLight({
    required Widget child,
    Color? primaryColor,
    Color? secondaryColor,
    double opacity = 0.65,
    double intensity = 1.0,
  }) {
    return GradientOverlayBackground(
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      gradientType: GradientType.cornerLight,
      opacity: opacity,
      intensity: intensity,
      child: child,
    );
  }
  
  /// Crea una superposición con efecto de viñeta estilizada
  factory GradientOverlayBackground.vignette({
    required Widget child,
    Color? primaryColor,
    Color? secondaryColor,
    double opacity = 0.75,
    double intensity = 1.0,
  }) {
    return GradientOverlayBackground(
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      gradientType: GradientType.vignette,
      opacity: opacity,
      intensity: intensity,
      child: child,
    );
  }
  
  /// Crea una superposición con degradado radial desde el centro
  factory GradientOverlayBackground.radial({
    required Widget child,
    Color? primaryColor,
    Color? secondaryColor,
    double opacity = 0.6,
    double intensity = 1.0,
  }) {
    return GradientOverlayBackground(
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      gradientType: GradientType.radialCenter,
      opacity: opacity,
      intensity: intensity,
      child: child,
    );
  }
  
  /// Crea una superposición con efecto de luz superior tipo "spotlight"
  factory GradientOverlayBackground.spotlight({
    required Widget child,
    Color? primaryColor,
    Color? secondaryColor,
    double opacity = 0.55,
    double intensity = 1.0,
  }) {
    return GradientOverlayBackground(
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      gradientType: GradientType.topSpotlight,
      opacity: opacity,
      intensity: intensity,
      child: child,
    );
  }
  
  @override
  Widget build(BuildContext context) {
    // Obtener colores del tema actual o usar los proporcionados
    final baseColor = primaryColor ?? context.primaryColor;
    final accentColor = secondaryColor ?? context.accentColor;
    
    return Stack(
      fit: StackFit.expand,
      children: [
        // El contenido principal
        child,
        
        // Superposición de degradado
        Positioned.fill(
          child: _buildGradientOverlay(
            context,
            baseColor, 
            accentColor,
          ),
        ),
      ],
    );
  }
  
  /// Construye la superposición de degradado según el tipo seleccionado
  Widget _buildGradientOverlay(
    BuildContext context,
    Color baseColor,
    Color accentColor,
  ) {
    switch (gradientType) {
      case GradientType.professionalVertical:
        return _buildProfessionalVerticalGradient(baseColor, accentColor);
      
      case GradientType.cornerLight:
        return _buildCornerLightGradient(baseColor, accentColor);
      
      case GradientType.vignette:
        return _buildVignetteGradient(baseColor, accentColor);
      
      case GradientType.radialCenter:
        return _buildRadialGradient(baseColor, accentColor);
      
      case GradientType.topSpotlight:
        return _buildTopSpotlightGradient(baseColor, accentColor);
    }
  }
  
  /// Construye un degradado vertical profesional
  Widget _buildProfessionalVerticalGradient(Color baseColor, Color accentColor) {
    final Color darkColor = baseColor.withOpacity(opacity * 0.6 * intensity);
    final Color lightColor = accentColor.withOpacity(opacity * 0.2 * intensity);
    
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            darkColor,
            lightColor,
            darkColor.withOpacity(darkColor.opacity * 0.7),
          ],
          stops: const [0.0, 0.6, 1.0],
        ),
      ),
    );
  }
  
  /// Construye un degradado con efecto de iluminación desde una esquina
  Widget _buildCornerLightGradient(Color baseColor, Color accentColor) {
    final Color lightColor = accentColor.withOpacity(opacity * 0.3 * intensity);
    final Color transparentColor = baseColor.withOpacity(0.0);
    
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            lightColor,
            transparentColor,
          ],
          stops: const [0.0, 0.7],
        ),
      ),
    );
  }
  
  /// Construye un efecto de viñeta estilizada
  Widget _buildVignetteGradient(Color baseColor, Color accentColor) {
    final Color darkColor = baseColor.withOpacity(opacity * intensity);
    
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 1.2,
          colors: [
            Colors.transparent,
            darkColor.withOpacity(darkColor.opacity * 0.3),
            darkColor,
          ],
          stops: const [0.6, 0.8, 1.0],
        ),
      ),
    );
  }
  
  /// Construye un degradado radial desde el centro
  Widget _buildRadialGradient(Color baseColor, Color accentColor) {
    final Color centerColor = accentColor.withOpacity(opacity * 0.3 * intensity);
    final Color edgeColor = baseColor.withOpacity(opacity * intensity);
    
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 0.8,
          colors: [
            centerColor,
            edgeColor,
          ],
          stops: const [0.1, 1.0],
        ),
      ),
    );
  }
  
  /// Construye un efecto de luz superior tipo "spotlight"
  Widget _buildTopSpotlightGradient(Color baseColor, Color accentColor) {
    final Color lightColor = accentColor.withOpacity(opacity * 0.4 * intensity);
    final Color darkColor = baseColor.withOpacity(opacity * intensity);
    
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            lightColor,
            darkColor.withOpacity(darkColor.opacity * 0.3),
            darkColor,
          ],
          stops: const [0.0, 0.4, 1.0],
        ),
      ),
    );
  }
}
