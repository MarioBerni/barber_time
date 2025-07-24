# 🎨 Tarea: Sistema de Diseño y UI

**Objetivo:** Crear y aplicar un sistema de diseño visual coherente y de alta calidad para toda la aplicación, incluyendo temas, componentes reutilizables y efectos visuales.

**Prioridad:** La finalización de los componentes base (colores, botones, contenedores) es crucial para desbloquear el desarrollo de las pantallas principales. Las animaciones y componentes complejos se pueden abordar de forma iterativa.

---

### Checklist

- [x] **Parte 1: Sistema de Tema Centralizado**
  - [x] Eliminar tema oscuro y simplificar `AppTheme` a un único tema claro.
  - [x] Consolidar y refinar la paleta de colores en `app_theme.dart`.
  - [x] Crear clases de abstracción de estilos (`AppTextStyles`, `AppSpacing`, `AppBorderRadius`).
  - [x] Implementar extensiones de `BuildContext` para un acceso fácil y consistente a los estilos (`context.primaryColor`, `context.textTheme.h1`, etc.).
  - [x] Migrar componentes iniciales para usar las nuevas extensiones del tema.

- [x] **Parte 2: Componentes de Fondo**
  - [x] Crear `AnimatedGradientBackground` con burbujas y patrones de líneas.
  - [x] Crear `PatternBackground` con patrones de barbería vintage (rayas, tijeras, etc.).
  - [x] Crear `GradientOverlayBackground` para superponer degradados y efectos de iluminación.

- [ ] **Parte 3: Componentes de UI Reutilizables**
  - [x] Crear `StylizedButton` con variantes (principal, secundario, terciario) y efectos.
  - [x] Crear `GlamContainer` con efecto de *glassmorphism* y bordes personalizables.
  - [ ] Desarrollar campos de texto (`ThemedTextField`) con validación visual y animaciones.

- [ ] **Parte 4: Efectos y Animaciones**
  - [ ] Implementar micro-animaciones de entrada/salida para widgets.
  - [ ] Crear una pantalla de bienvenida (`SplashPage`) con animación del logo.

- [x] **Parte 5: Aplicación en Pantallas**
  - [x] Aplicar los nuevos componentes de fondo y UI a la `LoginPage`.
  - [x] Aplicar los nuevos componentes de fondo y UI a la `HomePage`.

---

### Referencias a la Documentación

- Todos los principios y reglas aquí aplicados están definidos en el documento maestro **`DESIGN_SYSTEM.md`**.
- La implementación debe seguir las convenciones de nombrado y estructura de **`DEVELOPMENT_GUIDE.md`**.
