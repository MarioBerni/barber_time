# 📋 Tarea: Configuración Inicial del Proyecto Barber Time

## Objetivo
Establecer la estructura base del proyecto Flutter para la aplicación móvil Barber Time, siguiendo los estándares de arquitectura, modularización y diseño definidos en la documentación.

## Fecha
16/06/2025

## Estado
🟢 Completada

## Descripción
Esta tarea abarca la configuración inicial del proyecto, incluyendo la creación de la estructura de directorios, definición del tema global y configuración básica de la aplicación.

## Pasos Completados

1. ✅ Crear proyecto Flutter base con estructura predeterminada:
   ```
   flutter create --org com.barbertime --project-name barber_time --platforms=android,ios -t app .
   ```

2. ✅ Establecer la estructura de directorios según los estándares:
   ```
   lib/
   ├── core/                 # Funcionalidad compartida en toda la app
   │   ├── animations/       # Animaciones reusables
   │   ├── di/               # Inyección de dependencias
   │   ├── routes/           # Sistema de navegación
   │   ├── theme/            # Definición de tema
   │   ├── utils/            # Utilidades generales
   │   └── widgets/          # Widgets reutilizables comunes
   │
   └── features/             # Módulos por funcionalidad
   ```

3. ✅ Crear tema global (`lib/core/theme/app_theme.dart`) con la paleta de colores:
   - **Azules:** #00296B (kPrimaryColor), #001B4D (kBackgroundColor)
   - **Dorados:** #FDC500 (kAccentColor)
   - **Texto:** #FFFFFF (kTextColor), #B0BAC5 (kSecondaryTextColor)

4. ✅ Configurar `main.dart` para utilizar el tema personalizado y establecer pantalla inicial.

5. ✅ Actualizar archivo de prueba (`test/widget_test.dart`) para adaptarlo a la nueva estructura.

## Próximas Tareas

1. ✅ **Configuración de Navegación**: Implementar sistema de navegación con go_router.
   - ✅ Crear estructura básica en `lib/core/routes/`
   - ✅ Definir rutas principales (app_routes.dart)
   - ✅ Implementar transiciones personalizadas (route_transitions.dart)

2. ✅ **Inyección de Dependencias**: Configurar get_it para la inyección de dependencias.
   - ✅ Establecer archivo base en `lib/core/di/`
   - ✅ Crear función de inicialización (service_locator.dart)
   - ✅ Preparar para registro de servicios mock

3. ✅ **Módulo de Autenticación**: Crear estructura base para el primer feature (auth).
   - ✅ Implementar estructura de carpetas siguiendo arquitectura limpia
   - ✅ Crear modelos de dominio (User, LoginCredentials, RegisterCredentials, AuthResult)
   - ✅ Implementar repositorio y casos de uso (login, registro)
   - ✅ Desarrollar fuente de datos mock para pruebas
   - ✅ Implementar gestión de estado con BLoC/Cubit
   - ✅ Crear pantallas de inicio de sesión y registro con validación

## Notas Adicionales

- La aplicación actualmente tiene implementada una pantalla de inicio básica con los colores del tema.
- Se ha configurado la orientación vertical únicamente para mantener el diseño para móviles.
- Se han establecido las configuraciones de UI del sistema (barra de estado, navegación).

## Dependencias a Agregar en Próximas Tareas

- go_router: Para manejo de navegación
- get_it: Para inyección de dependencias
- flutter_bloc: Para gestión de estado
- equatable: Para modelos inmutables
- freezed: Para generación de código inmutable
