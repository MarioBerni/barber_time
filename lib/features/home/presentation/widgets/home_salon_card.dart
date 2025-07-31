import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_design_constants.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/widgets/containers/glam_container.dart';
import '../../domain/entities/salon.dart';

/// Widget que muestra una tarjeta de salón con información básica
class HomeSalonCard extends StatelessWidget {
  /// El salón a mostrar
  final Salon salon;

  /// Callback cuando se presiona el botón de favorito
  final VoidCallback onFavoritePressed;

  /// Constructor del widget de tarjeta de salón
  const HomeSalonCard({
    super.key,
    required this.salon,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GlamContainer(
      fixedSize: const Size.fromHeight(110),
      borderRadius: BorderRadius.circular(AppDesignConstants.borderRadiusMD),
      child: Row(
        children: [
          // Imagen del salón
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppDesignConstants.borderRadiusMD),
              bottomLeft: Radius.circular(AppDesignConstants.borderRadiusMD),
            ),
            child: CachedNetworkImage(
              imageUrl: salon.imageUrl,
              width: 110,
              height: 110,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                width: 110,
                height: 110,
                color: theme.colorScheme.primary.withAlpha((0.1 * 255).round()),
                child: const Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => Container(
                width: 110,
                height: 110,
                color: theme.colorScheme.primary.withAlpha((0.2 * 255).round()),
                child: Icon(
                  Icons.image_not_supported,
                  size: context.iconSizeDefault,
                ),
              ),
            ),
          ),

          // Información del salón
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nombre del salón y botón de favorito
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          salon.name,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          salon.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: salon.isFavorite
                              ? theme.colorScheme.primary
                              : null,
                        ),
                        onPressed: onFavoritePressed,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),

                  // Dirección
                  Text(
                    salon.address,
                    style: theme.textTheme.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const Spacer(),

                  // Calificación, reseñas y precio
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Calificación y número de reseñas
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: context
                                .accentColor, // Actualizado a naranja terracota
                            size: 18,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${salon.rating}',
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '(${salon.reviewCount})',
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),

                      // Precio
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.secondary.withAlpha(
                            (0.1 * 255).round(),
                          ),
                          borderRadius: BorderRadius.circular(
                            AppDesignConstants.borderRadiusXS,
                          ),
                        ),
                        child: Text(
                          salon.price,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme
                                .colorScheme
                                .secondary, // Naranja terracota
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
