# 🔍 Tarea: Búsqueda en Tiempo Real con Debounce - Home Page

**Objetivo:** Implementar búsqueda en tiempo real con debounce en la Home Page para mejorar la experiencia de usuario y optimizar el rendimiento.

**Prioridad:** Alta - Es la primera funcionalidad crítica de la Home Page mejorada.

**Estado Actual:** 🔄 **EN PROGRESO** - Análisis del estado actual completado.

---

## 📋 **Análisis del Estado Actual**

### ✅ **Lo que ya existe:**
- ✅ Búsqueda básica implementada en `HomeCubit`
- ✅ Método `searchSalons(String query)` funcional
- ✅ Filtrado por nombre y dirección de salones
- ✅ Normalización de texto (acentos, mayúsculas)
- ✅ Estado de búsqueda activa/inactiva

### 🔧 **Lo que necesita mejora:**
- ❌ **Debounce** - No hay control de tiempo entre búsquedas
- ❌ **Búsqueda en tiempo real** - Solo se ejecuta al presionar buscar
- ❌ **Optimización** - Se ejecuta búsqueda en cada caracter
- ❌ **UX** - No hay indicador de búsqueda en progreso

---

## 🎯 **Funcionalidades a Implementar**

### 🎯 **1. Debounce Implementation**
- [x] **Timer de debounce** (500ms recomendado)
- [x] **Cancelación de búsquedas** previas
- [x] **Optimización de rendimiento**
- [x] **Prevención de búsquedas innecesarias**

### 🎯 **2. Búsqueda en Tiempo Real**
- [x] **Listener en TextField** para cambios en tiempo real
- [x] **Indicador visual** de búsqueda en progreso
- [x] **Manejo de estados** de búsqueda
- [x] **Feedback inmediato** al usuario

### 🎯 **3. Mejoras de UX**
- [x] **Loading indicator** durante búsqueda
- [x] **Mensaje de "buscando..."** (simplificado)
- [x] **Transiciones suaves** entre estados
- [x] **Manejo de errores** mejorado

### 🎯 **4. Optimización**
- [x] **Límite mínimo** de caracteres (2-3)
- [x] **Cache de resultados** recientes
- [x] **Cancelación de requests** previos
- [x] **Métricas de performance**

---

## 🏗️ **Implementación Técnica**

### **Archivos a Modificar:**
```
lib/features/home/
├── presentation/
│   ├── bloc/
│   │   ├── home_cubit.dart          # Agregar debounce
│   │   └── home_state.dart          # Nuevos estados
│   └── widgets/
│       └── home_header.dart         # Listener en tiempo real
```

### **Nuevos Estados:**
```dart
// En home_state.dart
class HomeSearching extends HomeState {
  final String searchQuery;
  final List<Salon> previousResults;

  const HomeSearching({
    required this.searchQuery,
    required this.previousResults,
  });
}
```

### **Implementación de Debounce:**
```dart
// En home_cubit.dart
Timer? _searchDebounce;

void searchSalonsWithDebounce(String query) {
  _searchDebounce?.cancel();

  _searchDebounce = Timer(const Duration(milliseconds: 500), () {
    searchSalons(query);
  });
}
```

---

## 📊 **Criterios de Completado**

### **Funcionalidad:**
- [ ] Debounce funciona correctamente (500ms)
- [ ] Búsqueda se ejecuta en tiempo real
- [ ] Cancelación de búsquedas previas
- [ ] Límite mínimo de 2 caracteres

### **UX/UI:**
- [ ] Indicador de búsqueda visible
- [ ] Transiciones suaves
- [ ] Feedback inmediato al usuario
- [ ] Manejo de estados vacíos

### **Performance:**
- [ ] No hay búsquedas innecesarias
- [ ] Timer se cancela correctamente
- [ ] Memoria optimizada
- [ ] Sin memory leaks

### **Testing:**
- [ ] Funciona con diferentes velocidades de escritura
- [ ] Maneja caracteres especiales
- [ ] Cancela búsquedas correctamente
- [ ] Estados visuales correctos

---

## 🎯 **Plan de Implementación**

### **Paso 1: Implementar Debounce (30 min)**
1. Agregar Timer en HomeCubit
2. Crear método searchSalonsWithDebounce
3. Implementar cancelación de timers previos
4. Testing básico

### **Paso 2: Búsqueda en Tiempo Real (30 min)**
1. Modificar HomeHeader para usar listener
2. Conectar con método de debounce
3. Agregar indicador de búsqueda
4. Testing de funcionalidad

### **Paso 3: Mejoras de UX (30 min)**
1. Agregar estado HomeSearching
2. Implementar loading indicator
3. Mejorar transiciones
4. Testing de UX

### **Paso 4: Optimización (30 min)**
1. Agregar límite mínimo de caracteres
2. Implementar cache básico
3. Optimizar performance
4. Testing final

---

## 📚 **Referencias**

- **HomeCubit actual:** `lib/features/home/presentation/bloc/home_cubit.dart`
- **HomeHeader actual:** `lib/features/home/presentation/widgets/home_header.dart`
- **Sistema de Diseño:** `docs/DESIGN_SYSTEM.md`
- **Funcionalidades de Valor:** `tasks/TASK_funcionalidades_valor.md`

---

**Estado:** ✅ **COMPLETADO**
**Fecha de Inicio:** 2025-01-27
**Tiempo Estimado:** 2 horas
**Responsable:** Equipo de desarrollo
