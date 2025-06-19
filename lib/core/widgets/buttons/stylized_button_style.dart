import 'package:flutter/material.dart';
import '../../theme/app_theme_extensions.dart';
import 'stylized_button_types.dart';

/// Clase de ayuda para los estilos y configuraciones visuales del StylizedButton
class StylizedButtonStyleHelper {
  /// Obtener el estilo del botón según su tipo
  static ButtonStyle getButtonStyle(
    BuildContext context, 
    StylizedButtonType type, 
    bool isPressed,
  ) {
    switch (type) {
      case StylizedButtonType.primary:
        return ElevatedButton.styleFrom(
          // Botón primario con dorado elegante desde el tema centralizado
          backgroundColor: context.mediumGold, // Usa el dorado del tema centralizado
          foregroundColor: Colors.white,
          elevation: isPressed ? 0 : 2,
          shadowColor: context.mediumGold.withOpacity(0.3), // Sombra consistente con el tema
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          padding: EdgeInsets.zero,
        );
        
      case StylizedButtonType.secondary:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: context.primaryColor,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: context.buttonBorderRadius,
            side: BorderSide(
              color: context.primaryColor,
              width: 1.5,
            ),
          ),
          padding: EdgeInsets.zero,
        );
        
      case StylizedButtonType.tertiary:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: context.primaryColor,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          padding: EdgeInsets.zero,
        );
    }
  }
  
  /// Obtener el color del contenido según el tipo de botón
  static Color getContentColor(BuildContext context, StylizedButtonType type) {
    switch (type) {
      case StylizedButtonType.primary:
        return Colors.white;
        
      case StylizedButtonType.secondary:
      case StylizedButtonType.tertiary:
        return context.primaryColor;
    }
  }
  
  /// Obtener el estilo de texto según el tipo de botón
  static TextStyle getTextStyle(
    BuildContext context, 
    StylizedButtonType type, 
    bool isPressed, 
    bool showPressEffect,
  ) {
    final baseStyle = context.button;
    
    switch (type) {
      case StylizedButtonType.primary:
        return baseStyle.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14.0, // Tamaño de fuente reducido para proporcionalidad
        );
        
      case StylizedButtonType.secondary:
        return baseStyle.copyWith(
          color: context.primaryColor,
          fontWeight: FontWeight.w600,
        );
        
      case StylizedButtonType.tertiary:
        return baseStyle.copyWith(
          color: context.primaryColor,
          fontWeight: FontWeight.w500,
          decoration: showPressEffect && isPressed 
              ? TextDecoration.underline 
              : TextDecoration.none,
        );
    }
  }
  
  /// Obtener el padding por defecto según el tipo de botón
  static EdgeInsets getDefaultPadding(StylizedButtonType type) {
    switch (type) {
      case StylizedButtonType.primary:
      case StylizedButtonType.secondary:
        return const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 12.0,
        );
        
      case StylizedButtonType.tertiary:
        return const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        );
    }
  }
  
  /// Obtener el efecto de resplandor (glow) para el botón primario
  static List<BoxShadow> getGlowEffect(BuildContext context) {
    return [
      BoxShadow(
        color: context.accentColor.withOpacity(0.6),
        blurRadius: 20.0,
        spreadRadius: 2.0,
      ),
    ];
  }
}
