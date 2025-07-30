# 👤 Tarea: Página de Perfil

**Objetivo:** Crear una página de perfil que permita a los usuarios gestionar su información y acceder a funcionalidades según su rol (Cliente o Administrador).

**Dependencia Crítica:** ✅ **RESUELTA** - Componentes `ThemedTextField` y `SearchBar` completados. Sistema de diseño dark premium establecido.

**Estado Actual:** **98% COMPLETADO** - Formulario premium con campo telefónico internacional, botón mejorado y diálogo de confirmación implementados. **Siguiente paso:** Implementar vista del perfil del Cliente.

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

- [x] **Flujo de Registro y Perfil de Cliente** ✅ **COMPLETADO (98%)**
  - [x] Implementar el formulario de registro para Clientes con sus validaciones.
  - [x] Conectar estados de registro con ProfileCubit y navegación.
  - [x] Implementar validaciones en tiempo real y manejo de errores.
  - [x] **COMPLETADO:** Rediseñar formulario con paleta dark premium de Home.
    - ✅ Fondo con gradiente sutil usando `AnimatedGradientBackground`
    - ✅ Header con tipografía elegante y efectos de gradiente tricolor
    - ✅ Formulario en contenedor premium con sombras dobles
    - ✅ Botón con gradiente, sombras múltiples y alta visibilidad
    - ✅ AppBar semi-transparente y mensajes de error estilizados
    - ✅ **MEJORADO:** Contraste y visibilidad optimizados para todos los elementos
    - ✅ **PREMIUM:** Botón dorado con gradiente oro medio → oro oscuro
    - ✅ **ELEGANTE:** Header con icono de tijeras y título con shader dorado
    - ✅ **DECORATIVO:** Elementos premium, dividers, notas informativas
    - ✅ **ARMONIOSO:** Paleta turquesa-menta coherente con Home Page
    - ✅ **PREMIUM:** Solo botón dorado como elemento exclusivo destacado
    - ✅ **TOQUES DORADOS:** Estrella del divider y borde del botón activo
    - ✅ **GRADIENTE SUTIL:** Divider con transición dorado → turquesa → transparente
  - [x] **NUEVO - CAMPO TELEFÓNICO INTERNACIONAL:**
    - ✅ **INTEGRACIÓN:** Paquete `phone_form_field` para números internacionales
    - ✅ **WIDGET CUSTOM:** `ThemedPhoneField` con diseño premium consistente
    - ✅ **PAÍS DEFAULT:** Uruguay (+598) precargado automáticamente
    - ✅ **MODAL PAÍSES:** Selector personalizado con tema dark premium
    - ✅ **VALIDACIÓN:** Regex internacional + validación nativa del paquete
    - ✅ **LOCALIZACIÓN:** Español e inglés configurados globalmente
  - [x] **NUEVO - REGISTRO CON GOOGLE:**
    - ✅ **BOTÓN GOOGLE:** Diseño premium con icono 'G' personalizado
    - ✅ **DIVIDER ELEGANTE:** "O continúa con tu email" con líneas laterales
    - ✅ **FLUJO SEPARADO:** Google vs formulario manual claramente divididos
    - ✅ **COHERENCIA:** Mismo sistema de colores y efectos visuales
  - [x] **NUEVO - BOTÓN Y CONFIRMACIÓN MEJORADOS:**
    - ✅ **BOTÓN DINÁMICO:** "Crear Cuenta Premium" vs "Completa los campos"
    - ✅ **ICONOS ANIMADOS:** Rocket vs Edit con AnimatedSwitcher
    - ✅ **EFECTOS PREMIUM:** AnimatedContainer + gradientes + sombras múltiples
    - ✅ **DIÁLOGO CONFIRMACIÓN:** Modal premium con resumen de datos
    - ✅ **UX MEJORADA:** Prevención de errores + feedback visual claro
    - ✅ **LOADING STATE:** "Creando cuenta..." con spinner elegante
  - [ ] **SIGUIENTE:** Implementar la vista del perfil del Cliente (información personal, favoritos, historial).

- [ ] **Flujo de Registro y Perfil de Administrador**
  - [ ] Implementar el formulario de registro para Administradores con sus campos adicionales.
  - [ ] Implementar el dashboard del perfil de Administrador (gestión del negocio, servicios, etc.).

- [x] **Mejoras de Diseño y UX**
  - [x] **COMPLETADO:** Rediseñar formulario de registro con paleta dark premium de Home.
  - [x] Implementar animaciones sutiles y transiciones suaves.
  - [x] Optimizar responsividad y espaciado según sistema de diseño.
  - [x] Documentar patrón de formularios premium en `DESIGN_SYSTEM.md`.

- [ ] **Finalización y Pruebas**
  - [x] Navbar unificado entre Home y Profile implementado.
  - [ ] Verificar la correcta visualización en diferentes tamaños de pantalla.
  - [ ] Probar todos los flujos de navegación y la lógica de los formularios.

---

### Referencias a la Documentación

- La estructura de esta feature debe seguir los patrones de `ARCHITECTURE.md`.
- Todos los componentes de UI deben usar estilos de `DESIGN_SYSTEM.md`.
- El flujo de trabajo y los estándares de código están definidos en `DEVELOPMENT_GUIDE.md`.
