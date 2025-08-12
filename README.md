# 🏥 Admin Clínica Frontend

## 📱 Aplicación Móvil y Desktop para Gestión Clínica

Una aplicación Flutter completa para la administración de clínicas médicas, desarrollada con arquitectura limpia y patrones de diseño modernos. La aplicación permite gestionar citas, doctores, pacientes, asistentes y ubicaciones .


## 🏗️ Arquitectura del Proyecto

### **Patrón de Arquitectura Limpia (Clean Architecture)**
```
lib/
├── app/
│   ├── common/           # Lógica de negocio compartida
│   │   ├── blocs/       # Gestión de estado con BLoC
│   │   ├── cubits/      # Cubits para estado simple
│   │   ├── models/      # Modelos de datos
│   │   ├── repository/  # Capa de repositorios
│   │   └── service/     # Servicios de API
│   ├── config/          # Configuración de la aplicación
│   ├── data/            # Capa de datos
│   └── modules/         # Módulos de la aplicación
```

### **Patrones de Diseño Implementados**
- **Repository Pattern**: Abstracción de acceso a datos
- **BLoC Pattern**: Gestión de estado reactiva
- **Dependency Injection**: Inyección de dependencias con GetIt
- **Service Layer**: Capa de servicios para lógica de negocio

## 🛠️ Tecnologías y Dependencias

### **Framework Principal**
- **Flutter 3.3.1+** - Framework de desarrollo multiplataforma
- **Dart** - Lenguaje de programación

### **Gestión de Estado**
- **flutter_bloc** - Implementación del patrón BLoC
- **bloc** - Biblioteca base para BLoC

### **Inyección de Dependencias**
- **get_it** - Service locator para DI
- **flutter_secure_storage** - Almacenamiento seguro

### **Networking y APIs**
- **dio** - Cliente HTTP con interceptores
- **talker_dio_logger** - Logging de requests/responses

### **Persistencia de Datos**
- **shared_preferences** - Almacenamiento local
- **flutter_secure_storage** - Almacenamiento encriptado

### **UI y Componentes**
- **flutter_animate** - Animaciones fluidas
- **flutter_svg** - Soporte para SVG
- **carousel_slider** - Carruseles interactivos
- **table_calendar** - Calendarios avanzados

### **Integración Externa**
- **firebase_messaging** - Notificaciones push
- **firebase_crashlytics** - Reportes de errores
- **excel** - Exportación a Excel

## 🚀 Funcionalidades Técnicas

### **Multiplataforma**
- ✅ Android
- ✅ Windows


### **Gestión de Estado Avanzada**
- Cubits para estado simple (tema, contadores)
- BLoCs para estado complejo (citas, doctores)
- Gestión reactiva del estado de la aplicación

### **Inyección de Dependencias**
- Configuración centralizada con GetIt
- Registro lazy de servicios y repositorios
- Inyección condicional por plataforma

### **Interceptores HTTP**
- Interceptores personalizados para autenticación
- Logging automático de requests/responses
- Manejo de errores centralizado

### **Almacenamiento Adaptativo**
- Flutter Secure Storage para móviles
- SharedPreferences para desktop/web
- Repositorios abstractos para persistencia

## 📱 Módulos Principales

### **1. Módulo de Autenticación**
- Login seguro
- Gestión de sesiones
- Recuperación de contraseñas

### **2. Módulo de Citas**
- CRUD completo de citas
- Calendario interactivo
- Estados y flujos de trabajo

### **3. Módulo de Doctores**
- Gestión de perfiles médicos


### **4. Módulo de Ubicaciones**
- Gestión multi-sede
- Configuración por ubicación
- Recursos y horarios

### **5. Módulo de Monitoreo**
- Dashboard de métricas
- Análisis de datos

## 🔧 Configuración del Proyecto

### **Requisitos Previos**
- Flutter SDK 3.3.1+
- Dart SDK
- Android Studio / VS Code
- Git


### **Configuración de Entornos**
El proyecto soporta múltiples entornos:
- **Development**: Configuración de desarrollo
- **Staging**: Configuración de pruebas
- **Production**: Configuración de producción

## 🎯 Casos de Uso

### **Para Administradores de Clínica**
- Administración de personal médico
- Reportes y estadísticas
- Configuración multi-sede

### **Para Doctores**
- Vista de agenda personal
- Gestión de consultas
- Notificaciones de citas

### **Para Asistentes**
- Programación de citas
- Coordinación de horarios
- Soporte administrativo


## 🤝 Contribución
Este proyecto es parte de un portafolio personal.

## 📄 Licencia
Proyecto personal para demostración de habilidades técnicas.

---

## 👨‍💻 **Desarrollado por**

**Alexis Jampier Yalle Alarcon** - Desarrollador Flutter Full Stack

*Este proyecto demuestra competencias avanzadas en:*
- Arquitectura de software limpia
- Patrones de diseño modernos
- Desarrollo multiplataforma
- Gestión de estado compleja
- Integración de APIs y servicios externos
- Implementación de seguridad y autenticación
