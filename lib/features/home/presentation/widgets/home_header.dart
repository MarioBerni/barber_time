import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/icons/styled_icon.dart';
import '../../../../core/widgets/navigation/app_top_bar.dart';
import '../../../../core/widgets/spacers/spacers.dart';
import '../../domain/entities/salon.dart';
import 'search_suggestions.dart';

/// Enumeración para los diferentes estilos de fondo del encabezado
enum HomeHeaderStyle {
  /// Fondo claro (crema)
  light,

  /// Fondo azul cielo
  skyBlue,

  /// Fondo con color de acento (dorado claro)
  accent,

  /// Fondo con color primario (azul claro)
  primary,

  /// Fondo con color informativo claro (azul muy claro)
  infoLight,

  /// Fondo con color café/marrón
  coffee,

  /// Fondo con color gris metálico
  gray,
}

/// Widget para mostrar el encabezado de la página de inicio.
///
/// Incluye saludo personalizado, subtítulo, avatar de usuario,
/// barra de búsqueda y notificaciones.
///
/// Versión refactorizada para usar componentes modulares reutilizables.
class HomeHeader extends StatelessWidget {
  /// Nombre del usuario para mostrar en el saludo.
  final String userName;

  /// URL de la imagen de avatar del usuario
  final String? avatarUrl;

  /// Indica si hay notificaciones sin leer.
  final bool hasNotifications;

  /// Controlador para el campo de búsqueda
  final TextEditingController? searchController;

  /// Callback para cuando se realiza una búsqueda.
  final ValueChanged<String>? onSearch;

  /// Callback para cuando se selecciona un barrio.
  final ValueChanged<String>? onNeighborhoodSelected;

  /// Indica si el modo de búsqueda está activo.
  final bool isSearchActive;

  /// Callback para cuando se presiona el botón de búsqueda.
  final VoidCallback? onSearchPressed;

  /// Callback para cuando se presiona el botón de notificaciones.
  final VoidCallback? onNotificationsPressed;

  /// Callback para cuando se presiona el avatar de usuario.
  final VoidCallback? onUserAvatarPressed;

  /// Padding exterior del encabezado.
  final EdgeInsetsGeometry padding;

  /// Color de fondo del encabezado.
  final Color? backgroundColor;

  /// Estilo del encabezado
  final HomeHeaderStyle style;

  /// Determina si se debe mostrar la barra de búsqueda
  final bool showSearchBar;

  /// Acciones personalizadas para la fila superior del encabezado
  final List<Widget>? customTopActions;

  /// Acciones personalizadas para la fila inferior del encabezado
  final List<Widget>? customBottomActions;

  /// Sugerencias de búsqueda a mostrar
  final List<String> searchSuggestions;

  /// Indica si se deben mostrar las sugerencias
  final bool showSuggestions;

  /// Callback cuando se selecciona una sugerencia
  final ValueChanged<String>? onSuggestionSelected;

  /// Callback para limpiar historial
  final VoidCallback? onClearHistory;

  /// Lista de salones para generar chips de barberías
  final List<Salon> salones;

  /// Callback cuando se selecciona una barbería desde chips
  final ValueChanged<String>? onBarberiaSelected;

  /// Constructor del encabezado de la página de inicio.
  const HomeHeader({
    super.key,
    required this.userName,
    this.avatarUrl,
    this.hasNotifications = false,
    this.searchController,
    this.onSearch,
    this.onNeighborhoodSelected,
    this.isSearchActive = false,
    this.onSearchPressed,
    this.onNotificationsPressed,
    this.onUserAvatarPressed,
    this.padding = const EdgeInsets.fromLTRB(16, 24, 16, 16),
    this.backgroundColor,
    this.style = HomeHeaderStyle.light,
    this.showSearchBar = true,
    this.customTopActions,
    this.customBottomActions,
    this.searchSuggestions = const [],
    this.showSuggestions = false,
    this.onSuggestionSelected,
    this.onClearHistory,
    this.salones = const [],
    this.onBarberiaSelected,
  });

