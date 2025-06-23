import 'package:flutter/material.dart' hide SearchBar;
import '../../../core/theme/app_theme_extensions.dart';
import '../avatars/user_avatar.dart';
import '../inputs/search_bar.dart' as custom;
import '../icons/styled_icon.dart';
import '../../../core/constants/montevideo_barrios.dart';

/// Barra de navegación superior personalizable y reutilizable
/// 
/// Diseño de dos filas con avatar de usuario, información, iconos de acción en la fila superior
/// y barra de búsqueda con bordes redondeados en la fila inferior.
/// Incluye esquinas redondeadas inferiores y gradiente personalizable.
class AppTopBar extends StatelessWidget {
  /// URL de la imagen del avatar (opcional)
  final String? avatarUrl;

  /// Controlador para el campo de búsqueda
  final TextEditingController? searchController;

  /// Callback para evento de búsqueda
  final Function(String)? onSearch;
  
  /// Callback para cuando se selecciona un barrio específico
  final Function(String)? onNeighborhoodSelected;

  /// Texto de sugerencia para la búsqueda
  final String? searchHint;
  
  /// Si se deben mostrar sugerencias de barrios durante la búsqueda
  final bool showNeighborhoodSuggestions;
  
  /// Indica si el modo de búsqueda está activo
  final bool isSearchActive;

  /// Texto de saludo para mostrar
  final String? greetingText;
  
  /// Texto secundario (fecha o subtítulo)
  final String? secondaryText;
  
  /// Color personalizado para el texto de saludo
  final Color? greetingTextColor;
  
  /// Color personalizado para el texto secundario
  final Color? secondaryTextColor;

  /// Si se debe mostrar un botón de retroceso
  final bool showBackButton;

  /// Callback para el botón de retroceso
  final VoidCallback? onBackPressed;

  /// Si se debe mostrar una barra de búsqueda
  final bool showSearchBar;

  /// Si se debe mostrar el avatar del usuario
  final bool showAvatar;

  /// Callback cuando se presiona el avatar
  final VoidCallback? onAvatarPressed;

  /// Lista de widgets de acción para la derecha de la barra superior
  final List<Widget>? topActions;
  
  /// Lista de widgets de acción para la derecha de la barra inferior
  final List<Widget>? bottomActions;
  
  /// Si se deben mostrar los iconos de acciones predeterminados
  final bool showDefaultIcons;
  
  /// Color primario para el gradiente (opcional)
  final Color? gradientStartColor;
  
  /// Color secundario para el gradiente (opcional)
  final Color? gradientEndColor;

  /// Radio de las esquinas redondeadas
  final double cornerRadius;

  /// Padding interno de la barra
  final EdgeInsets? padding;

  const AppTopBar({
    super.key,
    this.avatarUrl,
    this.searchController,
    this.onSearch,
    this.onNeighborhoodSelected,
    this.searchHint,
    this.showNeighborhoodSuggestions = true,
    this.isSearchActive = false,
    this.greetingText,
    this.secondaryText,
    this.greetingTextColor,
    this.secondaryTextColor,
    this.showBackButton = false,
    this.onBackPressed,
    this.showSearchBar = true,
    this.showAvatar = true,
    this.onAvatarPressed,
    this.topActions,
    this.bottomActions,
    this.gradientStartColor,
    this.gradientEndColor,
    this.cornerRadius = 20.0,
    this.padding,
    this.showDefaultIcons = true,
  });

  @override
  Widget build(BuildContext context) {
    // Colores del gradiente por defecto si no se proporcionan
    final startColor = gradientStartColor ?? context.accentDarkColor;
    final endColor = gradientEndColor ?? context.accentColor;
    
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            startColor,
            endColor,
          ],
        ),
        boxShadow: context.elevatedShadow,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(cornerRadius),
        ),
      ),
      child: Stack(
        children: [
          // Icono grande de tijera de fondo con rotación
          Positioned(
            left: -20,
            top: 5,
            child: Transform.rotate(
              angle: -45 * 3.14159 / 180, // -45 grados en radianes (rotación hacia la izquierda)
              child: Opacity(
                opacity: 0.15,
                child: Icon(
                  Icons.content_cut,
                  size: 160,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // Contenido principal
          SafeArea(
            bottom: false,
            child: Padding(
              padding: padding ?? const EdgeInsets.fromLTRB(16, 16, 16, 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Fila superior: avatar, saludo, acciones
                  Row(
                    children: [
                      // Avatar o botón de retroceso
                      if (showBackButton) ...[
                        StyledIcon(
                          icon: Icons.arrow_back_ios_rounded,
                          iconColor: context.surfaceColor,
                          backgroundColor: context.surfaceColor.withAlpha((0.2 * 255).round()),
                          onTap: onBackPressed ?? () => Navigator.of(context).pop(),
                        ),
                        const SizedBox(width: 8),
                      ] 
                      else if (showAvatar) ...[
                        GestureDetector(
                          onTap: onAvatarPressed,
                          child: UserAvatar(
                            imageUrl: avatarUrl,
                            radius: 20,
                            showBorder: true,
                            borderColor: context.surfaceColor,
                          ),
                        ),
                        const SizedBox(width: 12),
                      ],
                      
                      // Textos de saludo y secundario
                      if (greetingText != null) ...[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                greetingText!,
                                style: context.h4.copyWith(
                                  color: greetingTextColor ?? context.surfaceColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              if (secondaryText != null)
                                Text(
                                  secondaryText!,
                                  style: context.bodySmall.copyWith(
                                    color: secondaryTextColor ?? context.surfaceColor.withAlpha((0.9 * 255).round()),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                            ],
                          ),
                        ),
                      ],
                      
                      // Acciones de la fila superior (derecha)
                      if (topActions != null && topActions!.isNotEmpty) ...[
                        ...topActions!,
                      ] else if (showDefaultIcons) ...[
                        // Icono de favoritos
                        StyledIcon(
                          icon: Icons.favorite_border_rounded,
                          iconColor: context.surfaceColor,
                          backgroundColor: context.surfaceColor.withAlpha((0.2 * 255).round()),
                        ),
                        const SizedBox(width: 12),
                        // Icono de notificaciones con badge
                        StyledIcon(
                          icon: Icons.notifications_none_rounded,
                          iconColor: context.surfaceColor,
                          backgroundColor: context.surfaceColor.withAlpha((0.2 * 255).round()),
                          showBadge: true,
                        ),
                      ],
                    ],
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Fila inferior: barra de búsqueda y acciones
                  if (showSearchBar)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Barra de búsqueda con esquinas totalmente redondeadas
                        Expanded(
                          child: custom.SearchBar(
                            controller: searchController,
                            onSubmitted: onSearch,
                            onChanged: onSearch,
                            onNeighborhoodSelected: onNeighborhoodSelected ?? onSearch,
                            hintText: searchHint ?? 'Buscar por barbería o barrio',
                            showNeighborhoodSuggestions: showNeighborhoodSuggestions,
                            compact: true,
                            hasBorder: true,
                            borderRadius: BorderRadius.circular(30), // Bordes completamente redondeados
                            backgroundColor: context.surfaceColor,
                          ),
                        ),
                        // Acciones de la fila inferior (derecha)
                        if (bottomActions != null && bottomActions!.isNotEmpty) ...[  
                          const SizedBox(width: 8),
                          ...bottomActions!,
                        ],
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