import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Clase que proporciona diferentes tipos de transiciones para las rutas
///
/// Centraliza la definición de animaciones para mantener consistencia
/// en toda la aplicación
class RouteTransitions {
  /// Transición con efecto de desvanecimiento
  static CustomTransitionPage<void> fadeTransition({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
      transitionDuration: duration,
    );
  }

  /// Transición con efecto de deslizamiento horizontal
  static CustomTransitionPage<void> slideTransition({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        );
        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      },
      transitionDuration: duration,
    );
  }

  /// Transición con efecto de escala
  static CustomTransitionPage<void> scaleTransition({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final scaleAnimation = Tween<double>(
          begin: 0.9,
          end: 1.0,
        ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));

        final fadeAnimation = Tween<double>(
          begin: 0.5,
          end: 1.0,
        ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));

        return FadeTransition(
          opacity: fadeAnimation,
          child: ScaleTransition(scale: scaleAnimation, child: child),
        );
      },
      transitionDuration: duration,
    );
  }

  /// Transición combinada para botones flotantes o acciones especiales.
  static CustomTransitionPage<void> heroFadeTransition({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
    Duration duration = const Duration(milliseconds: 400),
  }) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: const Interval(0.0, 0.8, curve: Curves.easeIn),
          ),
          child: child,
        );
      },
      transitionDuration: duration,
    );
  }

  /// Transición elegante para cambios de estado con desvanecimiento suave
  static Widget stateTransition({
    required Widget child,
    required Animation<double> animation,
    Duration duration = const Duration(milliseconds: 400),
  }) {
    // Desvanecimiento principal con curva suave
    final fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));

    // Escala sutil para dar profundidad
    final scaleAnimation = Tween<double>(
      begin: 0.98,
      end: 1.0,
    ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic));

    // Blur sutil para efecto de enfoque
    final blurAnimation = Tween<double>(
      begin: 2.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic));

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.scale(
          scale: scaleAnimation.value,
          child: Opacity(
            opacity: fadeAnimation.value,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: blurAnimation.value,
                sigmaY: blurAnimation.value,
              ),
              child: child,
            ),
          ),
        );
      },
      child: child,
    );
  }

  /// Transición suave para navegación hacia atrás
  static Widget backTransition({
    required Widget child,
    required Animation<double> animation,
    Duration duration = const Duration(milliseconds: 350),
  }) {
    // Desvanecimiento con curva suave
    final fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));

    // Escala sutil
    final scaleAnimation = Tween<double>(
      begin: 0.99,
      end: 1.0,
    ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic));

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.scale(
          scale: scaleAnimation.value,
          child: Opacity(opacity: fadeAnimation.value, child: child),
        );
      },
      child: child,
    );
  }

  /// Transición suave para navegación hacia adelante
  static Widget forwardTransition({
    required Widget child,
    required Animation<double> animation,
    Duration duration = const Duration(milliseconds: 350),
  }) {
    // Desvanecimiento con curva suave
    final fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));

    // Escala sutil con efecto de "zoom in"
    final scaleAnimation = Tween<double>(
      begin: 1.01,
      end: 1.0,
    ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic));

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.scale(
          scale: scaleAnimation.value,
          child: Opacity(opacity: fadeAnimation.value, child: child),
        );
      },
      child: child,
    );
  }

  /// Transición simple de desvanecimiento puro
  static Widget simpleFadeTransition({
    required Widget child,
    required Animation<double> animation,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    final fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));

    return FadeTransition(opacity: fadeAnimation, child: child);
  }

  /// Widget wrapper para AnimatedSwitcher con transiciones centralizadas
  static Widget animatedStateSwitcher({
    required Widget child,
    required String stateKey,
    Duration duration = const Duration(milliseconds: 400),
    TransitionType transitionType = TransitionType.state,
  }) {
    return AnimatedSwitcher(
      duration: duration,
      transitionBuilder: (Widget child, Animation<double> animation) {
        switch (transitionType) {
          case TransitionType.state:
            return stateTransition(child: child, animation: animation);
          case TransitionType.back:
            return backTransition(child: child, animation: animation);
          case TransitionType.forward:
            return forwardTransition(child: child, animation: animation);
          case TransitionType.fade:
            return simpleFadeTransition(child: child, animation: animation);
        }
      },
      child: child,
    );
  }
}

/// Tipos de transición disponibles
enum TransitionType {
  /// Transición estándar para cambios de estado
  state,

  /// Transición para navegación hacia atrás
  back,

  /// Transición para navegación hacia adelante
  forward,

  /// Transición simple de desvanecimiento
  fade,
}
