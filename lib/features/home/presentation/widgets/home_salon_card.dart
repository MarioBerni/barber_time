import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_design_constants.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/containers/containers.dart';
import '../../../../core/widgets/spacers/spacers.dart';
import '../../../../core/widgets/states/states.dart';
import '../../domain/entities/salon.dart';

/// Widget para mostrar una tarjeta de salón en la página de inicio
class HomeSalonCard extends StatelessWidget {
  /// Constructor
  const HomeSalonCard({
    super.key,
    required this.salon,
    required this.onFavoritePressed,
  });

  /// Datos del salón a mostrar
  final Salon salon;

  /// Callback cuando se presiona el botón de favorito
  final VoidCallback onFavoritePressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppContainers.card(
      margin: AppSpacers.symmetric(vertical: 6) as EdgeInsets,
      child: Row(
        children: [
          // Imagen del salón con diseño optimizado
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppDesignConstants.borderRadiusMD),
              bottomLeft: Radius.circular(AppDesignConstants.borderRadiusMD),
            ),
            child: CachedNetworkImage(
              imageUrl: salon.imageUrl,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                width: 120,
                height: 120,
                color: AppTheme.kSurfaceAlt,
                child: const Center(
                  child: LoadingIndicatorWidget(
                    size: LoadingIndicatorSize.small,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                width: 120,
                height: 120,
                color: AppTheme.kSurfaceAlt,
                child: Icon(
                  Icons.image_not_supported,
                  color: AppTheme.kMediumGray,
                  size: 32,
                ),
              ),
            ),
          ),

          // Información del salón con diseño optimizado
          Expanded(
            child: Padding(
              padding: AppSpacers.all(16.0) as EdgeInsets,
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
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: AppTheme.kTextColor,
                            letterSpacing: -0.3,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // Botón de favorito optimizado
                      GestureDetector(
                        onTap: onFavoritePressed,
                        child: Container(
                          padding: AppSpacers.all(8.0) as EdgeInsets,
                          decoration: BoxDecoration(
                            color: salon.isFavorite
                                ? AppTheme.kAccentColor.withAlpha(30)
                                : AppTheme.kSurfaceAlt,
                            borderRadius: BorderRadius.circular(
                              AppDesignConstants.borderRadiusSM2,
                            ),
                          ),
                          child: Icon(
                            salon.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: salon.isFavorite
                                ? AppTheme.kAccentColor
                                : AppTheme.kMediumGray,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),

                  AppSpacers.sm,

                  // Dirección con icono
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: AppTheme.kMediumGray,
                        size: 16,
                      ),
                      AppSpacers.hXxs,
                      Expanded(
                        child: Text(
                          salon.address,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: AppTheme.kMediumGray,
                            fontSize: 13,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  AppSpacers.md,

                  // Calificación, reseñas y precio optimizados
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Calificación y número de reseñas
                      Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: AppTheme.kAccentColor,
                            size: 18,
                          ),
                          AppSpacers.hXxs,
                          Text(
                            '${salon.rating}',
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppTheme.kTextColor,
                              fontSize: 14,
                            ),
                          ),
                          AppSpacers.hXxs,
                          Text(
                            '(${salon.reviewCount})',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: AppTheme.kMediumGray,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),

                      // Precio con diseño mejorado
                      Container(
                        padding:
                            AppSpacers.symmetric(horizontal: 10, vertical: 4)
                                as EdgeInsets,
                        decoration: BoxDecoration(
                          color: AppTheme.kPrimaryColor.withAlpha(30),
                          borderRadius: BorderRadius.circular(
                            AppDesignConstants.borderRadiusSM2,
                          ),
                          border: Border.all(
                            color: AppTheme.kPrimaryColor.withAlpha(50),
                          ),
                        ),
                        child: Text(
                          salon.price,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: AppTheme.kPrimaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
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
