import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_form_field/phone_form_field.dart';

import 'core/di/service_locator.dart';
import 'core/routes/app_router.dart';
import 'core/theme/app_design_constants.dart';
import 'core/theme/app_theme.dart';

/// Punto de entrada principal de la aplicación Barber Time
void main() async {
  // Asegurar que los widgets estén inicializados
  WidgetsFlutterBinding.ensureInitialized();

  // Configuración para orientación vertical únicamente (diseño para móviles)
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Establecer el color de la barra de estado
  // para combinar con nuestro tema claro
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: AppTheme.kBackgroundColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  // Inicializar el service locator para inyección de dependencias
  await initServiceLocator();

  // Iniciar la aplicación
  runApp(const BarberTimeApp());
}

/// Widget raíz de la aplicación Barber Time.
class BarberTimeApp extends StatelessWidget {
  /// Constructor del widget raíz de la aplicación.
  const BarberTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Utilizamos MaterialApp.router para la integración con go_router
    return MaterialApp.router(
      title: 'Barber Time',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,

      // Configuración de localización para phone_form_field
      localizationsDelegates: [...PhoneFieldLocalization.delegates],
      supportedLocales: const [
        Locale('es', ''), // Español
        Locale('en', ''), // Inglés
      ],
      locale: const Locale('es', ''), // Español por defecto
      // Tema personalizado que incluye el selector de países premium
      theme: AppTheme.lightTheme.copyWith(
        // Personalizar BottomSheet para el selector de países
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: AppTheme.kSurfaceColor,
          modalBackgroundColor: AppTheme.kSurfaceColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppDesignConstants.borderRadiusXXL),
            ),
          ),
        ),
        // Personalizar AppBar del selector
        appBarTheme: AppBarTheme(
          backgroundColor: AppTheme.kSurfaceColor,
          foregroundColor: AppTheme.kOffWhite,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: AppTheme.kOffWhite,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        // Personalizar ListTile para países
        listTileTheme: ListTileThemeData(
          textColor: AppTheme.kOffWhite,
          iconColor: AppTheme.kPrimaryColor,
          tileColor: Colors.transparent,
        ),
        // Personalizar TextField de búsqueda
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppTheme.kCharcoalDark,
          hintStyle: TextStyle(
            color: AppTheme.kOffWhite.withAlpha((0.5 * 255).round()),
          ),
          prefixIconColor: AppTheme.kPrimaryColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppDesignConstants.borderRadiusLG,
            ),
            borderSide: BorderSide(
              color: AppTheme.kPrimaryColor.withAlpha((0.3 * 255).round()),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppDesignConstants.borderRadiusLG,
            ),
            borderSide: BorderSide(
              color: AppTheme.kCharcoalLight.withAlpha((0.6 * 255).round()),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppDesignConstants.borderRadiusLG,
            ),
            borderSide: BorderSide(color: AppTheme.kPrimaryColor, width: 2),
          ),
        ),
        // Personalizar Divider
        dividerTheme: DividerThemeData(
          color: AppTheme.kPrimaryColor.withAlpha((0.2 * 255).round()),
          thickness: 1,
          space: 1,
        ),
      ),
    );
  }
}

// La pantalla inicial ahora es gestionada por el router
