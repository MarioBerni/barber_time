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

### 🔧 **Lo que necesita implementación:**
- ❌ **Filtros rápidos** - No hay filtros por rating, distancia, precio
- ❌ **Sección "Para Ti"** - No hay recomendaciones personalizadas
- ❌ **Filtros avanzados** - No hay filtros por servicios, horarios
- ❌ **Ordenamiento** - No hay opciones de ordenamiento

---

## 🎯 **Funcionalidades a Implementar**

### 🎯 **1. Filtros Rápidos**
- [ ] **Filtro por Rating** (4+ estrellas, 3+ estrellas, etc.)
- [ ] **Filtro por Distancia** (cercanos, media distancia, lejos)
- [ ] **Filtro por Precio** (económico, medio, premium)
- [ ] **Filtro por Servicios** (corte, barba, ambos)
- [ ] **Filtro por Horarios** (abierto ahora, 24h, etc.)

### 🎯 **2. Sección "Para Ti"**
- [ ] **Recomendaciones personalizadas** basadas en preferencias
- [ ] **Barberías populares** en la zona
- [ ] **Ofertas especiales** destacadas
- [ ] **Servicios trending** del momento
- [ ] **Nuevas barberías** agregadas recientemente

### 🎯 **3. Ordenamiento**
- [ ] **Por Rating** (mejor valorados primero)
- [ ] **Por Distancia** (más cercanos primero)
- [ ] **Por Precio** (económico a premium)
- [ ] **Por Popularidad** (más visitados)
- [ ] **Por Fecha** (más recientes)

### 🎯 **4. Interfaz de Usuario**
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

  const HomeLoaded({
    // ... parámetros existentes ...
    this.activeFilters = const [],
    this.currentSort = SortOption.rating,
    this.recommendedSalons = const [],
    this.showParaTiSection = true,
  });
}
```

### **Implementación de Filtros:**
```dart
// En home_cubit.dart
void applyFilter(FilterOption filter) {
  final currentState = state;
  if (currentState is! HomeLoaded) return;

  final newFilters = List<FilterOption>.from(currentState.activeFilters);

  if (newFilters.contains(filter)) {
    newFilters.remove(filter);
  } else {
    newFilters.add(filter);
  }

  final filteredSalons = _applyFilters(currentState.topRatedSalons, newFilters);

  emit(currentState.copyWith(
    activeFilters: newFilters,
    filteredSalons: filteredSalons,
  ));
}
```

---

## 📊 **Criterios de Completado**

### **Funcionalidad:**
- [ ] Filtros aplican correctamente a los salones
- [ ] Múltiples filtros se pueden combinar
- [ ] Ordenamiento funciona con filtros activos
- [ ] Sección "Para Ti" muestra recomendaciones relevantes

### **UX/UI:**
- [ ] Filtros son intuitivos y fáciles de usar
- [ ] Chips de filtros tienen estados visuales claros
- [ ] Sección "Para Ti" es atractiva y útil
- [ ] Transiciones son suaves y responsivas

### **Performance:**
- [ ] Filtrado responde en < 100ms
- [ ] No hay lag al aplicar múltiples filtros
- [ ] Recomendaciones se cargan eficientemente
- [ ] Memoria optimizada para filtros complejos

### **Testing:**
- [ ] Filtros funcionan con diferentes combinaciones
- [ ] Ordenamiento mantiene consistencia
- [ ] Sección "Para Ti" muestra contenido relevante
- [ ] Interfaz es intuitiva para usuarios

---

## 🎯 **Plan de Implementación**

### **Paso 1: Estructura de Filtros (45 min)**
1. Definir enums para filtros y ordenamiento
2. Agregar campos al estado HomeLoaded
3. Crear métodos de filtrado básico
4. Testing de estructura

### **Paso 2: Filtros Rápidos (60 min)**
1. Crear widget QuickFiltersSection
2. Implementar chips de filtros
3. Integrar con HomeCubit
4. Testing de funcionalidad

### **Paso 3: Ordenamiento (30 min)**
1. Crear widget SortSelector
2. Implementar lógica de ordenamiento
3. Integrar con filtros existentes
4. Testing de ordenamiento

### **Paso 4: Sección "Para Ti" (45 min)**
1. Crear widget ParaTiSection
2. Implementar algoritmo de recomendaciones
3. Diseñar cards destacadas
4. Testing de recomendaciones

### **Paso 5: Integración y Optimización (30 min)**
1. Integrar todos los componentes
2. Optimizar performance
3. Mejorar UX/UI
4. Testing final

---

## 📚 **Referencias**

- **HomeCubit actual:** `lib/features/home/presentation/bloc/home_cubit.dart`
- **HomePage actual:** `lib/features/home/presentation/pages/home_page.dart`
- **Sistema de Diseño:** `docs/DESIGN_SYSTEM.md`
- **Funcionalidades de Valor:** `tasks/TASK_funcionalidades_valor.md`

---

**Estado:** 🔄 **LISTO PARA INICIAR**
**Fecha de Inicio:** 2025-01-27
**Tiempo Estimado:** 3.5 horas
**Responsable:** Equipo de desarrollo
