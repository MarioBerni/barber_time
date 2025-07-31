import 'package:flutter/material.dart';

import '../../theme/app_design_constants.dart';

/// Componente unificado de espaciadores
/// Elimina duplicaciones de SizedBox en toda la aplicación
class AppSpacers {
  // Privado para evitar instanciación
  AppSpacers._();

  // ===== ESPACIADORES VERTICALES =====

  /// Espaciador mínimo (4px)
  static const Widget xxs = SizedBox(height: AppDesignConstants.spacingXXS);

  /// Espaciador extra pequeño (8px)
  static const Widget xs = SizedBox(height: AppDesignConstants.spacingXS);

  /// Espaciador pequeño (12px)
  static const Widget sm = SizedBox(height: AppDesignConstants.spacingSM);

  /// Espaciador medio (16px) - Estándar
  static const Widget md = SizedBox(height: AppDesignConstants.spacingMD);

  /// Espaciador grande (24px) - Entre secciones
  static const Widget lg = SizedBox(height: AppDesignConstants.spacingLG);

  /// Espaciador extra grande (32px) - Entre bloques
  static const Widget xl = SizedBox(height: AppDesignConstants.spacingXL);

  /// Espaciador extra extra grande (48px)
  static const Widget xxl = SizedBox(height: AppDesignConstants.spacingXXL);

  // ===== ESPACIADORES HORIZONTALES =====

  /// Espaciador horizontal mínimo (4px)
  static const Widget hXxs = SizedBox(width: AppDesignConstants.spacingXXS);

  /// Espaciador horizontal extra pequeño (8px)
  static const Widget hXs = SizedBox(width: AppDesignConstants.spacingXS);

  /// Espaciador horizontal pequeño (12px)
  static const Widget hSm = SizedBox(width: AppDesignConstants.spacingSM);

  /// Espaciador horizontal medio (16px) - Estándar
  static const Widget hMd = SizedBox(width: AppDesignConstants.spacingMD);

  /// Espaciador horizontal grande (24px)
  static const Widget hLg = SizedBox(width: AppDesignConstants.spacingLG);

  /// Espaciador horizontal extra grande (32px)
  static const Widget hXl = SizedBox(width: AppDesignConstants.spacingXL);

  // ===== ESPACIADORES FLEXIBLES =====

  /// Espaciador flexible que ocupa todo el espacio disponible
  static const Widget flexible = Spacer();

  /// Espaciador flexible con factor de flexibilidad
  static Widget flexibleWithFactor(int factor) => Spacer(flex: factor);

  // ===== MÉTODOS UTILITARIOS =====

  /// Crea un espaciador vertical personalizado
  static Widget vertical(double height) => SizedBox(height: height);

  /// Crea un espaciador horizontal personalizado
  static Widget horizontal(double width) => SizedBox(width: width);

  /// Crea un espaciador cuadrado
  static Widget square(double size) => SizedBox(width: size, height: size);

  // ===== ESPACIADORES PARA SLIVERS =====

  /// Espaciador para SliverToBoxAdapter (16px)
  static const Widget sliverMd = SliverToBoxAdapter(child: md);

  /// Espaciador para SliverToBoxAdapter (24px)
  static const Widget sliverLg = SliverToBoxAdapter(child: lg);

  /// Espaciador para SliverToBoxAdapter (32px)
  static const Widget sliverXl = SliverToBoxAdapter(child: xl);

  // ===== ESPACIADORES CONDICIONALES =====

  /// Espaciador que se muestra solo si la condición es verdadera
  static Widget conditional(bool condition, {Widget? spacer}) {
    return condition ? (spacer ?? md) : const SizedBox.shrink();
  }

  /// Espaciador que se muestra solo si el widget no es nulo
  static Widget conditionalWidget(Widget? widget, {Widget? spacer}) {
    return widget != null ? (spacer ?? md) : const SizedBox.shrink();
  }

  // ===== ESPACIADORES CON ANIMACIÓN =====

  /// Espaciador que se anima según el valor de la animación
  static Widget animated({
    required Animation<double> animation,
    required double maxHeight,
    Widget? child,
  }) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) =>
          SizedBox(height: animation.value * maxHeight, child: child),
    );
  }
}
