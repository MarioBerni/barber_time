# 🖼️ Tarea: Componentes de Estado de UI

**Objetivo:** Crear un conjunto de widgets reutilizables y estandarizados para representar los estados comunes de la UI (carga, error, vacío), asegurando una experiencia de usuario consistente en toda la aplicación.

**Prioridad:** Alta. Estos componentes son fundamentales para conectar la lógica de estado (BLoCs) con la interfaz de usuario de manera profesional.

---

### Checklist

- [ ] **Widget de Carga**
  - [ ] Crear `LoadingIndicatorWidget` en `lib/core/widgets/`.
  - [ ] Diseñar una animación de carga sutil que se alinee con la identidad visual de la marca.

- [ ] **Widget de Error**
  - [ ] Crear `ErrorMessageWidget` en `lib/core/widgets/`.
  - [ ] Diseñar una vista que incluya un icono, un título, un mensaje descriptivo y un botón opcional de "Reintentar".

- [ ] **Widget de Estado Vacío**
  - [ ] Crear `EmptyStateWidget` en `lib/core/widgets/`.
  - [ ] Diseñar una vista con un icono o ilustración, un título y un subtítulo para contextos como "No se encontraron resultados".

- [ ] **Integración**
  - [ ] Reemplazar los posibles `CircularProgressIndicator` o `Text('Error')` hardcodeados con los nuevos widgets estandarizados.

---

### Referencias a la Documentación

- El diseño y propósito de estos componentes están definidos en **`DESIGN_SYSTEM.md`** (Sección 4).
- La implementación debe seguir las convenciones de nombrado y estructura de **`DEVELOPMENT_GUIDE.md`**.
