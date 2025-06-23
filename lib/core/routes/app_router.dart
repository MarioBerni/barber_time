import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/bloc/home_cubit.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../di/service_locator.dart';
import 'app_routes.dart';
import 'route_transitions.dart';
import '../theme/app_theme.dart';

/// Configuración principal del router de la aplicación
///
/// Utiliza go_router para gestionar las rutas y transiciones
/// Centraliza toda la configuración de navegación
class AppRouter {
  /// Obtiene la configuración del router
  static GoRouter get router => _router;

  /// Router principal de la aplicación
  static final GoRouter _router = GoRouter(
    initialLocation: AppRoutes.home,
    debugLogDiagnostics: true,
    routes: [
      // Ruta inicial - Splash Screen
      GoRoute(
        path: AppRoutes.splash,
        pageBuilder: (context, state) => RouteTransitions.fadeTransition(
          context: context,
          state: state,
          child: _PlaceholderPage(title: 'Splash Screen'),
        ),
      ),
      
      // Rutas de autenticación (temporalmente eliminadas)
      
      // Rutas principales de la aplicación
      GoRoute(
        path: AppRoutes.home,
        pageBuilder: (context, state) => RouteTransitions.fadeTransition(
          context: context,
          state: state,
          child: BlocProvider(
            create: (_) => sl<HomeCubit>(),
            child: const HomePage(),
          ),
        ),
      ),
      
      // Rutas de perfil
      GoRoute(
        path: AppRoutes.profile,
        pageBuilder: (context, state) => RouteTransitions.slideTransition(
          context: context,
          state: state,
          child: _PlaceholderPage(title: 'Profile'),
        ),
      ),
    ],
    
    // Manejo de rutas no encontradas
    errorPageBuilder: (context, state) => RouteTransitions.fadeTransition(
      context: context,
      state: state,
      child: Scaffold(
        appBar: AppBar(title: const Text('Página no encontrada')),
        body: const Center(
          child: Text('La ruta solicitada no existe'),
        ),
      ),
    ),
    
    // Redirecciones, por ejemplo para verificar autenticación
    redirect: (context, state) {
      // Permitimos el acceso a la página de inicio sin autenticación
      // Las rutas protegidas requerirán autenticación más adelante
      
      // Rutas públicas permitidas sin autenticación
      final publicRoutes = [
        AppRoutes.home, 
        AppRoutes.splash
      ];
      
      // Si la ruta es pública, permitir acceso sin restricciones
      if (publicRoutes.contains(state.matchedLocation)) {
        return null;
      }
      
      // Otras rutas requerirán autenticación en el futuro
      // Por ahora, permitimos acceso a todas las rutas
      return null;
    },
  );
}

/// Widget temporal para mostrar páginas en construcción
/// 
/// Esta clase se utiliza como placeholder hasta que se implementen las pantallas reales
class _PlaceholderPage extends StatelessWidget {
  final String title;
  
  const _PlaceholderPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.construction,
              size: 80,
              color: AppTheme.kAccentColor,
            ),
            const SizedBox(height: 16),
            Text(
              'Página en desarrollo',
              style: TextStyle(
                fontSize: 22, 
                fontWeight: FontWeight.bold,
                color: AppTheme.kTextColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color: AppTheme.kSecondaryTextColor,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Esta página será implementada pronto',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.kSecondaryTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
