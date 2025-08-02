import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/spacers/spacers.dart';

/// Widget para mostrar sugerencias de búsqueda
class SearchSuggestions extends StatelessWidget {
  /// Lista de sugerencias a mostrar
  final List<String> suggestions;

  /// Callback cuando se selecciona una sugerencia
  final ValueChanged<String>? onSuggestionSelected;

  /// Callback para limpiar historial
  final VoidCallback? onClearHistory;

  /// Indica si las sugerencias son del historial
  final bool isHistory;

  /// Constructor del widget de sugerencias
  const SearchSuggestions({
    super.key,
    required this.suggestions,
    this.onSuggestionSelected,
    this.onClearHistory,
    this.isHistory = false,
  });

  @override
  Widget build(BuildContext context) {
    if (suggestions.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: AppSpacers.symmetric(horizontal: 20.0) as EdgeInsets,
      decoration: BoxDecoration(
        color: AppTheme.kSurfaceColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppTheme.kBlackPure.withAlpha(50),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header con título y botón de limpiar (solo para historial)
          if (isHistory && suggestions.isNotEmpty)
            Container(
              padding: AppSpacers.all(12.0) as EdgeInsets,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppTheme.kMediumGray.withAlpha(50)),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Búsquedas recientes',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.kTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (onClearHistory != null)
                    GestureDetector(
                      onTap: onClearHistory,
                      child: Text(
                        'Limpiar',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppTheme.kAccentColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                ],
              ),
            ),

          // Lista de sugerencias
          ...suggestions.map(
            (suggestion) => _buildSuggestionItem(context, suggestion),
          ),
        ],
      ),
    );
  }

  /// Construye un item de sugerencia individual
  Widget _buildSuggestionItem(BuildContext context, String suggestion) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onSuggestionSelected?.call(suggestion),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: AppSpacers.all(16.0) as EdgeInsets,
          child: Row(
            children: [
              // Icono según el tipo
              Icon(
                isHistory ? Icons.history : Icons.search,
                size: 20,
                color: AppTheme.kMediumGray,
              ),
              AppSpacers.sm,
              // Texto de la sugerencia
              Expanded(
                child: Text(
                  suggestion,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppTheme.kTextColor,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
