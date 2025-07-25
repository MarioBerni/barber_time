# 🏛️ Barber Time: Arquitectura y Estructura de Código

Este documento describe la arquitectura de software y la organización estructural del proyecto Barber Time. Su propósito es asegurar que el código sea limpio, mantenible, escalable y fácil de entender para cualquier desarrollador.

---

## 1. Arquitectura Limpia

El proyecto sigue una **Arquitectura Limpia** estricta. Esta filosofía de diseño separa el software en capas, cada una con responsabilidades claras y dependencias bien definidas. El objetivo es aislar la lógica de negocio de los detalles de implementación (como la UI y la base de datos), haciendo el sistema más fácil de probar y mantener.

**Regla de Dependencia:** Las dependencias solo pueden apuntar hacia adentro. La capa de Presentación conoce al Dominio, pero el Dominio no sabe nada sobre la Presentación.

### 1.1 Estructura de Directorios por Feature
La arquitectura se aplica a nivel de *feature* (módulo de funcionalidad). Cada feature dentro de `lib/features/` contiene tres capas:

```
lib/features/
└── feature_name/     # Ej: auth, home, profile
    ├── data/         # Implementación de repositorios y fuentes de datos
    │   ├── datasources/ # Fuentes de datos (API, local, mock)
    │   ├── models/      # Modelos de datos específicos de la fuente (ej: JSON)
    │   └── repositories/ # Implementación de los repositorios del dominio
    ├── domain/       # Lógica de negocio pura (independiente de UI y datos)
    │   ├── entities/    # Objetos de negocio principales
    │   ├── repositories/ # Interfaces (contratos) de los repositorios
    │   └── usecases/    # Casos de uso que orquestan la lógica
    └── presentation/ # Capa de UI
        ├── bloc/        # Lógica de estado (BLoCs/Cubits)
        ├── pages/       # Pantallas principales de la feature
        └── widgets/     # Widgets específicos de esta feature
```

### 1.2 Mapa de Decisiones: Dónde Colocar Cada Componente

| Si estás creando... | Colocarlo en... |
|---------------------|----------------|
| Un widget reutilizable en **toda** la app (ej: un botón custom) | `/lib/core/widgets/` |
| Un widget específico de **una** feature (ej: el formulario de login) | `/lib/features/auth/presentation/widgets/` |
| Una clase de utilidad general (ej: un formateador de fechas) | `/lib/core/utils/` |
| Un nuevo objeto de negocio (ej: `Cita`) | `/lib/features/appointments/domain/entities/` |
| La implementación de un repositorio (ej: `AuthRepositoryImpl`) | `/lib/features/auth/data/repositories/` |
| La lógica de estado para una pantalla | `/lib/features/{feature}/presentation/bloc/` |

---

## 2. Principios de Modularización

La modularización es clave para la mantenibilidad. El objetivo es tener componentes pequeños, enfocados y fáciles de entender.

### 2.1 Regla de Oro: Límite Estricto de Tamaño
- **Regla Crítica:** Ningún archivo `.dart` debe exceder las **200 líneas** de código.
- Este límite es **obligatorio y no negociable**.
- Si un archivo se acerca a este límite, debe ser refactorizado y dividido inmediatamente. La planificación debe hacerse para evitar llegar a este punto.

### 2.2 Señales de Alerta para Refactorizar
Debes considerar dividir un componente si:
- Un widget tiene más de **3 niveles de anidación** de `Column`/`Row`/`Stack`.
- Un método tiene más de **20 líneas**.
- Una clase tiene más de **5 métodos públicos**.
- Un archivo importa más de **10 dependencias**.
- Un componente maneja múltiples responsabilidades (ej: muestra datos Y maneja la entrada del usuario Y hace cálculos).

### 2.3 Estrategias de Modularización
- **Widgets:** Extrae secciones visuales coherentes en widgets separados. En lugar de un `LoginPage` de 400 líneas, tendrás `LoginHeader`, `LoginForm`, `SocialLoginButtons`, cada uno en su propio archivo.
- **Lógica de Negocio:** Extrae métodos complejos a clases de ayuda o servicios específicos.
- **Gestión de Estado:** Divide estados complejos en sub-estados. Crea Cubits/BLoCs específicos para dominios de estado independientes.

