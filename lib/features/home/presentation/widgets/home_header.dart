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
  });

  @override
  Widget build(BuildContext context) {
    // Obtener el color de fondo según el estilo seleccionado
    final headerBackgroundColor = _getBackgroundColor(context, style);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Barra superior personalizada con gradiente y esquinas redondeadas, formato de dos filas
        AppTopBar(
          showAvatar: true,
          avatarUrl: avatarUrl,
          showSearchBar: true,
          searchController: searchController,
          onSearch: onSearch,
          searchHint: 'Buscar barberías por nombre o ubicación...',
          // Texto de saludo y fecha
          greetingText: 'Good Morning Jobby',
          secondaryText: 'Tuesday, March 18, 2025',
          // Colores de texto personalizados para contraste con fondo dorado
          greetingTextColor: context.deepBlue,
          secondaryTextColor: context.midnightBlue.withAlpha((0.8 * 255).round()),
          // Colores para el gradiente (tonalidades de gris)
          gradientStartColor: backgroundColor ?? headerBackgroundColor,
          gradientEndColor: context.charcoal,
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 20.0),
          // Acciones para la fila superior (solo notificaciones, favoritos va en navbar inferior)
          topActions: [
            // Botón de notificaciones estilizado
            StyledIcon(
              icon: Icons.notifications_outlined,
              iconColor: context.deepBlue,
              backgroundColor: Colors.white.withAlpha((0.3 * 255).round()),
              showBadge: hasNotifications,
              onTap: onNotificationsPressed,
            ),
          ],
          // Acciones para la fila inferior (filtro)
          bottomActions: [
            StyledIcon(
              icon: Icons.tune,
              iconColor: context.deepBlue,
              backgroundColor: Colors.white.withAlpha((0.3 * 255).round()),
              onTap: () {},
            ),
          ],
        ),
        
        // Se eliminó la sección de título personalizado
      ],
    );
  }
  
  /// Obtiene el color de fondo basado en el estilo seleccionado
  Color _getBackgroundColor(BuildContext context, HomeHeaderStyle style) {
    switch (style) {
      case HomeHeaderStyle.light:
        return context.cream;
      case HomeHeaderStyle.skyBlue:
        return context.skyBlue;
      case HomeHeaderStyle.accent:
        return context.accentLightColor;
      case HomeHeaderStyle.primary:
        return context.primaryLightColor;
      case HomeHeaderStyle.infoLight:
        return context.infoLightColor;
      case HomeHeaderStyle.coffee:
        return context.coffeeLight;
      case HomeHeaderStyle.gray:
        return context.metalGray;
    }
  }
}
