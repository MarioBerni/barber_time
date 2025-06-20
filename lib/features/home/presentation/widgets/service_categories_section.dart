import 'package:flutter/material.dart';

import '../../../../core/widgets/carousels/horizontal_carousel.dart';
import '../../domain/entities/service_category.dart';
import 'home_service_category_item.dart';

/// Widget para mostrar la sección de categorías de servicios en un carrusel horizontal.
///
/// Muestra un carrusel deslizable de categorías de servicios utilizando [HomeServiceCategoryItem].
/// Diseñado para ser reutilizable en diferentes partes de la aplicación.
class ServiceCategoriesSection extends StatelessWidget {
  /// Lista de categorías de servicios a mostrar.
  final List<ServiceCategory> categories;

  /// Altura del carrusel. Por defecto es 110.
  final double height;

  /// Padding horizontal exterior del carrusel. Por defecto es 12.0.
  final double horizontalPadding;

  /// Padding entre elementos del carrusel. Por defecto es 8.0.
  final double itemSpacing;

  /// Callback opcional que se ejecuta cuando se selecciona una categoría.
  final Function(ServiceCategory)? onCategorySelected;

  /// Física de desplazamiento para el ListView. Por defecto es BouncingScrollPhysics.
  final ScrollPhysics? physics;

  const ServiceCategoriesSection({
    super.key,
    required this.categories,
    this.height = 110.0,
    this.horizontalPadding = 12.0,
    this.itemSpacing = 8.0,
    this.onCategorySelected,
    this.physics = const BouncingScrollPhysics(),
  });

  @override
  Widget build(BuildContext context) {
    return HorizontalCarousel<ServiceCategory>(
      items: categories,
      height: height,
      horizontalPadding: horizontalPadding,
      itemSpacing: itemSpacing,
      physics: physics,
      onItemSelected: onCategorySelected,
      itemBuilder: (context, category, index) => HomeServiceCategoryItem(category: category),
    );
  }
}