---

## 3. Estructuras de Código Transversales (`/core`)

La carpeta `lib/core/` contiene código que es compartido por múltiples features. Además de `di`, `routes`, `theme` y `widgets`, se deben considerar las siguientes estructuras:

### 3.1 Constantes de la Aplicación (`/core/constants`)
- **Propósito:** Centralizar valores literales que se usan en múltiples lugares de la aplicación para evitar errores de tipeo y facilitar su modificación.
- **Regla:** **No usar "magic strings" o "magic numbers" directamente en el código.** Deben ser definidos como constantes en esta carpeta.
- **Ejemplos de Archivos:**
    - `app_constants.dart`: Para valores numéricos (ej: `kDefaultPageSize = 20`).
    - `route_constants.dart`: Para los nombres de las rutas (ej: `const kHomeRoute = '/home'`).
    - `asset_constants.dart`: Para las rutas a los activos (ej: `const kLogoImage = 'assets/images/logo.png'`).

## 3. Arquitectura de prinicipales carpetas y archivos

Directory structure:
└── marioberni-barber_time/
    ├── README.md
    ├── analysis_options.yaml
    ├── ARCHITECTURE.md
    ├── DESIGN_SYSTEM.md
    ├── DEVELOPMENT_GUIDE.md
    ├── PROJECT_OVERVIEW.md
    ├── pubspec.lock
    ├── pubspec.yaml
    ├── .metadata
    ├── android/
    │   ├── build.gradle.kts
    │   ├── gradle.properties
    │   ├── settings.gradle.kts
    │   ├── app/
    │   │   ├── build.gradle.kts
    │   │   └── src/
    │   │       ├── debug/
    │   │       │   └── AndroidManifest.xml
    │   │       ├── main/
    │   │       │   ├── AndroidManifest.xml
    │   │       │   ├── kotlin/
    │   │       │   │   └── com/
    │   │       │   │       └── barbertime/
    │   │       │   │           └── barber_time/
    │   │       │   │               └── MainActivity.kt
    │   │       │   └── res/
    │   │       │       ├── drawable/
    │   │       │       │   └── launch_background.xml
    │   │       │       ├── drawable-v21/
    │   │       │       │   └── launch_background.xml
    │   │       │       ├── values/
    │   │       │       │   └── styles.xml
    │   │       │       └── values-night/
    │   │       │           └── styles.xml
    │   │       └── profile/
    │   │           └── AndroidManifest.xml
    │   └── gradle/
    │       └── wrapper/
    │           └── gradle-wrapper.properties
    ├── ios/
    │   ├── Flutter/
    │   │   ├── AppFrameworkInfo.plist
    │   │   ├── Debug.xcconfig
    │   │   └── Release.xcconfig
    │   ├── Runner/
    │   │   ├── AppDelegate.swift
    │   │   ├── Info.plist
    │   │   ├── Runner-Bridging-Header.h
    │   │   ├── Assets.xcassets/
    │   │   │   ├── AppIcon.appiconset/
    │   │   │   │   └── Contents.json
    │   │   │   └── LaunchImage.imageset/
    │   │   │       ├── README.md
    │   │   │       └── Contents.json
    │   │   └── Base.lproj/
    │   │       ├── LaunchScreen.storyboard
    │   │       └── Main.storyboard
    │   └── RunnerTests/
    │       └── RunnerTests.swift
    ├── lib/
    │   ├── main.dart
    │   ├── core/
    │   │   ├── constants/
    │   │   │   └── montevideo_barrios.dart
    │   │   ├── di/
    │   │   │   └── service_locator.dart
    │   │   ├── routes/
    │   │   │   ├── app_router.dart
    │   │   │   ├── app_routes.dart
    │   │   │   └── route_transitions.dart
    │   │   ├── theme/
    │   │   │   ├── app_border_radius.dart
    │   │   │   ├── app_spacing.dart
    │   │   │   ├── app_special_themes.dart
    │   │   │   ├── app_text_styles.dart
    │   │   │   ├── app_theme.dart
    │   │   │   └── app_theme_extensions.dart
    │   │   └── widgets/
    │   │       ├── status_badge.dart
    │   │       ├── themed_button.dart
    │   │       ├── themed_card.dart
    │   │       ├── avatars/
    │   │       │   └── user_avatar.dart
    │   │       ├── backgrounds/
    │   │       │   ├── animated_circle.dart
    │   │       │   ├── animated_circle_renderer.dart
    │   │       │   ├── animated_gradient_background.dart
    │   │       │   ├── gradient_background_factory.dart
    │   │       │   ├── gradient_background_preset.dart
    │   │       │   ├── gradient_builders.dart
    │   │       │   ├── gradient_overlay_background.dart
    │   │       │   ├── gradient_types.dart
    │   │       │   ├── pattern_background.dart
    │   │       │   ├── striped_pattern_painter.dart
    │   │       │   └── painters/
    │   │       │       ├── diagonal_stripes_painter.dart
    │   │       │       ├── grid_pattern_painter.dart
    │   │       │       └── scissors_pattern_painter.dart
    │   │       ├── buttons/
    │   │       │   ├── stylized_button.dart
    │   │       │   ├── stylized_button_animations.dart
    │   │       │   ├── stylized_button_base.dart
    │   │       │   ├── stylized_button_style.dart
    │   │       │   └── stylized_button_types.dart
    │   │       ├── carousels/
    │   │       │   └── horizontal_carousel.dart
    │   │       ├── containers/
    │   │       │   └── glam_container.dart
    │   │       ├── icons/
    │   │       │   ├── animated_icon_widget.dart
    │   │       │   └── styled_icon.dart
    │   │       ├── inputs/
    │   │       │   └── search_bar.dart
    │   │       └── navigation/
    │   │           ├── app_top_bar.dart
    │   │           └── bottom_navigation_bar.dart
    │   └── features/
    │       ├── auth/
    │       │   ├── data/
    │       │   │   ├── datasources/
    │       │   │   │   └── auth_data_source.dart
    │       │   │   └── repositories/
    │       │   │       └── auth_repository_impl.dart
    │       │   ├── domain/
    │       │   │   ├── entities/
    │       │   │   │   ├── auth_credentials.dart
    │       │   │   │   └── user.dart
    │       │   │   ├── repositories/
    │       │   │   │   └── auth_repository.dart
    │       │   │   └── usecases/
    │       │   │       ├── login_usecase.dart
    │       │   │       └── register_usecase.dart
    │       │   └── presentation/
    │       │       ├── bloc/
    │       │       │   ├── auth_cubit.dart
    │       │       │   └── auth_state.dart
    │       │       ├── pages/
    │       │       │   ├── login_page.dart
    │       │       │   └── register_page.dart
    │       │       └── widgets/
    │       │           ├── auth_text_field.dart
    │       │           ├── login_form.dart
    │       │           ├── login_header.dart
    │       │           └── login_register_link.dart
    │       ├── home/
    │       │   ├── data/
    │       │   │   ├── datasources/
    │       │   │   │   └── home_mock_datasource.dart
    │       │   │   └── repositories/
    │       │   │       └── home_repository_impl.dart
    │       │   ├── domain/
    │       │   │   ├── entities/
    │       │   │   │   ├── salon.dart
    │       │   │   │   ├── service_category.dart
    │       │   │   │   └── special_offer.dart
    │       │   │   ├── repositories/
    │       │   │   │   └── home_repository.dart
    │       │   │   └── usecases/
    │       │   │       └── get_home_data_usecase.dart
    │       │   └── presentation/
    │       │       ├── bloc/
    │       │       │   ├── home_cubit.dart
    │       │       │   └── home_state.dart
    │       │       ├── pages/
    │       │       │   └── home_page.dart
    │       │       └── widgets/
    │       │           ├── home_header.dart
    │       │           ├── home_salon_card.dart
    │       │           ├── home_service_category_item.dart
    │       │           ├── home_special_offer_card.dart
    │       │           ├── service_categories_section.dart
    │       │           ├── special_offers_section.dart
    │       │           └── top_rated_salons_section.dart
    │       └── profile/
    │           ├── domain/
    │           │   └── entities/
    │           │       ├── user_profile.dart
    │           │       └── user_type.dart
    │           └── presentation/
    │               ├── bloc/
    │               │   ├── profile_cubit.dart
    │               │   └── profile_state.dart
    │               ├── pages/
    │               │   └── profile_page.dart
    │               └── widgets/
    │                   ├── profile_info_view.dart
    │                   ├── profile_section.dart
    │                   ├── profile_tabs.dart
    │                   ├── unauthenticated_view.dart
    │                   ├── user_type_option.dart
    │                   └── tabs/
    │                       ├── profile_business_tab.dart
    │                       ├── profile_favorites_tab.dart
    │                       ├── profile_history_tab.dart
    │                       ├── profile_info_tab.dart
    │                       ├── profile_settings_tab.dart
    │                       └── components/
    │                           ├── address_item.dart
    │                           └── profile_info_row.dart
    ├── linux/
    │   ├── CMakeLists.txt
    │   ├── flutter/
    │   │   ├── CMakeLists.txt
    │   │   ├── generated_plugin_registrant.cc
    │   │   ├── generated_plugin_registrant.h
    │   │   └── generated_plugins.cmake
    │   └── runner/
    │       ├── CMakeLists.txt
    │       ├── main.cc
    │       ├── my_application.cc
    │       └── my_application.h
    ├── macos/
    │   ├── Flutter/
    │   │   ├── Flutter-Debug.xcconfig
    │   │   ├── Flutter-Release.xcconfig
    │   │   └── GeneratedPluginRegistrant.swift
    │   ├── Runner/
    │   │   ├── AppDelegate.swift
    │   │   ├── DebugProfile.entitlements
    │   │   ├── Info.plist
    │   │   ├── MainFlutterWindow.swift
    │   │   ├── Release.entitlements
    │   │   ├── Assets.xcassets/
    │   │   │   └── AppIcon.appiconset/
    │   │   │       └── Contents.json
    │   │   ├── Base.lproj/
    │   │   │   └── MainMenu.xib
    │   │   └── Configs/
    │   │       ├── AppInfo.xcconfig
    │   │       ├── Debug.xcconfig
    │   │       ├── Release.xcconfig
    │   │       └── Warnings.xcconfig
    │   └── RunnerTests/
    │       └── RunnerTests.swift
    ├── tasks/
    │   ├── TASK_componentes_de_estado_ui.md
    │   ├── TASK_configuracion_inicial.md
    │   ├── TASK_fortalecer_entorno_desarrollo.md
    │   ├── TASK_home_page.md
    │   ├── TASK_profile_page.md
    │   └── TASK_sistema_de_diseno.md
    ├── test/
    │   └── widget_test.dart
    ├── web/
    │   ├── index.html
    │   └── manifest.json
    ├── windows/
    │   ├── CMakeLists.txt
    │   ├── flutter/
    │   │   ├── CMakeLists.txt
    │   │   ├── generated_plugin_registrant.cc
    │   │   ├── generated_plugin_registrant.h
    │   │   └── generated_plugins.cmake
    │   └── runner/
    │       ├── CMakeLists.txt
    │       ├── flutter_window.cpp
    │       ├── flutter_window.h
    │       ├── main.cpp
    │       ├── resource.h
    │       ├── runner.exe.manifest
    │       ├── Runner.rc
    │       ├── utils.cpp
    │       ├── utils.h
    │       ├── win32_window.cpp
    │       └── win32_window.h
    └── .windsurf/
        └── workflows/
            └── profesor-synapse.md
