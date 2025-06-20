import 'package:flutter/material.dart';
import '../../domain/entities/service_category.dart';

/// Widget que muestra un ítem de categoría de servicio
class HomeServiceCategoryItem extends StatelessWidget {
  /// La categoría de servicio a mostrar
  final ServiceCategory category;
  
  /// Constructor del widget de categoría de servicio
  const HomeServiceCategoryItem({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = 70.0;
    
    // Color para el ítem, usa el color de la categoría o el primario del tema
    final itemColor = category.colorHex != null
        ? Color(int.parse('0xFF${category.colorHex!.replaceAll('#', '')}'))
        : theme.colorScheme.primary;
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Círculo con icono
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: itemColor.withOpacity(0.1),
          ),
          child: Center(
            child: category.iconUrl != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(size / 2),
                    child: Image.network(
                      category.iconUrl!,
                      width: size * 0.6,
                      height: size * 0.6,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          _getIconData(category.iconName),
                          color: itemColor,
                          size: size * 0.5,
                        );
                      },
                    ),
                  )
                : Icon(
                    _getIconData(category.iconName),
                    color: itemColor,
                    size: size * 0.5,
                  ),
          ),
        ),
        const SizedBox(height: 8),
        // Nombre de la categoría
        Text(
          category.name,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
  
  /// Convierte el nombre del icono a un IconData de Material
  IconData _getIconData(String iconName) {
    switch (iconName.toLowerCase()) {
      case 'scissors':
        return Icons.content_cut;
      case 'content_cut':
        return Icons.content_cut;
      case 'brush':
        return Icons.brush;
      case 'color_lens':
        return Icons.color_lens;
      case 'face':
        return Icons.face;
      case 'spa':
        return Icons.spa;
      case 'style':
        return Icons.style;
      default:
        return Icons.category;
    }
  }
}
