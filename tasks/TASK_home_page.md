# 🏠 Tarea: Home Page

**Objetivo:** Implementar una página de inicio funcional y atractiva que sirva como punto de entrada para los usuarios, permitiéndoles explorar la app antes de registrarse.

**Dependencia Crítica:** El progreso de esta tarea está directamente ligado a la finalización de los componentes en `TASK_sistema_de_diseno.md`. Las funcionalidades no se pueden considerar completas hasta que sus componentes de UI subyacentes estén listos.

---

### Checklist

- [x] **Estructura y Configuración**
  - [x] Crear la `feature` de `home` siguiendo la Arquitectura Limpia.
  - [x] Establecer `HomePage` como la ruta inicial (`/`) en `app_router.dart`.
  - [x] Crear `HomeCubit` y `HomeState` para la gestión de estado.
  - [x] Implementar modelos, repositorios y fuentes de datos mock.

- [ ] **Componentes de UI Principales**
  - [x] Crear `AppTopBar` reutilizable con saludo, avatar y notificaciones.
  - [ ] Crear `SearchBar` reutilizable (depende de `ThemedTextField`).
  - [x] Crear `HorizontalCarousel` genérico para las secciones.
  - [x] Crear `AppBottomNavigationBar` reutilizable.

- [x] **Secciones de Contenido**
  - [x] Implementar sección de Ofertas Especiales (`SpecialOffersSection`).
  - [x] Implementar sección de Categorías de Servicios (`ServiceCategoriesSection`).
  - [x] Implementar sección de Salones Mejor Valorados (`TopRatedSalonsSection`).

- [ ] **Funcionalidad de Búsqueda**
  - [ ] Implementar lógica de filtrado en el `HomeCubit`.
  - [ ] Conectar la `SearchBar` para actualizar la UI con los resultados.
  - [ ] Mostrar un estado vacío cuando no hay resultados.

- [ ] **Finalización y Pruebas**
  - [ ] Verificar la correcta visualización y responsividad en diferentes tamaños de pantalla.
  - [ ] Realizar pruebas de navegación desde la `HomePage` a otras secciones (login, registro, etc.).

---

### Referencias a la Documentación

- La estructura de esta feature debe seguir los patrones de `ARCHITECTURE.md`.
- Todos los componentes de UI deben usar estilos de `DESIGN_SYSTEM.md`.
- El flujo de trabajo y los estándares de código están definidos en `DEVELOPMENT_GUIDE.md`.