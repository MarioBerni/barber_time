import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/widgets/navigation/app_top_bar.dart';
import '../../../../core/widgets/icons/styled_icon.dart';

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
  final Function(String)? onSearch;
  
  /// Callback para cuando se selecciona un barrio.
  final Function(String)? onNeighborhoodSelected;
  
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
    this.padding = const EdgeInsets.fromLTRB(16.0, 50.0, 16.0, 16.0),
    this.backgroundColor,
    this.style = HomeHeaderStyle.light,
    this.showSearchBar = true,
    this.customTopActions,
    this.customBottomActions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header completamente dark con estilo premium de barbería
        AppTopBar(
          showAvatar: true,
          avatarUrl: avatarUrl,
          showSearchBar: showSearchBar,
          searchController: searchController,
          onSearch: onSearch,
          searchHint: 'Buscar barberías por nombre o ubicación...',
          // Texto de saludo y fecha - DARK THEME
          greetingText: userName,
          secondaryText: 'Tuesday, March 18, 2025',  // TODO: Usar fecha real
          // Colores de texto optimizados para dark theme
          greetingTextColor: context.textColor, // Blanco
          secondaryTextColor: context.secondaryTextColor, // Gris claro
          // Fondo con nueva escala de grises refinada
          gradientStartColor: context.blackDeep, // Negro profundo de la nueva escala
          gradientEndColor: context.charcoalDark, // Carbón oscuro para sutil profundidad
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 20.0),
          // Acciones para la fila superior con nueva paleta premium
          topActions: customTopActions ?? [
            // Botón de notificaciones con estilo azul elegante
            StyledIcon(
              icon: Icons.notifications_outlined,
              iconColor: hasNotifications ? context.bluePrimary : context.textColor, // Azul si hay notificaciones, blanco si no
              backgroundColor: context.charcoalMedium, // Carbón medio para mejor definición
              showBadge: hasNotifications,
              onTap: onNotificationsPressed,
            ),
          ],
          // Acciones para la fila inferior con estilo azul elegante
          bottomActions: customBottomActions ?? (showSearchBar ? [
            StyledIcon(
              icon: Icons.tune,
              iconColor: context.bluePrimary, // Iconos azules elegantes
              backgroundColor: context.charcoalMedium, // Carbón medio para consistencia
              onTap: () {},
            ),
          ] : []),
        ),
      ],
    );
  }
  
  // Método _getBackgroundColor eliminado por no ser utilizado
}
