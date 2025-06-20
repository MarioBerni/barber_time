import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_cubit.dart';

/// Widget para mostrar el encabezado de la página de inicio.
///
/// Incluye saludo personalizado, subtítulo, botón de búsqueda y notificaciones.
class HomeHeader extends StatelessWidget {
  /// Nombre del usuario para mostrar en el saludo.
  final String userName;
  
  /// Indica si hay notificaciones sin leer.
  final bool hasNotifications;
  
  /// Callback para cuando se presiona el botón de búsqueda.
  final VoidCallback? onSearchPressed;
  
  /// Callback para cuando se presiona el botón de notificaciones.
  final VoidCallback? onNotificationsPressed;
  
  /// Padding exterior del encabezado.
  final EdgeInsetsGeometry padding;
  
  /// Color de fondo del encabezado.
  final Color? backgroundColor;

  const HomeHeader({
    super.key,
    required this.userName,
    this.hasNotifications = false,
    this.onSearchPressed,
    this.onNotificationsPressed,
    this.padding = const EdgeInsets.fromLTRB(16.0, 50.0, 16.0, 16.0),
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      padding: padding,
      color: backgroundColor ?? theme.scaffoldBackgroundColor.withOpacity(0.8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hola, ${userName.isEmpty ? "Usuario" : userName}',
                    style: theme.textTheme.headlineSmall,
                  ),
                  Text(
                    'Encuentra tu estilo perfecto',
                    style: theme.textTheme.bodyLarge,
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.search,
                      size: 28,
                    ),
                    onPressed: onSearchPressed ?? 
                        () => context.read<HomeCubit>().toggleSearchMode(),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.notifications_outlined,
                          size: 28,
                        ),
                        onPressed: onNotificationsPressed ?? () {
                          // Navegar a notificaciones
                        },
                      ),
                      if (hasNotifications)
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.error,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
