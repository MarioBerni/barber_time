# 🎁 Tarea: Mover Ofertas Especiales a Página "Favoritos" → "Ofertas"

**Objetivo:** Migrar la sección de Ofertas Especiales desde la página Home a la página de Favoritos, renombrándola como "Ofertas" y mejorando su funcionalidad y diseño.

**Prioridad:** Alta - Mejora la organización del contenido y la experiencia de usuario.

**Estado Actual:** 🔄 **LISTO PARA INICIAR** - Ofertas ya removidas de Home, pendiente implementación en Favoritos.

---

## 📋 **Análisis del Estado Actual**

### ✅ **Lo que ya está completado:**
- ✅ Ofertas Especiales removidas de Home Page
- ✅ Home simplificado con 2 pestañas (Cerca de ti, Mejor valoradas)
- ✅ Componentes de ofertas existentes disponibles
- ✅ Sistema unificado implementado

### 🔧 **Lo que necesita implementación:**
- ❌ **Sección "Ofertas" en página de Favoritos**
- ❌ **Renombrar "Favoritos" a "Ofertas"**
- ❌ **Adaptar diseño** para nueva ubicación
- ❌ **Integrar con sistema** de favoritos existente

---

## 🎯 **Funcionalidades a Implementar**

### 🎯 **1. Renombrar Página de Favoritos**
- [ ] **Cambiar nombre** de "Favoritos" a "Ofertas"
- [ ] **Actualizar navegación** en bottom navigation
- [ ] **Actualizar iconos** y etiquetas
- [ ] **Mantener funcionalidad** de favoritos existente

### 🎯 **2. Sección de Ofertas en Página Ofertas**
- [ ] **Migrar componentes** de ofertas especiales
- [ ] **Adaptar diseño** para nueva ubicación
- [ ] **Integrar con sistema** de favoritos
- [ ] **Mejorar funcionalidad** de ofertas

### 🎯 **3. Funcionalidades Mejoradas**
- [ ] **Filtros por tipo** de oferta
- [ ] **Ordenamiento** por relevancia, fecha, descuento
- [ ] **Búsqueda** dentro de ofertas
- [ ] **Favoritos de ofertas** con persistencia

### 🎯 **4. Integración con Sistema**
- [ ] **Navegación** desde Home y otras páginas
- [ ] **Sincronización** con favoritos de barberías
- [ ] **Notificaciones** de nuevas ofertas
- [ ] **Compartir ofertas** en redes sociales

---

## 🏗️ **Arquitectura y Implementación**

### **Patrón de Implementación**
- **Clean Architecture:** Mantener separación de capas
- **BLoC/Cubit:** Extender gestión de estado existente
- **Sistema Unificado:** Usar componentes centralizados
- **Persistencia Local:** Integrar con favoritos existentes

### **Estructura de Modificaciones**
```
lib/features/profile/
├── presentation/
│   ├── pages/
│   │   └── profile_page.dart          # Renombrar pestaña
│   └── widgets/
│       ├── tabs/
│       │   ├── profile_favorites_tab.dart → profile_offers_tab.dart
│       │   └── offers_section.dart    # Nueva sección de ofertas
│       └── offers/
│           ├── offer_card.dart        # Migrar desde Home
│           ├── offers_filter.dart     # Nuevo widget
│           └── offers_list.dart       # Nuevo widget
```

### **Navegación Actualizada**
```dart
// En bottom_navigation_bar.dart
BottomNavigationBarItem(
  icon: Icon(Icons.favorite), // Cambiar a Icons.local_offer
  label: 'Ofertas', // Cambiar de 'Favoritos' a 'Ofertas'
  // ...
),
```

---

## 📊 **Métricas de Éxito**

### **Funcionalidad**
- [ ] Página renombrada correctamente
- [ ] Ofertas se muestran en nueva ubicación
- [ ] Filtros y ordenamiento funcionan
- [ ] Integración con favoritos funciona
- [ ] Navegación actualizada

### **UX/UI**
- [ ] Diseño consistente con sistema unificado
- [ ] Transiciones suaves entre secciones
- [ ] Interfaz intuitiva y fácil de usar
- [ ] Responsive en todos los dispositivos

### **Performance**
- [ ] Carga de ofertas en < 1 segundo
- [ ] Filtros aplican instantáneamente
- [ ] No hay lag en navegación
- [ ] Memoria optimizada

---

## 🎯 **Plan de Implementación**

### **Fase 1: Renombrar y Estructura (1 día)**
1. Renombrar página de "Favoritos" a "Ofertas"
2. Actualizar navegación y iconos
3. Crear estructura de widgets de ofertas
4. Migrar componentes existentes

