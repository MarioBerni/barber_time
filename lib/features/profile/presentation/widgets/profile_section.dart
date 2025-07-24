import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme_extensions.dart';

/// Contenedor para secciones en la página de perfil
///
/// Proporciona un diseño consistente para todas las secciones
/// de información mostradas en la página de perfil
class ProfileSection extends StatelessWidget {
  /// Título de la sección
  final String title;
  
  /// Icono opcional para la sección
  final IconData? icon;
  
  /// Color del icono (usa el color de acento si es nulo)
  final Color? iconColor;
  
  /// Acción opcional para la sección (ej: editar)
  final Widget? action;
  
  /// Si se debe mostrar un borde inferior
  final bool showBottomBorder;

  /// Contenido de la sección
  final Widget child;
  
  /// Padding para el contenido
  final EdgeInsets contentPadding;
  
  /// Si la sección es expandible
  final bool isExpandable;
  
  /// Si está expandida inicialmente (solo aplica si es expandible)
  final bool initiallyExpanded;
  
  /// Constructor
  const ProfileSection({
    Key? key,
    required this.title,
    required this.child,
    this.icon,
    this.iconColor,
    this.action,
    this.showBottomBorder = true,
    this.contentPadding = const EdgeInsets.all(16.0),
    this.isExpandable = false,
    this.initiallyExpanded = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headerRow = Row(
      children: [
        // Icono si está disponible
        if (icon != null) ...[
          Icon(
            icon,
            color: iconColor ?? context.accentColor,
            size: 20,
          ),
          const SizedBox(width: 8),
        ],
        
        // Título de la sección
        Text(
          title,
          style: context.titleMedium.copyWith(fontWeight: FontWeight.bold),
        ),
        
        const Spacer(),
        
        // Widget de acción si está disponible
        if (action != null) action!,
      ],
    );

    final content = Container(
      padding: contentPadding,
      width: double.infinity,
      child: child,
    );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Usamos un ExpansionTile si la sección es expandible
          if (isExpandable)
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                title: headerRow,
                initiallyExpanded: initiallyExpanded,
                tilePadding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
                childrenPadding: EdgeInsets.zero,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                iconColor: context.accentColor,
                children: [
                  content,
                ],
              ),
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                  child: headerRow,
                ),
                if (showBottomBorder)
                  Divider(
                    color: context.dividerColor,
                    thickness: 1,
                    height: 1,
                  ),
                content,
              ],
            ),
        ],
      ),
    );
  }
}
