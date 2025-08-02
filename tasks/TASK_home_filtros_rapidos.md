# 🎯 Tarea: Filtros Rápidos y Sección "Para Ti" - Home Page

**Objetivo:** Implementar filtros rápidos de búsqueda y una sección "Para Ti" con recomendaciones personalizadas para mejorar la experiencia de descubrimiento en la Home Page.

**Prioridad:** Alta - Complementa el sistema de búsqueda simplificado ya implementado.

**Estado Actual:** 🔄 **LISTO PARA INICIAR** - Sistema de búsqueda y autocompletado completado.

---

## 📋 **Análisis del Estado Actual**

### ✅ **Lo que ya existe:**
- ✅ Búsqueda en tiempo real con debounce implementada
- ✅ Autocompletado con chips unificados
- ✅ Sistema de pestañas (Cercanos, Mejor Valorados)
- ✅ Filtrado básico por nombre y ubicación
- ✅ Sistema simplificado sin historial complejo
- ✅ **Icono de filtros** en HomeHeader (sin funcionalidad)

### 🔧 **Lo que necesita implementación:**
- ❌ **Funcionalidad del icono de filtros** - Actualmente no tiene funcionalidad
- ❌ **Filtros rápidos** - No hay filtros por rating, distancia, precio
- ❌ **Sección "Para Ti"** - No hay recomendaciones personalizadas
- ❌ **Filtros avanzados** - No hay filtros por servicios, horarios
- ❌ **Ordenamiento** - No hay opciones de ordenamiento

---

## 🎯 **Funcionalidades a Implementar**

### 🎯 **1. Funcionalidad del Icono de Filtros** ⭐ **NUEVO**
- [ ] **Modal de filtros** al presionar el icono de filtros
- [ ] **Filtros rápidos** en modal (Rating, Distancia, Precio, Servicios)
- [ ] **Filtros avanzados** (Horarios, Ubicación, Especialidades)
- [ ] **Aplicar filtros** con botón de confirmación
- [ ] **Limpiar filtros** con botón de reset
- [ ] **Indicador visual** de filtros activos en el icono
- [ ] **Persistencia** de filtros seleccionados

### 🎯 **2. Filtros Rápidos**
- [ ] **Filtro por Rating** (4+ estrellas, 3+ estrellas, etc.)
- [ ] **Filtro por Distancia** (cercanos, media distancia, lejos)
- [ ] **Filtro por Precio** (económico, medio, premium)
- [ ] **Filtro por Servicios** (corte, barba, ambos)
- [ ] **Filtro por Horarios** (abierto ahora, 24h, etc.)

### 🎯 **3. Sección "Para Ti"**
- [ ] **Recomendaciones personalizadas** basadas en preferencias
- [ ] **Barberías populares** en la zona
- [ ] **Ofertas especiales** destacadas
- [ ] **Servicios trending** del momento
- [ ] **Nuevas barberías** agregadas recientemente

### 🎯 **4. Ordenamiento**
- [ ] **Por Rating** (mejor valorados primero)
- [ ] **Por Distancia** (más cercanos primero)
- [ ] **Por Precio** (económico a premium)
- [ ] **Por Popularidad** (más visitados)
- [ ] **Por Fecha** (más recientes)

### 🎯 **5. Interfaz de Usuario**
- [ ] **Modal de filtros** elegante y funcional
- [ ] **Chips de filtros** elegantes y táctiles
- [ ] **Selector de ordenamiento** dropdown
- [ ] **Sección "Para Ti"** con cards destacadas
- [ ] **Animaciones suaves** para transiciones
- [ ] **Accesibilidad** completa

---

## 🏗️ **Implementación Técnica**

### **Archivos a Modificar:**
```
lib/features/home/
├── presentation/
│   ├── bloc/
│   │   ├── home_cubit.dart          # Agregar métodos de filtrado
│   │   └── home_state.dart          # Nuevos estados
│   └── widgets/
│       ├── home_page.dart           # Integrar filtros
│       ├── home_header.dart         # Funcionalidad del icono de filtros
│       ├── filters_modal.dart       # Nuevo widget - Modal de filtros
│       ├── quick_filters_section.dart # Nuevo widget
│       ├── para_ti_section.dart     # Nuevo widget
│       └── sort_selector.dart       # Nuevo widget
```

### **Nuevos Estados:**
```dart
// En home_state.dart
class HomeLoaded extends HomeState {
  // ... campos existentes ...
  final List<FilterOption> activeFilters;
  final SortOption currentSort;
  final List<Salon> recommendedSalons;
  final bool showParaTiSection;
  final bool hasActiveFilters; // Para indicador visual

  const HomeLoaded({
    // ... parámetros existentes ...
    this.activeFilters = const [],
    this.currentSort = SortOption.rating,
    this.recommendedSalons = const [],
    this.showParaTiSection = true,
    this.hasActiveFilters = false,
  });
}
```

