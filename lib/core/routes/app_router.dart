import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/bloc/auth_cubit.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
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
    initialLocation: AppRoutes.login,
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
      
      // Rutas de autenticación
      GoRoute(
        path: AppRoutes.login,
        pageBuilder: (context, state) => RouteTransitions.slideTransition(
          context: context,
          state: state,
          child: BlocProvider(
            create: (_) => sl<AuthCubit>(),
            child: const LoginPage(),
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.register,
        pageBuilder: (context, state) => RouteTransitions.slideTransition(
          context: context,
          state: state,
          child: BlocProvider(
            create: (_) => sl<AuthCubit>(),
            child: const RegisterPage(),
          ),
        ),
      ),
      
      // Rutas principales de la aplicación
      GoRoute(
        path: AppRoutes.home,
        pageBuilder: (context, state) => RouteTransitions.fadeTransition(
          context: context,
          state: state,
          child: _PlaceholderPage(title: 'Home'),
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
    // Esto se implementará completamente cuando tengamos el módulo de autenticación
    redirect: (context, state) {
      // Aquí irá la lógica de redirección cuando implementemos autenticación
      // Por ahora, no hay redirecciones
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
