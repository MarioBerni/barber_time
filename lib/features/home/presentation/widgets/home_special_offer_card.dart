import 'package:flutter/material.dart';

import '../../../../core/theme/app_design_constants.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/widgets/containers/glam_container.dart';
import '../../domain/entities/special_offer.dart';

/// Widget que muestra una tarjeta de oferta especial
class HomeSpecialOfferCard extends StatelessWidget {
  /// La oferta especial a mostrar
  final SpecialOffer offer;

  /// Constructor del widget de oferta especial
  const HomeSpecialOfferCard({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Usamos Container con sombra envolviendo al GlamContainer con nuevo diseño
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppDesignConstants.borderRadiusXL,
        ), // Bordes más redondeados
        boxShadow: [
          BoxShadow(
            color: AppTheme.kBackgroundColor.withAlpha(179),
            blurRadius: 12,
            spreadRadius: 2,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: GlamContainer(
        fixedSize: const Size(290, 170), // Ligeramente más grande
        borderRadius: BorderRadius.circular(
          AppDesignConstants.borderRadiusXL,
        ), // Bordes consistentes
        borderColor: AppTheme.kPrimaryDarkColor.withAlpha(
          102,
        ), // Borde sutil turquesa
        borderWidth: 1.5, // Borde más visible
        child: Stack(
          children: [
            // Imagen de fondo
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  AppDesignConstants.borderRadiusXL,
                ),
                child: Image.network(
                  offer.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppTheme
                          .kSurfaceAlt, // Nuevo color de superficie alternativa
                      child: Center(
                        child: Icon(
                          Icons.image_not_supported,
                          color: Colors
                              .grey[300], // Tono claro similar a grayLight
                          size: context.iconSizeDefault,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Gradiente moderno con nueva paleta
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    AppDesignConstants.borderRadiusXL,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppTheme.kBlackPure.withAlpha(10),
                      AppTheme.kBlackPure.withAlpha(200),
                    ],
                  ),
                ),
              ),
            ),

            // Indicador de oferta premium en la esquina superior
            // con nuevo estilo
            Positioned(
              top: 0,
              right: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.kAccentColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(
                      AppDesignConstants.borderRadiusMD,
                    ),
                    bottomRight: Radius.circular(
                      AppDesignConstants.borderRadiusMD,
                    ),
                  ),
                ),
                child: Icon(Icons.star, color: AppTheme.kTextColor, size: 16),
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
                      color: AppTheme.kOffWhite,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6), // Más espacio
                  Row(
                    children: [
                      // Precio/descuento con color turquesa
                      Text(
                        offer.discount,
                        style: theme.textTheme.headlineMedium?.copyWith(
                          color: AppTheme.kPrimaryColor, // Color turquesa-menta
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10), // Más espacio
                      if (offer.promoCode != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.kSurfaceAlt, // Nuevo color de fondo
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppTheme.kAccentColor.withAlpha(
                                160,
                              ), // Borde naranja terracota
                              width: 1.5,
                            ),
                          ),
                          child: Text(
                            offer.promoCode!,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: AppTheme.kAccentColor, // Texto naranja
                              // terracota
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
      ),
    );
  }
}
