# ✅ Tarea: Configuración Inicial del Proyecto

**Objetivo:** Establecer la estructura base del proyecto, la navegación y la inyección de dependencias.

---

### Checklist

- [x] **Estructura del Proyecto**
  - [x] Crear proyecto Flutter base.
  - [x] Definir estructura de carpetas `core` y `features`.

- [x] **Configuración de `main.dart`**
  - [x] Configurar orientación vertical.
  - [x] Establecer estilos de la barra de estado del sistema.
  - [x] Inicializar servicios antes de `runApp`.

- [x] **Navegación (GoRouter)**
  - [x] Añadir dependencia `go_router`.
  - [x] Crear estructura de archivos en `lib/core/routes`.
  - [x] Definir rutas principales en `AppRouter`.
  - [x] Implementar transiciones de página personalizadas.

- [x] **Inyección de Dependencias (GetIt)**
  - [x] Añadir dependencia `get_it`.
  - [x] Crear `service_locator.dart` en `lib/core/di`.
  - [x] Implementar función de inicialización `initServiceLocator`.

- [x] **Gestión de Estado (BLoC)**
  - [x] Añadir dependencias `flutter_bloc`, `bloc` y `equatable`.
  - [x] Preparar la arquitectura para la integración de BLoCs en las features.

---

### Referencias a la Documentación

- La **estructura de carpetas** sigue los lineamientos de `ARCHITECTURE.md`.
- La configuración de **GoRouter** y **GetIt** implementa los patrones descritos en `ARCHITECTURE.md`.
- Los **estándares generales** aplicados se encuentran en `DEVELOPMENT_GUIDE.md`.