import 'package:flutter/material.dart';
import '../../../../core/widgets/containers/glam_container.dart';
import '../../domain/entities/special_offer.dart';

/// Widget que muestra una tarjeta de oferta especial
class HomeSpecialOfferCard extends StatelessWidget {
  /// La oferta especial a mostrar
  final SpecialOffer offer;

  /// Constructor del widget de oferta especial
  const HomeSpecialOfferCard({
    super.key,
    required this.offer,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return GlamContainer(
      fixedSize: const Size(280, 160),
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                offer.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: theme.colorScheme.primary.withAlpha((0.2 * 255).round()),
                    child: Center(child: Icon(Icons.image_not_supported)),
                  );
                },
              ),
            ),
          ),
          
          // Gradiente para mejorar legibilidad del texto
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withAlpha((0.7 * 255).round()),
                  ],
                ),
              ),
            ),
          ),
          
          // Contenido de la oferta
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  offer.description,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      offer.discount,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (offer.promoCode != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          offer.promoCode!,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
