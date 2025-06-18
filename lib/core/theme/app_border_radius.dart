import 'package:flutter/material.dart';

/// Clase que centraliza todos los radios de borde estándar de la aplicación
/// Proporciona constantes y métodos para usar bordes consistentes en toda la app
class AppBorderRadius {
  // Valores básicos
  static const double none = 0.0;
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double xxl = 24.0;
  static const double circle = 999.0;

  // Bordes redondeados para componentes específicos
  static const double button = md;
  static const double card = md;
  static const double chip = xl;
  static const double textField = sm;
  static const double bottomSheet = lg;
  static const double modal = lg;
  static const double snackbar = sm;
  static const double tooltip = sm;
  
  // BorderRadius constructores para uso directo
  static BorderRadius get defaultBorderRadius => BorderRadius.circular(md);
  static BorderRadius get buttonBorderRadius => BorderRadius.circular(button);
  static BorderRadius get cardBorderRadius => BorderRadius.circular(card);
  static BorderRadius get chipBorderRadius => BorderRadius.circular(chip);
  static BorderRadius get textFieldBorderRadius => BorderRadius.circular(textField);
  static BorderRadius get bottomSheetBorderRadius => const BorderRadius.only(
        topLeft: Radius.circular(bottomSheet),
        topRight: Radius.circular(bottomSheet),
      );
  
  // Métodos de ayuda
  static BorderRadius all(double radius) => BorderRadius.circular(radius);
  
  static BorderRadius only({
    double topLeft = 0.0,
    double topRight = 0.0,
    double bottomLeft = 0.0,
    double bottomRight = 0.0,
  }) {
    return BorderRadius.only(
      topLeft: Radius.circular(topLeft),
      topRight: Radius.circular(topRight),
      bottomLeft: Radius.circular(bottomLeft),
      bottomRight: Radius.circular(bottomRight),
    );
  }
  
  static BorderRadius top(double radius) => BorderRadius.only(
    topLeft: Radius.circular(radius),
    topRight: Radius.circular(radius),
  );
  
  static BorderRadius bottom(double radius) => BorderRadius.only(
    bottomLeft: Radius.circular(radius),
    bottomRight: Radius.circular(radius),
  );
  
  static BorderRadius left(double radius) => BorderRadius.only(
    topLeft: Radius.circular(radius),
    bottomLeft: Radius.circular(radius),
  );
  
  static BorderRadius right(double radius) => BorderRadius.only(
    topRight: Radius.circular(radius),
    bottomRight: Radius.circular(radius),
  );
}
