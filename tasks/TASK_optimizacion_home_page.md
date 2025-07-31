# 🚀 Tarea: Optimización Home Page

**Objetivo:** Mejorar la experiencia de usuario, rendimiento y diseño visual de la página de inicio para ofrecer una navegación más intuitiva, optimizar componentes visuales y estructurar el código para mayor mantenibilidad.

**Dependencia Crítica:** Esta tarea es una continuación y optimización de la implementación base en `TASK_home_page.md`. Se requiere que la página Home actual esté funcionando correctamente antes de implementar estas mejoras.

**Estado Actual:** 🔄 **EN PROGRESO** - Funcionalidad base completada, pendiente rediseño completo con sistema centralizado.

**Fecha de Última Actualización:** 2025-01-27

---

### Checklist

- [x] **Mejorar la Jerarquía Visual y Experiencia de Navegación**
  - [x] Implementar sistema de pestañas (TabBar) debajo del header para filtrar entre:
    - [x] "Destacados" (por defecto)
    - [x] "Cerca de ti" (basado en ubicación)
    - [x] "Mejor valorados" (por rating)
  - [x] Añadir animaciones de transición suaves entre pestañas.
  - [x] Implementar gestos avanzados (deslizamiento lateral entre categorías).
  - [x] Actualizar el `HomeCubit` para manejar el estado de las pestañas y filtros.

- [x] **Optimizar Componentes Visuales**
  - [x] Rediseñar las tarjetas `HomeSalonCard`:
    - [x] Agregar indicador visual de distancia.
    - [x] Implementar badge distintivo para salones "Premium".
    - [x] Mostrar servicios principales como chips pequeños.
    - [x] Añadir micro-interacciones al pulsar (animación de escala).
  - [x] Mejorar la sección de ofertas especiales:
    - [x] Implementar indicador de página visible para el carrusel.
    - [x] Configurar auto-scroll suave cada 5 segundos.
    - [x] Añadir botón de acción más prominente para cada oferta.
    - [x] Crear transición 3D entre tarjetas al desplazar.

- [x] **Optimizar la Carga y Desempeño**
  - [x] Refactorizar la estructura a `CustomScrollView` con componentes `Sliver`.
  - [x] Implementar carga progresiva (lazy loading) para salones con `SliverList` y `SliverChildBuilderDelegate`.
  - [x] Optimizar carga de imágenes con `cached_network_image`:
    - [x] Configurar placeholders animados durante la carga.
    - [x] Implementar manejo adecuado de errores de carga.
  - [ ] Aplicar compresión y caching para mejorar tiempo de carga inicial.

- [ ] **Añadir Funcionalidades de Valor**
  - [ ] Mejorar sistema de búsqueda:
    - [ ] Añadir filtros rápidos (Abierto ahora, Promociones, Disponibilidad).
    - [ ] Implementar historial de búsquedas recientes.
    - [ ] Desarrollar autocompletado de nombres de barberías.
  - [ ] Crear sección "Para ti" con recomendaciones personalizadas:
    - [ ] Basadas en visitas anteriores.
    - [ ] Por preferencias de estilo.
    - [ ] Según ubicación actual.

- [x] **Mejorar la Estructura del Código** ✅ COMPLETADO
  - [x] Modularizar la página Home en componentes reutilizables:
    - [x] Crear `SectionTitleWidget` para títulos de sección reutilizables.
    - [x] Crear `SearchEmptyState` para estado vacío de búsqueda.
    - [x] Crear `HomeTabBar` para encapsular el TabBar personalizado.
    - [x] Crear `HomeTabContent` para el contenido de cada pestaña.
  - [x] Extraer lógica de navegación a `HomeNavigationController`.
  - [x] Refactorizar `HomeCubit` para manejar estados relacionados de manera más cohesiva.
  - [x] Corregir advertencias y deprecaciones detectadas por el analizador:
    - [x] Reemplazar `withOpacity` por `withAlpha` para evitar pérdida de precisión.
    - [x] Actualizar APIs deprecadas como `MaterialStateProperty` a `WidgetStateProperty`.
    - [x] Eliminar imports innecesarios para mantener el código limpio.
  - [x] **Sistema Unificado Aplicado:**
    - [x] Reemplazar `SizedBox` hardcodeados por `AppSpacers` en `HomePage`
    - [x] Usar `AppSpacers.sliverMd`, `AppSpacers.sliverLg`, `AppSpacers.sliverXl` en `HomeTabContent`
    - [x] Aplicar constantes de `AppDesignConstants` para consistencia visual
  - [ ] Aplicar técnicas de memoización para evitar reconstrucciones innecesarias de widgets.
  - [ ] Implementar `const constructors` donde sea apropiado para mejorar rendimiento.

