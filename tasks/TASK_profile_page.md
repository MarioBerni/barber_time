# 👤 Tarea: Página de Perfil

**Objetivo:** Crear una página de perfil que permita a los usuarios gestionar su información y acceder a funcionalidades según su rol (Cliente o Administrador).

**Dependencia Crítica:** Esta tarea depende de la finalización de componentes en `TASK_sistema_de_diseno.md` (especialmente `ThemedTextField` para los formularios) y potencialmente de la lógica de autenticación que se defina a futuro.

---

### Checklist

- [x] **Estructura y Configuración**
  - [x] Crear la `feature` de `profile` siguiendo la Arquitectura Limpia.
  - [x] Añadir la ruta en `app_router.dart` y la navegación desde la `AppBottomNavigationBar`.
  - [x] Crear `ProfileCubit` y `ProfileState` para la gestión de estado.
  - [x] Definir entidades `UserProfile`, `ClientData` y `AdminData`.

- [x] **Componentes Base y UI**
  - [x] Reutilizar `AppTopBar` para el encabezado de la página.
  - [x] Implementar la vista para usuarios no autenticados, incluyendo el selector de tipo de cuenta (Cliente/Admin).
  - [x] Crear `ProfileSection` como un contenedor genérico para las secciones de contenido.

- [ ] **Flujo de Registro y Perfil de Cliente**
  - [ ] Implementar el formulario de registro para Clientes con sus validaciones.
  - [ ] Implementar la vista del perfil del Cliente (información personal, favoritos, historial).

- [ ] **Flujo de Registro y Perfil de Administrador**
  - [ ] Implementar el formulario de registro para Administradores con sus campos adicionales.
  - [ ] Implementar el dashboard del perfil de Administrador (gestión del negocio, servicios, etc.).

- [ ] **Finalización y Pruebas**
  - [ ] Verificar la correcta visualización en diferentes tamaños de pantalla.
  - [ ] Probar todos los flujos de navegación y la lógica de los formularios.

---

### Referencias a la Documentación

- La estructura de esta feature debe seguir los patrones de `ARCHITECTURE.md`.
- Todos los componentes de UI deben usar estilos de `DESIGN_SYSTEM.md`.
- El flujo de trabajo y los estándares de código están definidos en `DEVELOPMENT_GUIDE.md`.