import 'package:flutter/material.dart';

import '../../../../core/widgets/buttons/enhanced_button.dart';
import '../../../../core/widgets/states/states.dart';

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
    return EmptyStateWidget(
      title: 'No se encontraron barberías',
      message: 'No hay resultados para "$searchQuery"',
      icon: Icons.search_off,
      action: EnhancedButton(
        text: 'Limpiar búsqueda',
        onPressed: onClearSearch,
        height: 48,
      ),
    );
  }
}
