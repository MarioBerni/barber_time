import 'package:flutter/material.dart';

/// Widget genérico para mostrar un carrusel horizontal de elementos.
///
/// Proporciona una base reutilizable para cualquier carrusel horizontal en la
/// aplicación, con opciones personalizables de estilo, desplazamiento y
/// comportamiento.
class HorizontalCarousel<T> extends StatelessWidget {
  /// Lista de elementos a mostrar en el carrusel.
  final List<T> items;

  /// Constructor de elementos que convierte cada ítem en un widget.
  final Widget Function(BuildContext context, T item, int index) itemBuilder;

  /// Altura del carrusel. Por defecto es 180.
  final double height;

  /// Padding horizontal exterior del carrusel. Por defecto es 12.0.
  final double horizontalPadding;

  /// Padding entre elementos del carrusel. Por defecto es 4.0.
  final double itemSpacing;

  /// Física de desplazamiento para el ListView.
  final ScrollPhysics? physics;

  /// Controlador opcional para el ListView.
  final ScrollController? controller;

  /// Callback opcional que se ejecuta cuando se selecciona un elemento.
  final ValueChanged<T>? onItemSelected;

  /// Offset inicial del carrusel.
  final double? initialScrollOffset;

  /// Si es true, el carrusel hace loop infinito.
  final bool infiniteScroll;

  /// Velocidad de auto-desplazamiento en segundos por pantalla (null para
  /// deshabilitar).
  final double? autoScrollSpeed;

  /// Si es true, muestra indicadores de página.
  final bool showPageIndicator;

  /// Constructor del carrusel horizontal.
  const HorizontalCarousel({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.height = 180.0,
    this.horizontalPadding = 12.0,
    this.itemSpacing = 4.0,
    this.physics = const BouncingScrollPhysics(),
    this.controller,
    this.onItemSelected,
    this.initialScrollOffset,
    this.infiniteScroll = false,
    this.autoScrollSpeed,
    this.showPageIndicator = false,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return SizedBox(height: height);
    }

    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: physics,
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        itemCount: infiniteScroll ? null : items.length,
        controller: controller,
        itemBuilder: (context, index) {
          // Si infiniteScroll está habilitado, hacemos módulo del índice
          // para que la lista sea infinita
          final effectiveIndex = infiniteScroll ? index % items.length : index;
          final item = items[effectiveIndex];

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: itemSpacing),
            child: GestureDetector(
              onTap: onItemSelected != null
                  ? () => onItemSelected!(item)
                  : null,
              child: itemBuilder(context, item, effectiveIndex),
            ),
          );
        },
      ),
    );
  }
}