### **Implementación del Modal de Filtros:**
```dart
// En home_header.dart
void _showFiltersModal() {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => FiltersModal(
      activeFilters: cubit.state.activeFilters,
      onFiltersChanged: (filters) => cubit.applyFilters(filters),
      onClearFilters: () => cubit.clearFilters(),
    ),
  );
}
```

### **Implementación de Filtros:**
```dart
// En home_cubit.dart
void applyFilters(List<FilterOption> filters) {
  final currentState = state;
  if (currentState is! HomeLoaded) return;

  final filteredSalons = _applyFilters(currentState.topRatedSalons, filters);

  emit(currentState.copyWith(
    activeFilters: filters,
    filteredSalons: filteredSalons,
    hasActiveFilters: filters.isNotEmpty,
  ));
}

void clearFilters() {
  final currentState = state;
  if (currentState is! HomeLoaded) return;

  emit(currentState.copyWith(
    activeFilters: [],
    filteredSalons: currentState.topRatedSalons,
    hasActiveFilters: false,
  ));
}
```

---

## 📊 **Criterios de Completado**

### **Funcionalidad:**
- [ ] Icono de filtros abre modal funcional
- [ ] Filtros aplican correctamente a los salones
- [ ] Múltiples filtros se pueden combinar
- [ ] Ordenamiento funciona con filtros activos
- [ ] Sección "Para Ti" muestra recomendaciones relevantes
- [ ] Indicador visual de filtros activos funciona

### **UX/UI:**
- [ ] Modal de filtros es intuitivo y fácil de usar
- [ ] Filtros son intuitivos y fáciles de usar
- [ ] Chips de filtros tienen estados visuales claros
- [ ] Sección "Para Ti" es atractiva y útil
- [ ] Transiciones son suaves y responsivas

### **Performance:**
- [ ] Modal se abre en < 200ms
- [ ] Filtrado responde en < 100ms
- [ ] No hay lag al aplicar múltiples filtros
- [ ] Recomendaciones se cargan eficientemente
- [ ] Memoria optimizada para filtros complejos

### **Testing:**
- [ ] Modal de filtros funciona correctamente
- [ ] Filtros funcionan con diferentes combinaciones
- [ ] Ordenamiento mantiene consistencia
- [ ] Sección "Para Ti" muestra contenido relevante
- [ ] Interfaz es intuitiva para usuarios

---

## 🎯 **Plan de Implementación**

### **Paso 1: Modal de Filtros (60 min)**
1. Crear widget FiltersModal
2. Implementar funcionalidad del icono de filtros
3. Diseñar interfaz del modal
4. Testing de modal

### **Paso 2: Estructura de Filtros (45 min)**
1. Definir enums para filtros y ordenamiento
2. Agregar campos al estado HomeLoaded
3. Crear métodos de filtrado básico
4. Testing de estructura

### **Paso 3: Filtros Rápidos (60 min)**
1. Crear widget QuickFiltersSection
2. Implementar chips de filtros
3. Integrar con HomeCubit
4. Testing de funcionalidad

### **Paso 4: Ordenamiento (30 min)**
1. Crear widget SortSelector
2. Implementar lógica de ordenamiento
3. Integrar con filtros existentes
4. Testing de ordenamiento

### **Paso 5: Sección "Para Ti" (45 min)**
1. Crear widget ParaTiSection
2. Implementar algoritmo de recomendaciones
3. Diseñar cards destacadas
4. Testing de recomendaciones

### **Paso 6: Integración y Optimización (30 min)**
1. Integrar todos los componentes
2. Optimizar performance
3. Mejorar UX/UI
4. Testing final

---

## 📚 **Referencias**

- **HomeCubit actual:** `lib/features/home/presentation/bloc/home_cubit.dart`
- **HomePage actual:** `lib/features/home/presentation/pages/home_page.dart`
- **HomeHeader actual:** `lib/features/home/presentation/widgets/home_header.dart`
- **Sistema de Diseño:** `docs/DESIGN_SYSTEM.md`
- **Funcionalidades de Valor:** `tasks/TASK_funcionalidades_valor.md`

---

**Estado:** 🔄 **LISTO PARA INICIAR**
**Fecha de Inicio:** 2025-01-27
**Tiempo Estimado:** 4 horas
**Responsable:** Equipo de desarrollo
