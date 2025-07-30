import 'package:flutter/material.dart';

/// Clase que centraliza todos los radios de borde estándar de la aplicación.
///
/// Proporciona constantes y métodos para usar bordes consistentes en toda la
/// app.
class AppBorderRadius {
  /// Sin radio de borde.
  static const double none = 0.0;

  /// Radio de borde extra pequeño.
  static const double xs = 4.0;

  /// Radio de borde pequeño.
  static const double sm = 8.0;

  /// Radio de borde mediano (estándar).
  static const double md = 12.0;

  /// Radio de borde grande.
  static const double lg = 16.0;

  /// Radio de borde extra grande.
  static const double xl = 20.0;

  /// Radio de borde extra extra grande.
  static const double xxl = 24.0;

  /// Radio de borde completamente circular.
  static const double circle = 999.0;

  // Bordes redondeados para componentes específicos
  /// Radio de borde para botones.
  static const double button = md;

  /// Radio de borde para tarjetas (cards).
  static const double card = md;

  /// Radio de borde para chips.
  static const double chip = xl;

  /// Radio de borde para campos de texto.
  static const double textField = sm;

  /// Radio de borde para hojas inferiores (bottom sheets).
  static const double bottomSheet = lg;

  /// Radio de borde para modales.
  static const double modal = lg;

  /// Radio de borde para snackbars.
  static const double snackbar = sm;

  /// Radio de borde para tooltips.
  static const double tooltip = sm;

  // BorderRadius constructores para uso directo
  /// BorderRadius con el radio de borde por defecto (`md`).
  static BorderRadius get defaultBorderRadius => BorderRadius.circular(md);

  /// BorderRadius para botones.
  static BorderRadius get buttonBorderRadius => BorderRadius.circular(button);

  /// BorderRadius para tarjetas (cards).
  static BorderRadius get cardBorderRadius => BorderRadius.circular(card);

  /// BorderRadius para chips.
  static BorderRadius get chipBorderRadius => BorderRadius.circular(chip);

  /// BorderRadius para campos de texto.
  static BorderRadius get textFieldBorderRadius =>
      BorderRadius.circular(textField);

  /// BorderRadius para hojas inferiores (solo esquinas superiores).
  static BorderRadius get bottomSheetBorderRadius => const BorderRadius.only(
    topLeft: Radius.circular(bottomSheet),
    topRight: Radius.circular(bottomSheet),
  );

  // Métodos de ayuda
  /// Crea un `BorderRadius` con el mismo radio en todas las esquinas.
  static BorderRadius all(double radius) => BorderRadius.circular(radius);

  /// Crea un `BorderRadius` con radios específicos para cada esquina.
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

  /// Crea un `BorderRadius` con el mismo radio en las esquinas superiores.
  static BorderRadius top(double radius) => BorderRadius.only(
    topLeft: Radius.circular(radius),
    topRight: Radius.circular(radius),
  );

  /// Crea un `BorderRadius` con el mismo radio en las esquinas inferiores.
  static BorderRadius bottom(double radius) => BorderRadius.only(
    bottomLeft: Radius.circular(radius),
    bottomRight: Radius.circular(radius),
  );

  /// Crea un `BorderRadius` con el mismo radio en las esquinas izquierdas.
  static BorderRadius left(double radius) => BorderRadius.only(
    topLeft: Radius.circular(radius),
    bottomLeft: Radius.circular(radius),
  );

  /// Crea un `BorderRadius` con el mismo radio en las esquinas derechas.
  static BorderRadius right(double radius) => BorderRadius.only(
    topRight: Radius.circular(radius),
    bottomRight: Radius.circular(radius),
  );
}
