# 🍽 Taller 3 - Flutter + The Meal DB API

Este proyecto es el resultado del Taller 3 de Flutter, donde se construyó una aplicación que consume la API [TheMealDB](https://www.themealdb.com/api.php) para mostrar un listado de recetas y los detalles de cada una.

---

## 🛠 Tecnologías usadas

- Flutter
- Dart
- Go Router
- HTTP package

---

## 📲 Características

### 1. Pantalla principal - Listado
- Realiza petición HTTP GET a la API.
- Muestra un listado de recetas usando `ListView.builder`.
- Incluye nombre e imagen de cada receta.
- Maneja estados de carga, error o lista vacía.

### 2. Pantalla de Detalle
- Navega desde la lista usando `context.push()`.
- Recupera el `id` desde los parámetros de ruta.
- Muestra información detallada: nombre, imagen, instrucciones.
- Incluye navegación de regreso usando `context.pop()` o botón ←.

### 3. Manejo de estado
- `FutureBuilder` para gestionar:
  - Estado de carga (spinner).
  - Estado de éxito (datos).
  - Estado de error (mensajes).

---

## 📁 Estructura del proyecto

```
lib/
├── main.dart
├── listado_page.dart
├── detalle_page.dart
├── models/
│   ├── meal.dart
│   └── meal_detail.dart
├── services/
    └── meal_service.dart
```

---

## 🚀 Instrucciones para correr el proyecto

1. Clona el repositorio:
   ```bash
   git clone https://github.com/tu_usuario/taller3_mealdb_flutter.git
   ```
2. Entra a la carpeta del proyecto:
   ```bash
   cd taller3_mealdb_flutter
   ```
3. Instala las dependencias:
   ```bash
   flutter pub get
   ```
4. Ejecuta la app:
   ```bash
   flutter run
   ```

---

## 🌱 GitFlow sugerido

```bash
git checkout -b feature/api-connection
git commit -am "Listado y detalle con API"
git checkout dev
git merge feature/api-connection
git push origin dev
```

---

## 📸 Capturas (opcional)
_Agrega capturas de pantalla de la app funcionando._

---

## 📌 Créditos
Este proyecto fue desarrollado como parte del Taller 3 para la materia de desarrollo con Flutter. Utiliza la API gratuita de [TheMealDB](https://www.themealdb.com/api.php).