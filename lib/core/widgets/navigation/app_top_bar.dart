import 'package:flutter/material.dart';

import '../../../features/home/domain/entities/salon.dart';
import '../../theme/app_design_constants.dart';
import '../../theme/app_theme_extensions.dart';
import '../avatars/user_avatar.dart';
import '../icons/styled_icon.dart';
import '../inputs/search_bar.dart' as custom;
import '../spacers/app_spacers.dart';

/// Barra de navegación superior personalizable y reutilizable.
///
/// Diseño de dos filas con avatar, información y acciones en la fila superior,
/// y una barra de búsqueda en la inferior. Incluye esquinas redondeadas y
/// gradiente personalizable.
class AppTopBar extends StatelessWidget {
  /// URL de la imagen del avatar (opcional).
  final String? avatarUrl;

  /// Controlador para el campo de búsqueda.
  final TextEditingController? searchController;

  /// Callback para evento de búsqueda.
  final ValueChanged<String>? onSearch;

  /// Callback cuando cambia el texto de búsqueda en tiempo real.
  final ValueChanged<String>? onSearchChanged;

  /// Callback para cuando se selecciona un barrio específico.
  final ValueChanged<String>? onNeighborhoodSelected;

  /// Lista de salones para generar chips de barberías
  final List<Salon> salones;

  /// Callback cuando se selecciona una barbería desde chips
  final ValueChanged<String>? onBarberiaSelected;

  /// Texto de sugerencia para la búsqueda.
  final String? searchHint;

  /// Si se deben mostrar sugerencias de barrios durante la búsqueda.
  final bool showNeighborhoodSuggestions;

  /// Indica si el modo de búsqueda está activo.
  final bool isSearchActive;

  /// Texto de saludo para mostrar.
  final String? greetingText;

  /// Texto secundario (fecha o subtítulo).
  final String? secondaryText;

  /// Color personalizado para el texto de saludo.
  final Color? greetingTextColor;

  /// Color personalizado para el texto secundario.
  final Color? secondaryTextColor;

  /// Si se debe mostrar un botón de retroceso.
  final bool showBackButton;

  /// Callback para el botón de retroceso.
  final VoidCallback? onBackPressed;

  /// Si se debe mostrar una barra de búsqueda.
  final bool showSearchBar;

  /// Si se debe mostrar el avatar del usuario.
  final bool showAvatar;

  /// Callback cuando se presiona el avatar.
  final VoidCallback? onAvatarPressed;

  /// Lista de widgets de acción para la derecha de la barra superior.
  final List<Widget>? topActions;

  /// Lista de widgets de acción para la derecha de la barra inferior.
  final List<Widget>? bottomActions;

  /// Si se deben mostrar los iconos de acciones predeterminados.
  final bool showDefaultIcons;

  /// Color primario para el gradiente (opcional).
  final Color? gradientStartColor;

  /// Color secundario para el gradiente (opcional).
  final Color? gradientEndColor;

  /// Radio de las esquinas redondeadas.
  final double cornerRadius;

  /// Padding interno de la barra.
  final EdgeInsets? padding;

  /// Constructor de la barra de navegación superior.
  const AppTopBar({
    super.key,
    this.avatarUrl,
    this.searchController,
    this.onSearch,
    this.onSearchChanged,
    this.onNeighborhoodSelected,
    this.salones = const [],
    this.onBarberiaSelected,
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
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [startColor, endColor],
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
              angle:
                  -45 *
                  3.14159 /
                  180, // -45 grados en radianes (rotación hacia la izquierda)
              child: Opacity(
                opacity: 0.15,
                child: Icon(Icons.content_cut, size: 160, color: Colors.white),
              ),
            ),
          ),
          // Contenido principal
          SafeArea(
            bottom: false,
            child: Padding(
              padding: padding ?? const EdgeInsets.fromLTRB(20, 24, 20, 20),
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
                          backgroundColor: context.surfaceColor.withAlpha(
                            (0.2 * 255).round(),
                          ),
                          onTap:
                              onBackPressed ??
                              () => Navigator.of(context).pop(),
                        ),
                        AppSpacers.hXs,
                      ] else if (showAvatar) ...[
                        GestureDetector(
                          onTap: onAvatarPressed,
                          child: UserAvatar(
                            imageUrl: avatarUrl,
                            showBorder: true,
                            borderColor: context.surfaceColor,
                          ),
                        ),
                        AppSpacers.hSm,
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
                                  color:
                                      greetingTextColor ?? context.surfaceColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              if (secondaryText != null)
                                Text(
                                  secondaryText!,
                                  style: context.bodySmall.copyWith(
                                    color:
                                        secondaryTextColor ??
                                        context.surfaceColor.withAlpha(
                                          (0.9 * 255).round(),
                                        ),
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
                          backgroundColor: context.surfaceColor.withAlpha(
                            (0.2 * 255).round(),
                          ),
                        ),
                        AppSpacers.hSm,
                        // Icono de notificaciones con badge
                        StyledIcon(
                          icon: Icons.notifications_none_rounded,
                          iconColor: context.surfaceColor,
                          backgroundColor: context.surfaceColor.withAlpha(
                            (0.2 * 255).round(),
                          ),
                          showBadge: true,
                        ),
                      ],
                    ],
                  ),

                  AppSpacers.md,

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
                            onChanged: onSearchChanged,
                            onNeighborhoodSelected:
                                onNeighborhoodSelected ?? onSearch,
                            salones: salones,
                            onBarberiaSelected: onBarberiaSelected ?? onSearch,
                            hintText:
                                searchHint ?? 'Buscar por barbería o barrio',
                            showNeighborhoodSuggestions:
                                showNeighborhoodSuggestions,
                            compact: true,
                            borderRadius: BorderRadius.circular(
                              AppDesignConstants.borderRadiusCircular,
                            ), // Bordes completamente redondeados
                            backgroundColor: context.surfaceColor,
                          ),
                        ),
                        // Acciones de la fila inferior (derecha)
                        if (bottomActions != null &&
                            bottomActions!.isNotEmpty) ...[
                          AppSpacers.hXs,
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
