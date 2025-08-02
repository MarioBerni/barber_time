# 🔔 Tarea: Sistema de Notificaciones

**Objetivo:** Implementar un sistema completo de notificaciones para la aplicación, incluyendo la funcionalidad del icono de notificaciones en el HomeHeader y la gestión de diferentes tipos de notificaciones.

**Prioridad:** Alta - Mejora significativa de la experiencia de usuario y engagement.

**Estado Actual:** 🔄 **LISTO PARA INICIAR** - Icono de notificaciones existe pero sin funcionalidad.

---

## 📋 **Análisis del Estado Actual**

### ✅ **Lo que ya existe:**
- ✅ Icono de notificaciones en `HomeHeader` (sin funcionalidad)
- ✅ `StyledIcon` con soporte para badges
- ✅ Sistema de diseño unificado
- ✅ Estructura de navegación establecida

### 🔧 **Lo que necesita implementación:**
- ❌ **Funcionalidad del icono de notificaciones**
- ❌ **Sistema de gestión de notificaciones**
- ❌ **Tipos de notificaciones** (ofertas, recordatorios, etc.)
- ❌ **Persistencia local** de notificaciones
- ❌ **Badge de contador** en el icono
- ❌ **Página de notificaciones** dedicada

---

## 🎯 **Funcionalidades a Implementar**

### 🎯 **1. Funcionalidad del Icono de Notificaciones**
- [ ] **Abrir página de notificaciones** al presionar el icono
- [ ] **Badge de contador** de notificaciones no leídas
- [ ] **Indicador visual** de notificaciones nuevas
- [ ] **Animación** al recibir nueva notificación
- [ ] **Feedback háptico** al presionar

### 🎯 **2. Tipos de Notificaciones**
- [ ] **Notificaciones de ofertas** (nuevas ofertas disponibles)
- [ ] **Recordatorios de citas** (citas próximas)
- [ ] **Notificaciones de barberías** (nuevos servicios, horarios)
- [ ] **Notificaciones del sistema** (actualizaciones, mantenimiento)
- [ ] **Notificaciones promocionales** (descuentos, eventos)

### 🎯 **3. Gestión de Notificaciones**
- [ ] **Marcar como leída** al presionar
- [ ] **Marcar todas como leídas**
- [ ] **Eliminar notificación** individual
- [ ] **Eliminar todas las notificaciones**
- [ ] **Filtros por tipo** de notificación

### 🎯 **4. Persistencia y Sincronización**
- [ ] **Guardar notificaciones** localmente
- [ ] **Contador persistente** de no leídas
- [ ] **Sincronización** con favoritos y ofertas
- [ ] **Backup** de notificaciones importantes

---

## 🏗️ **Arquitectura y Implementación**

### **Patrón de Implementación**
- **Clean Architecture:** Separación clara de capas
- **BLoC/Cubit:** Gestión de estado para notificaciones
- **Sistema Unificado:** Usar componentes centralizados
- **Persistencia Local:** Guardar notificaciones con SharedPreferences

### **Estructura de Feature**
```
lib/features/notifications/
├── data/
│   ├── datasources/
│   │   ├── notifications_local_datasource.dart
│   │   └── notifications_mock_datasource.dart
│   ├── models/
│   │   └── notification_model.dart
│   └── repositories/
│       └── notifications_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── notification.dart
│   ├── repositories/
│   │   └── notifications_repository.dart
│   └── usecases/
│       ├── get_notifications.dart
│       ├── mark_as_read.dart
│       ├── delete_notification.dart
│       └── get_unread_count.dart
└── presentation/
    ├── bloc/
    │   ├── notifications_cubit.dart
    │   └── notifications_state.dart
    ├── pages/
    │   └── notifications_page.dart
    └── widgets/
        ├── notification_item.dart
        ├── notification_badge.dart
        └── notifications_list.dart
```

### **Entidad de Notificación**
```dart
class Notification {
  final String id;
  final String title;
  final String message;
  final NotificationType type;
  final DateTime createdAt;
  final bool isRead;
  final Map<String, dynamic>? data;

  const Notification({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    required this.createdAt,
    this.isRead = false,
    this.data,
  });
}

enum NotificationType {
  offer,      // Ofertas especiales
  appointment, // Recordatorios de citas
  salon,      // Notificaciones de barberías
  system,     // Notificaciones del sistema
  promotional, // Promociones y eventos
}
```

---

## 📊 **Métricas de Éxito**