- [x] **Navegación más Intuitiva**
  - [ ] Implementar menú contextual en tarjetas de barbería (con opciones al mantener presionado).
  - [ ] Crear transiciones de página personalizadas usando `Hero` animations.
  - [x] Añadir gestos de navegación intuitivos como deslizamiento lateral entre pestañas.
  - [x] Optimizar la interacción entre la barra de navegación inferior y el contenido principal.

- [x] **Sistema de Loading Unificado** ✅ COMPLETADO RECIENTEMENTE
  - [x] Implementar `LoadingIndicatorWidget` centralizado:
    - [x] Diseño personalizado con colores blanco + turquesa
    - [x] Tamaños predefinidos: `small`, `medium`, `large`
    - [x] Animación suave con `CircularProgressIndicator` superpuestos
    - [x] Opción de fondo opcional
  - [x] Reemplazar todos los `CircularProgressIndicator` en la app:
    - [x] `HomePage` - Spinner centrado sin caja contenedora
    - [x] `HomeSalonCard` - Spinner pequeño para carga de imágenes
    - [x] `ProfilePage`, `RegisterPage`, `SubmitButton`, `ThemedButton`, `EnhancedButton`
  - [x] Eliminar loading cards redundantes:
    - [x] "Cargando las mejores barberías para ti..."
    - [x] "Preparando tu experiencia personalizada..."
  - [x] Corregir layout issues en `HomeSalonCard`:
    - [x] Reemplazar `Spacer()` problemático con `SizedBox(height: 8)`
    - [x] Resolver error de constraints de RenderFlex

- [ ] **Finalización y Pruebas**
  - [ ] Verificar la correcta visualización y responsividad en diferentes tamaños de pantalla.
  - [ ] Medir y comparar rendimiento antes y después de las optimizaciones.
  - [ ] Realizar pruebas de usuario para validar mejoras en la experiencia de navegación.
  - [ ] Documentar todos los cambios y patrones nuevos implementados.

---

## 🎯 **Próxima Fase: Rediseño Completo con Sistema Centralizado**

**Nueva Tarea Creada:** `TASK_rediseno_home_sistema_centralizado.md`

### 🎨 **Objetivos del Rediseño**
- **0% hardcoding** en HomePage
- **100% uso** del sistema centralizado
- **Consistencia visual** total con design system
- **Rendimiento optimizado** y código limpio

### 📋 **Componentes a Rediseñar**
- `HomeHeader` - Implementar `AppContainers.glass()` y `AppSpacers`
- `HomeSalonCard` - Usar `AppContainers.card()` y sistema de colores centralizado
- `HomeTabBar` - Aplicar `AppDesignConstants` y transiciones consistentes
- `HomeTabContent` - Verificar uso completo de `AppSpacers.sliver*`

---

### Referencias a la Documentación

- La estructura de las optimizaciones debe seguir los patrones de `ARCHITECTURE.md`.
- Todos los componentes visuales nuevos o modificados deben usar estilos de `DESIGN_SYSTEM.md`.
- Las mejoras de rendimiento deben seguir las recomendaciones en `DEVELOPMENT_GUIDE.md`.
- Las animaciones y transiciones deben ser coherentes con la identidad visual definida en `VISUAL_GUIDELINES.md`.
- **NUEVO:** El rediseño debe seguir completamente el sistema centralizado documentado en `TASK_sistema_unificado_constantes.md`.