  @override
  Widget build(BuildContext context) {
    // Obtener fecha actual para mostrar
    final now = DateTime.now();
    final formattedDate =
        '${_getDayName(now.weekday)}, ${_getMonthName(now.month)} '
        '${now.day}, ${now.year}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header moderno con gradiente de la nueva paleta
        AppTopBar(
          avatarUrl: avatarUrl,
          showSearchBar: showSearchBar,
          searchController: searchController,
          onSearch: onSearch,
          onNeighborhoodSelected: onNeighborhoodSelected,
          salones: salones,
          onBarberiaSelected: onBarberiaSelected,
          searchHint: 'Buscar barberías por nombre o ubicación...',
          // Saludo con tipografía moderna
          greetingText: '¡Hola, $userName!',
          secondaryText: formattedDate,
          // Colores de texto con mayor contraste para mejor legibilidad
          greetingTextColor: AppTheme.kOffWhite,
          secondaryTextColor: AppTheme.kPrimaryLightColor,
          // Turquesa-menta claro para fecha
          // Fondo moderno con gradiente negro azulado
          gradientStartColor: AppTheme.kBackgroundColor,
          gradientEndColor: AppTheme.kSurfaceColor,
          padding: AppSpacers.fromLTRB(20.0, 24.0, 20.0, 20.0) as EdgeInsets,
          // Acciones para la fila superior con nuevo estilo
          topActions:
              customTopActions ??
              [
                // Botón de notificaciones con estilo refinado
                StyledIcon(
                  icon: Icons.notifications_outlined,
                  iconColor: hasNotifications
                      ? AppTheme.kAccentColor
                      : AppTheme.kOffWhite,
                  // Naranja terracota si hay notificaciones
                  backgroundColor: AppTheme.kSurfaceAlt,
                  showBadge: hasNotifications,
                  badgeColor: AppTheme.kAccentColor,
                  // Badge naranja para mayor distinción
                  onTap: onNotificationsPressed,
                ),
              ],
          // Acciones para la fila inferior con estilo cohesivo
          bottomActions:
              customBottomActions ??
              (showSearchBar
                  ? [
                      StyledIcon(
                        icon: Icons.tune,
                        iconColor: AppTheme.kPrimaryColor,
                        // Turquesa-menta para indicar interactividad
                        backgroundColor: AppTheme.kSurfaceAlt,
                        onTap: () {},
                      ),
                    ]
                  : []),
        ),

        // Sugerencias de búsqueda
        if (showSuggestions && searchSuggestions.isNotEmpty)
          Padding(
            padding: AppSpacers.only(top: 8.0) as EdgeInsets,
            child: SearchSuggestions(
              suggestions: searchSuggestions,
              onSuggestionSelected: onSuggestionSelected,
              onClearHistory: onClearHistory,
              isHistory:
                  searchSuggestions.length <= 5 && searchSuggestions.isNotEmpty,
            ),
          ),

        // Línea decorativa moderna con gradiente turquesa-menta
        if (!isSearchActive && !showSuggestions)
          Container(
            margin: AppSpacers.symmetric(horizontal: 20.0) as EdgeInsets,
            height: 2.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppTheme.kPrimaryColor.withAlpha(0),
                  AppTheme.kPrimaryColor.withAlpha(150),
                  AppTheme.kPrimaryColor.withAlpha(0),
                ],
              ),
            ),
          ),
      ],
    );
  }

  // Helper para obtener el nombre del día
  String _getDayName(int weekday) {
    const days = [
      'Lunes',
      'Martes',
      'Miércoles',
      'Jueves',
      'Viernes',
      'Sábado',
      'Domingo',
    ];
    return days[weekday - 1];
  }

  // Helper para obtener el nombre del mes
  String _getMonthName(int month) {
    const months = [
      'Enero',
      'Febrero',
      'Marzo',
      'Abril',
      'Mayo',
      'Junio',
      'Julio',
      'Agosto',
      'Septiembre',
      'Octubre',
      'Noviembre',
      'Diciembre',
    ];
    return months[month - 1];
  }

  // Método _getBackgroundColor eliminado por no ser utilizado
}
