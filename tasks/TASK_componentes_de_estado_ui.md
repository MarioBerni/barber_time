# 🖼️ Tarea: Componentes de Estado de UI

**Objetivo:** Crear un conjunto de widgets reutilizables y estandarizados para representar los estados comunes de la UI (carga, error, vacío), asegurando una experiencia de usuario consistente en toda la aplicación.

**Prioridad:** Alta. Estos componentes son fundamentales para conectar la lógica de estado (BLoCs) con la interfaz de usuario de manera profesional.

---

### Checklist

- [x] **Widget de Carga**
  - [x] Crear `LoadingIndicatorWidget` en `lib/core/widgets/states/`.
  - [x] Diseñar una animación de carga sutil que se alinee con la identidad visual de la marca.

- [x] **Widget de Error**
  - [x] Crear `ErrorMessageWidget` en `lib/core/widgets/states/`.
  - [x] Diseñar una vista que incluya un icono, un título, un mensaje descriptivo y un botón opcional de "Reintentar".

- [x] **Widget de Estado Vacío**
  - [x] Crear `EmptyStateWidget` en `lib/core/widgets/states/`.
  - [x] Diseñar una vista con un icono o ilustración, un título y un subtítulo para contextos como "No se encontraron resultados".

- [x] **Integración**
  - [x] Reemplazar los posibles `CircularProgressIndicator` o `Text('Error')` hardcodeados con los nuevos widgets estandarizados.
  - [x] Crear archivo barrel `states.dart` para facilitar la importación de los componentes.

---

### Referencias a la Documentación

- El diseño y propósito de estos componentes están definidos en **`DESIGN_SYSTEM.md`** (Sección 4).
- La implementación debe seguir las convenciones de nombrado y estructura de **`DEVELOPMENT_GUIDE.md`**.
