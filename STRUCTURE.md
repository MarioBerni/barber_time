Directory structure:
└── marioberni-barber_time/
    ├── README.md
    ├── analysis_options.yaml
    ├── CODE_AND_MODULARIZATION_STANDARDS.md
    ├── DEVELOPMENT_GUIDE.md
    ├── MODULARIZATION_GUIDE.md
    ├── PROJECT_OVERVIEW.md
    ├── pubspec.lock
    ├── pubspec.yaml
    ├── STRUCTURE.md
    ├── .metadata
    ├── android/
    │   ├── build.gradle.kts
    │   ├── gradle.properties
    │   ├── settings.gradle.kts
    │   ├── .gitignore
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
    ├── docs/
    │   └── GUIA_MIGRACION_TEMA.md
    ├── ios/
    │   ├── .gitignore
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
    │   ├── Runner.xcodeproj/
    │   │   ├── project.pbxproj
    │   │   ├── project.xcworkspace/
    │   │   │   ├── contents.xcworkspacedata
    │   │   │   └── xcshareddata/
    │   │   │       ├── IDEWorkspaceChecks.plist
    │   │   │       └── WorkspaceSettings.xcsettings
    │   │   └── xcshareddata/
    │   │       └── xcschemes/
    │   │           └── Runner.xcscheme
    │   ├── Runner.xcworkspace/
    │   │   ├── contents.xcworkspacedata
    │   │   └── xcshareddata/
    │   │       ├── IDEWorkspaceChecks.plist
    │   │       └── WorkspaceSettings.xcsettings
    │   └── RunnerTests/
    │       └── RunnerTests.swift
    ├── lib/
    │   ├── main.dart
    │   ├── core/
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
    │   │       ├── backgrounds/
    │   │       │   ├── animated_circle.dart
    │   │       │   ├── animated_circle_renderer.dart
    │   │       │   ├── animated_gradient_background.dart
    │   │       │   ├── gradient_background_factory.dart
    │   │       │   ├── gradient_background_preset.dart
    │   │       │   ├── gradient_overlay_background.dart
    │   │       │   ├── pattern_background.dart
    │   │       │   ├── striped_pattern_painter.dart
    │   │       │   └── painters/
    │   │       │       ├── diagonal_stripes_painter.dart
    │   │       │       ├── grid_pattern_painter.dart
    │   │       │       └── scissors_pattern_painter.dart
    │   │       ├── buttons/
    │   │       │   └── stylized_button.dart
    │   │       ├── containers/
    │   │       │   └── glam_container.dart
    │   │       └── icons/
    │   │           └── animated_icon_widget.dart
    │   └── features/
    │       └── auth/
    │           ├── data/
    │           │   ├── datasources/
    │           │   │   └── auth_data_source.dart
    │           │   └── repositories/
    │           │       └── auth_repository_impl.dart
    │           ├── domain/
    │           │   ├── entities/
    │           │   │   ├── auth_credentials.dart
    │           │   │   └── user.dart
    │           │   ├── repositories/
    │           │   │   └── auth_repository.dart
    │           │   └── usecases/
    │           │       ├── login_usecase.dart
    │           │       └── register_usecase.dart
    │           └── presentation/
    │               ├── bloc/
    │               │   ├── auth_cubit.dart
    │               │   └── auth_state.dart
    │               ├── pages/
    │               │   ├── login_page.dart
    │               │   └── register_page.dart
    │               └── widgets/
    │                   ├── auth_text_field.dart
    │                   ├── login_form.dart
    │                   ├── login_header.dart
    │                   └── login_register_link.dart
    ├── linux/
    │   ├── CMakeLists.txt
    │   ├── .gitignore
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
    │   ├── .gitignore
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
    │   ├── Runner.xcodeproj/
    │   │   ├── project.pbxproj
    │   │   ├── project.xcworkspace/
    │   │   │   └── xcshareddata/
    │   │   │       └── IDEWorkspaceChecks.plist
    │   │   └── xcshareddata/
    │   │       └── xcschemes/
    │   │           └── Runner.xcscheme
    │   ├── Runner.xcworkspace/
    │   │   ├── contents.xcworkspacedata
    │   │   └── xcshareddata/
    │   │       └── IDEWorkspaceChecks.plist
    │   └── RunnerTests/
    │       └── RunnerTests.swift
    ├── tasks/
    │   ├── TASK_configuracion_inicial.md
    │   ├── TASK_fondo_animado.md
    │   ├── TASK_mejora_diseno_visual.md
    │   └── TASK_tema_y_estilo_centralizado.md
    ├── test/
    │   └── widget_test.dart
    ├── web/
    │   ├── index.html
    │   └── manifest.json
    ├── windows/
    │   ├── CMakeLists.txt
    │   ├── .gitignore
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
