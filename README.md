# Barber Time App

Aplicación móvil para reserva de servicios de barbería desarrollada con Flutter, siguiendo arquitectura limpia y principios de modularización.

## Funcionalidades Implementadas

### Configuración Inicial
- ✅ Estructura de directorios siguiendo arquitectura limpia y modular
- ✅ Tema personalizado con paleta de colores corporativos
- ✅ Sistema de navegación con go_router
- ✅ Inyección de dependencias con get_it

### Módulo de Autenticación
- ✅ Estructura completa siguiendo Clean Architecture
- ✅ Casos de uso para login y registro
- ✅ Mock data source para desarrollo y pruebas
- ✅ Gestión de estado con BLoC/Cubit
- ✅ Pantallas de login y registro con validación

## Tecnologías Utilizadas

- **Flutter**: Framework UI para desarrollo multiplataforma
- **BLoC/Cubit**: Para gestión de estado
- **get_it**: Para inyección de dependencias
- **go_router**: Para navegación
- **equatable**: Para comparación de objetos

## Arquitectura

El proyecto sigue una arquitectura limpia con la siguiente estructura:

```
lib/
├── core/                 # Funcionalidad compartida
│   ├── animations/       # Animaciones reusables
│   ├── di/               # Inyección de dependencias
│   ├── routes/           # Sistema de navegación
│   ├── theme/            # Definición de tema
│   ├── utils/            # Utilidades generales
│   └── widgets/          # Widgets reutilizables
└── features/             # Módulos por funcionalidad
    └── auth/             # Módulo de autenticación
        ├── data/         # Capa de datos
        ├── domain/       # Lógica de negocio
        └── presentation/ # Interfaz de usuario
```

## Próximos Pasos

- Implementar tests unitarios para el módulo de autenticación
- Desarrollar el módulo de Home/Dashboard
- Integrar con backend real
- Añadir pantalla de splash real

## Ejecutar el Proyecto

```bash
flutter pub get
flutter run
```
