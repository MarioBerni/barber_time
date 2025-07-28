import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

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
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          children: [
            Icon(Icons.search_off, size: 50, color: AppTheme.kMediumGray),
            const SizedBox(height: 16),
            Text(
              'No se encontraron barberías con "$searchQuery"',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppTheme.kLightGray,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: onClearSearch,
              style: TextButton.styleFrom(
                foregroundColor: AppTheme.kPrimaryColor,
                backgroundColor: AppTheme.kSurfaceAlt.withAlpha(77),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              ),
              child: const Text('Limpiar búsqueda'),
            ),
          ],
        ),
      ),
    );
  }
}
