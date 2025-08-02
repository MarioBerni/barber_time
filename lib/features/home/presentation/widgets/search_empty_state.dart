import 'package:flutter/material.dart';

import '../../../../core/theme/app_design_constants.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/buttons/enhanced_button.dart';
import '../../../../core/widgets/containers/containers.dart';
import '../../../../core/widgets/spacers/spacers.dart';

/// Widget que muestra un estado vacío cuando no hay resultados de búsqueda
class SearchEmptyState extends StatelessWidget {
  /// Texto de la consulta de búsqueda
  final String searchQuery;

  /// Acción al presionar el botón de limpiar búsqueda
  final VoidCallback onClearSearch;

  /// Constructor
  const SearchEmptyState({
    super.key,
    required this.searchQuery,
    required this.onClearSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacers.all(24.0) as EdgeInsets,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Contenedor principal con diseño moderno
          AppContainers.glass(
            child: Padding(
              padding: AppSpacers.all(32.0) as EdgeInsets,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icono de búsqueda con diseño mejorado
                  Container(
                    padding: AppSpacers.all(20.0) as EdgeInsets,
                    decoration: BoxDecoration(
                      color: AppTheme.kPrimaryColor.withAlpha(20),
                      borderRadius: BorderRadius.circular(
                        AppDesignConstants.borderRadiusLG,
                      ),
                      border: Border.all(
                        color: AppTheme.kPrimaryColor.withAlpha(40),
                      ),
                    ),
                    child: Icon(
                      Icons.search_off_rounded,
                      size: 48,
                      color: AppTheme.kPrimaryColor,
                    ),
                  ),

                  AppSpacers.lg,

                  // Título principal
                  Text(
                    'No se encontraron barberías',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.kTextColor,
                      letterSpacing: -0.3,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  AppSpacers.sm,

                  // Mensaje descriptivo
                  Text(
                    'No hay resultados para "$searchQuery"',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppTheme.kMediumGray,
                      fontSize: 16,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  AppSpacers.lg,

                  // Sugerencias de búsqueda
                  Container(
                    padding: AppSpacers.all(16.0) as EdgeInsets,
                    decoration: BoxDecoration(
                      color: AppTheme.kSurfaceAlt,
                      borderRadius: BorderRadius.circular(
                        AppDesignConstants.borderRadiusMD,
                      ),
                      border: Border.all(color: AppTheme.kSurfaceColor),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.lightbulb_outline,
                              color: AppTheme.kAccentColor,
                              size: 20,
                            ),
                            AppSpacers.hXxs,
                            Text(
                              'Sugerencias:',
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.kTextColor,
                                    fontSize: 14,
                                  ),
                            ),
                          ],
                        ),
                        AppSpacers.sm,
                        Text(
                          '• Verifica la ortografía\n'
                          '• Intenta términos más generales\n'
                          '• Busca por ubicación',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: AppTheme.kMediumGray,
                                fontSize: 13,
                                height: 1.5,
                              ),
                        ),
                      ],
                    ),
                  ),

                  AppSpacers.lg,

                  // Botón de acción
                  EnhancedButton(
                    text: 'Limpiar búsqueda',
                    onPressed: onClearSearch,
                    height: 48,
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
