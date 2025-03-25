# 🚀 Taller Flutter: Navegación, Widgets y Ciclo de Vida

## 📱 Descripción

Esta aplicación Flutter fue desarrollada como parte del **taller de navegación, widgets personalizados y ciclo de vida** en Flutter.

El proyecto implementa:

- ✅ Navegación entre pantallas con paso de parámetros usando `go_router`.
- ✅ Widgets personalizados: `GridView`, `TabBar`, y un widget con ciclo de vida (`StatefulWidget`).
- ✅ Evidencia del ciclo de vida de un `StatefulWidget` a través de impresiones en consola (`print()`).
- ✅ Diseño limpio y modular usando una estructura de carpetas organizada.

## 🖥️ Vistas de la aplicación

Estas son las pantallas (vistas) principales implementadas en la app:

- **`home_screen.dart`**  
  Pantalla inicial con botones que navegan a otras vistas.


![homreScreen](https://github.com/user-attachments/assets/d7dcea08-3be0-41fa-8a76-36bcf36a1739)

  
- **`detail_screen.dart`**  
  Muestra un parámetro recibido desde la pantalla principal mediante `go_router`.
  
![detail_screen](https://github.com/user-attachments/assets/a01ef00e-35d2-4091-b919-b26ad1e24f9f)

- **`tab_widget.dart`**  
  Implementa una vista con `TabBar` y `TabBarView` que contiene 3 secciones.
  
![tab_widget](https://github.com/user-attachments/assets/7d89b43b-48bc-4c84-8fdd-011b97fce20e)

- **`lifecycle_widget.dart`**  
  Vista basada en `StatefulWidget` que evidencia el ciclo de vida del widget usando `print()` en consola.
  
![lifecycle_widget](https://github.com/user-attachments/assets/adb0b829-f262-4928-82f3-e928640d1f8d)

---

## 🧭 Navegación y paso de parámetros

- Se usa la librería `go_router` para gestionar las rutas.
- Desde `HomeScreen`, se navega a `DetailScreen` con un mensaje como parámetro.
- `DetailScreen` muestra el parámetro recibido en pantalla.
- Se utiliza `context.push(...)` para mantener el historial de navegación y permitir regresar con la flecha en el AppBar.

---

## 🧱 Widgets personalizados

### 1. **GridWidget (GridView)**
- Muestra una lista de elementos en forma de cuadrícula.
- Implementado con `GridView.builder()`.

### 2. **TabWidget (TabBar + TabBarView)**
- Incluye 3 pestañas:
  - GridView
  - Información textual
  - Contenido adicional

### 3. **LifecycleWidget (StatefulWidget)**
- Contador interactivo con botón.
- Imprime en consola:
  - `initState()`
  - `didChangeDependencies()`
  - `build()`
  - `setState()`
  - `dispose()`

---

## 🔁 Ciclo de Vida del StatefulWidget

En `lifecycle_widget.dart`, se usa un `StatefulWidget` para imprimir en consola el ciclo de vida del widget:

```dart
print('[Lifecycle] initState: ...');
print('[Lifecycle] didChangeDependencies: ...');
print('[Lifecycle] build: ...');
print('[Lifecycle] setState: ...');
print('[Lifecycle] dispose: ...');

```
## ▶️ Ejecución rápida

```bash
flutter pub get
flutter run
```
