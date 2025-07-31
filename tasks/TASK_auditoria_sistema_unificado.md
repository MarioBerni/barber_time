# 🛠️ Tarea: Auditoría y Consolidación del Sistema Unificado

**Objetivo:** Realizar una auditoría exhaustiva de toda la base de código para identificar y eliminar cualquier uso restante de estilos o componentes "hardcodeados". El objetivo es alcanzar una adopción del 100% del sistema unificado (`AppDesignConstants`, `AppSpacers`, `AppContainers`), garantizando la máxima consistencia y mantenibilidad antes de desarrollar nuevas funcionalidades.

**Prioridad:** Crítica. Esta tarea debe completarse antes de iniciar cualquier nuevo desarrollo de features.

**Estado Actual:** ✅ **AUDITORÍA COMPLETADA** - 45+ archivos identificados para refactorización. **INICIANDO REFACTORIZACIÓN**.

---

### Checklist de Auditoría y Refactorización

- [x] **1. Auditoría de Espaciado (`SizedBox` y `Padding`)**
  - [x] Realizar una búsqueda global de `const SizedBox(`.
  - [x] Realizar una búsqueda global de `const Padding(`.
  - [x] Reemplazar todas las instancias encontradas con los componentes `AppSpacers` apropiados o, si es necesario, crear nuevos espaciadores en el sistema.
  - **Archivos Refactorizados:**
    - `lib/features/profile/presentation/widgets/tabs/components/profile_info_row.dart`
    - `lib/core/widgets/forms/form_section.dart`
    - `lib/core/widgets/inputs/enhanced_text_field.dart`
    - `lib/core/widgets/buttons/enhanced_button.dart`
    - `lib/core/widgets/navigation/app_top_bar.dart`
    - `lib/core/widgets/states/empty_state_widget.dart`
    - `lib/core/widgets/states/error_message_widget.dart`

- [x] **2. Auditoría de Contenedores (`Container` con `BoxDecoration`)**
  - [x] Realizar una búsqueda global de `Container(decoration: BoxDecoration`.
  - [x] **HALLAZGOS:** Se encontraron 45+ archivos con `decoration: BoxDecoration` que necesitan refactorización
  - [x] **ARCHIVOS PRIORITARIOS:**
    - `lib/features/profile/presentation/widgets/registration/` (8 archivos)
    - `lib/features/home/presentation/widgets/` (5 archivos)
    - `lib/core/widgets/` (20+ archivos)
  - [ ] **PENDIENTE:** Refactorizar todos los contenedores encontrados usando `AppContainers`
  - [ ] **PENDIENTE:** Crear nuevos constructores en `AppContainers` si es necesario

- [x] **3. Auditoría de Estilos de Texto (`TextStyle`)**
  - [x] Realizar una búsqueda global de `TextStyle(`.
  - [x] **HALLAZGOS:** Se encontraron 25+ archivos con `TextStyle` hardcodeados
  - [x] **ARCHIVOS PRIORITARIOS:**
    - `lib/features/home/presentation/widgets/home_tab_bar.dart`
    - `lib/features/home/presentation/widgets/section_title_widget.dart`
    - `lib/core/widgets/` (múltiples archivos)
  - [ ] **PENDIENTE:** Refactorizar todos los `TextStyle` hardcodeados usando `context.textTheme`
  - [ ] **PENDIENTE:** Verificar que `app_text_styles.dart` esté siendo usado correctamente

- [ ] **4. Auditoría de Colores (`Color(0x...)` y `Colors.`)**
  - [ ] Realizar una búsqueda global de `Color(0x` y `Colors.`.
  - [ ] Reemplazar todos los colores hardcodeados con los colores del tema (`context.color.primary`, `context.color.surface`, etc.).

- [x] **5. Auditoría de Radios de Borde (`BorderRadius.circular`)**
  - [x] Realizar una búsqueda global de `BorderRadius.circular(`.
  - [x] **HALLAZGOS:** Se encontraron 50+ archivos con `BorderRadius.circular` hardcodeados
  - [x] **ARCHIVOS PRIORITARIOS:**
    - `lib/features/profile/presentation/widgets/registration/` (múltiples valores: 8, 10, 12, 16, 18, 20, 24)
    - `lib/features/home/presentation/widgets/` (valores: 4, 6, 10, 12, 20)
    - `lib/core/widgets/` (múltiples archivos con valores variados)
  - [ ] **PENDIENTE:** Refactorizar todos los `BorderRadius.circular` usando `AppDesignConstants.borderRadiusMD/LG`
  - [ ] **PENDIENTE:** Crear constantes adicionales en `AppDesignConstants` si es necesario

- [ ] **6. Documentación de Nuevos Componentes**
  - [ ] Si durante la auditoría se crean nuevos componentes o variantes en el sistema unificado, documentarlos adecuadamente en `DESIGN_SYSTEM.md`.

- [ ] **7. Verificación Final**
  - [ ] Ejecutar `flutter analyze` para asegurar que no se hayan introducido nuevas advertencias.
  - [ ] Realizar una revisión visual de las páginas refactorizadas para confirmar que no haya cambios inesperados en la UI.