### **Fase 2: Funcionalidades Básicas (1 día)**
1. Implementar sección de ofertas
2. Crear filtros por tipo de oferta
3. Implementar ordenamiento
4. Agregar búsqueda interna

### **Fase 3: Integración y Mejoras (1 día)**
1. Integrar con sistema de favoritos
2. Implementar notificaciones
3. Agregar funcionalidad de compartir
4. Optimizar performance

### **Fase 4: Testing y Pulido (1 día)**
1. Testing completo de funcionalidad
2. Verificar navegación
3. Optimizar UX/UI
4. Documentar cambios

---

## 🔧 **Implementación Técnica**

### **Renombrar Página**
```dart
// En profile_page.dart
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Mantener 4 pestañas
      child: Scaffold(
        appBar: AppBar(
          title: Text('Perfil'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Información'),
              Tab(text: 'Ofertas'), // Cambiar de 'Favoritos' a 'Ofertas'
              Tab(text: 'Historial'),
              Tab(text: 'Configuración'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ProfileInfoTab(),
            ProfileOffersTab(), // Renombrar widget
            ProfileHistoryTab(),
            ProfileSettingsTab(),
          ],
        ),
      ),
    );
  }
}
```

### **Sección de Ofertas**
```dart
// En profile_offers_tab.dart
class ProfileOffersTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersCubit, OffersState>(
      builder: (context, state) {
        if (state is OffersLoading) {
          return LoadingIndicatorWidget();
        }

        if (state is OffersLoaded) {
          return Column(
            children: [
              // Filtros de ofertas
              OffersFilter(
                activeFilters: state.activeFilters,
                onFiltersChanged: (filters) =>
                    context.read<OffersCubit>().applyFilters(filters),
              ),

              // Lista de ofertas
              Expanded(
                child: OffersList(
                  offers: state.offers,
                  onOfferTap: (offer) => _handleOfferTap(context, offer),
                ),
              ),
            ],
          );
        }

        return EmptyStateWidget(
          title: 'No hay ofertas disponibles',
          message: 'Las ofertas aparecerán aquí cuando estén disponibles',
        );
      },
    );
  }
}
```

---

## 📚 **Referencias**

- **ProfilePage actual:** `lib/features/profile/presentation/pages/profile_page.dart`
- **ProfileFavoritesTab actual:** `lib/features/profile/presentation/widgets/tabs/profile_favorites_tab.dart`
- **Sistema de Diseño:** `docs/DESIGN_SYSTEM.md`
- **Arquitectura:** `docs/ARCHITECTURE.md`
- **Feature de Ofertas:** `tasks/TASK_ofertas_feature.md`

---

## 🎯 **Criterios de Completado**

### **Funcionalidad:**
- [ ] Página renombrada de "Favoritos" a "Ofertas"
- [ ] Ofertas se muestran correctamente en nueva ubicación
- [ ] Filtros y ordenamiento funcionan
- [ ] Integración con favoritos funciona
- [ ] Navegación actualizada en toda la app

### **UX/UI:**
- [ ] Diseño consistente con sistema unificado
- [ ] Transiciones suaves entre secciones
- [ ] Interfaz intuitiva y fácil de usar
- [ ] Responsive en todos los dispositivos
- [ ] Accesibilidad completa

### **Performance:**
- [ ] Carga de ofertas en < 1 segundo
- [ ] Filtros aplican instantáneamente
- [ ] No hay lag en navegación
- [ ] Memoria optimizada
- [ ] Sin memory leaks

### **Testing:**
- [ ] Navegación funciona correctamente
- [ ] Ofertas se cargan y muestran
- [ ] Filtros funcionan con diferentes combinaciones
- [ ] Integración con favoritos funciona
- [ ] Performance es aceptable

---

## 🔄 **Impacto en Otros Componentes**

### **Componentes a Actualizar:**
- `BottomNavigationBar` - Cambiar etiqueta e icono
- `ProfilePage` - Renombrar pestaña
- `ProfileFavoritesTab` → `ProfileOffersTab`
- Navegación en otras páginas

### **Componentes a Migrar:**
- `SpecialOffersSection` → `OffersSection`
- `HomeSpecialOfferCard` → `OfferCard`
- Lógica de ofertas desde Home

---

**Estado:** 🔄 **LISTO PARA INICIAR**
**Fecha de Creación:** 2025-01-27
**Tiempo Estimado:** 4 días
**Responsable:** Equipo de desarrollo