### **Funcionalidad**
- [ ] Icono de notificaciones funciona correctamente
- [ ] Badge muestra contador real de no leídas
- [ ] Notificaciones se marcan como leídas
- [ ] Persistencia funciona 100%
- [ ] Filtros por tipo funcionan

### **UX/UI**
- [ ] Animaciones suaves y responsivas
- [ ] Badge visible y legible
- [ ] Página de notificaciones intuitiva
- [ ] Consistencia con sistema de diseño
- [ ] Accesibilidad completa

### **Performance**
- [ ] Contador se actualiza en < 100ms
- [ ] Página de notificaciones carga en < 500ms
- [ ] Persistencia no afecta rendimiento
- [ ] Sin memory leaks

---

## 🎯 **Plan de Implementación**

### **Fase 1: Estructura Base (1 día)**
1. Crear estructura de feature notifications
2. Implementar entidades y modelos
3. Crear repository y datasource
4. Implementar casos de uso básicos

### **Fase 2: Gestión de Estado (1 día)**
1. Implementar NotificationsCubit
2. Crear NotificationsState
3. Integrar con sistema de inyección de dependencias
4. Testing de estado

### **Fase 3: UI y Funcionalidad (1 día)**
1. Crear NotificationsPage
2. Implementar NotificationItem
3. Crear NotificationBadge
4. Integrar con HomeHeader

### **Fase 4: Integración y Optimización (1 día)**
1. Integrar con sistema de ofertas
2. Implementar notificaciones automáticas
3. Optimizar performance
4. Testing completo

---

## 🔧 **Implementación Técnica**

### **Integración con HomeHeader**
```dart
// En home_header.dart
Widget _buildNotificationsIcon() {
  return BlocBuilder<NotificationsCubit, NotificationsState>(
    builder: (context, state) {
      final unreadCount = state.unreadCount;

      return StyledIcon(
        icon: Icons.notifications_outlined,
        showBadge: unreadCount > 0,
        badgeCount: unreadCount,
        onTap: () => _openNotificationsPage(),
      );
    },
  );
}

void _openNotificationsPage() {
  Navigator.pushNamed(context, '/notifications');
}
```

### **Notificación de Ofertas**
```dart
// En offers_cubit.dart
void _notifyNewOffer(Offer offer) {
  final notification = Notification(
    id: 'offer_${offer.id}',
    title: 'Nueva oferta disponible',
    message: '${offer.title} - ${offer.discount}% de descuento',
    type: NotificationType.offer,
    createdAt: DateTime.now(),
    data: {'offerId': offer.id},
  );

  context.read<NotificationsCubit>().addNotification(notification);
}
```

---

## 📚 **Referencias**

- **HomeHeader actual:** `lib/features/home/presentation/widgets/home_header.dart`
- **StyledIcon:** `lib/core/widgets/icons/styled_icon.dart`
- **Sistema de Diseño:** `docs/DESIGN_SYSTEM.md`
- **Arquitectura:** `docs/ARCHITECTURE.md`
- **Feature de Ofertas:** `tasks/TASK_ofertas_feature.md`

---

## 🎯 **Criterios de Completado**

### **Funcionalidad:**
- [ ] Icono de notificaciones abre página correctamente
- [ ] Badge muestra contador real de notificaciones no leídas
- [ ] Notificaciones se pueden marcar como leídas
- [ ] Notificaciones se pueden eliminar
- [ ] Filtros por tipo funcionan correctamente
- [ ] Persistencia local funciona 100%

### **UX/UI:**
- [ ] Animaciones son suaves y responsivas
- [ ] Badge es visible y legible
- [ ] Página de notificaciones es intuitiva
- [ ] Consistencia visual con sistema de diseño
- [ ] Accesibilidad completa implementada

### **Performance:**
- [ ] Contador se actualiza en < 100ms
- [ ] Página de notificaciones carga en < 500ms
- [ ] Persistencia no afecta rendimiento general
- [ ] No hay memory leaks detectados

### **Testing:**
- [ ] Notificaciones se crean correctamente
- [ ] Badge se actualiza al marcar como leída
- [ ] Persistencia funciona después de reiniciar app
- [ ] Filtros funcionan con diferentes tipos
- [ ] Integración con ofertas funciona

---

**Estado:** 🔄 **LISTO PARA INICIAR**
**Fecha de Creación:** 2025-01-27
**Tiempo Estimado:** 4 días
**Responsable:** Equipo de desarrollo
