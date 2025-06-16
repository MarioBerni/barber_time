import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/service_locator.dart';
import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/bloc/auth_cubit.dart';

/// Punto de entrada principal de la aplicación Barber Time
void main() async {
  // Asegurar que los widgets estén inicializados
  WidgetsFlutterBinding.ensureInitialized();
  
  // Configuración para orientación vertical únicamente (diseño para móviles)
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  // Establecer el color de la barra de estado para combinar con nuestro tema
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppTheme.kBackgroundColor,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  
  // Inicializar el service locator para inyección de dependencias
  await initServiceLocator();
  
  // Iniciar la aplicación
  runApp(
    BlocProvider(
      create: (context) => sl<AuthCubit>()..checkAuthStatus(),
      child: const BarberTimeApp(),
    ),
  );
}

/// Widget raíz de la aplicación Barber Time
class BarberTimeApp extends StatelessWidget {
  const BarberTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Utilizamos MaterialApp.router para la integración con go_router
    return MaterialApp.router(
      title: 'Barber Time',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      routerConfig: AppRouter.router,
    );
  }
}

// La pantalla inicial ahora es gestionada por el router
