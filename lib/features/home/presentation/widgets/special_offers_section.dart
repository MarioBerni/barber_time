import 'package:flutter/material.dart';

import '../../../../core/widgets/carousels/horizontal_carousel.dart';
import '../../domain/entities/special_offer.dart';
import 'home_special_offer_card.dart';

/// Widget para mostrar la sección de ofertas especiales.
///
/// Muestra un carrusel deslizable de ofertas especiales utilizando
/// [HomeSpecialOfferCard]. Diseñado para ser reutilizable en diferentes
/// partes de la aplicación.
class SpecialOffersSection extends StatelessWidget {
  /// Lista de ofertas especiales a mostrar.
  final List<SpecialOffer> offers;

  /// Altura del carrusel. Por defecto es 180.
  final double height;

  /// Padding horizontal exterior del carrusel. Por defecto es 12.0.
  final double horizontalPadding;

  /// Padding entre elementos del carrusel. Por defecto es 4.0.
  final double itemSpacing;

  /// Callback opcional que se ejecuta cuando se selecciona una oferta.
  final ValueChanged<SpecialOffer>? onOfferSelected;

  /// Física de desplazamiento para el ListView.
  final ScrollPhysics? physics;

  /// Constructor de la sección de ofertas especiales.
  const SpecialOffersSection({
    super.key,
    required this.offers,
    this.height = 180.0,
    this.horizontalPadding = 12.0,
    this.itemSpacing = 4.0,
    this.onOfferSelected,
    this.physics = const BouncingScrollPhysics(),
  });

  @override
  Widget build(BuildContext context) {
    return HorizontalCarousel<SpecialOffer>(
      items: offers,
      height: height,
      horizontalPadding: horizontalPadding,
      itemSpacing: itemSpacing,
      physics: physics,
      onItemSelected: onOfferSelected,
      itemBuilder: (context, offer, index) =>
          HomeSpecialOfferCard(offer: offer),
    );
  }
}
