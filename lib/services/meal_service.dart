import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/meal.dart';
import '../models/meal_detail.dart';

class MealService {
  static Future<List<Meal>> getMeals() async {
    try {
      final response = await http.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood',
      ));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final meals = data['meals'] as List<dynamic>;
        return meals.map((meal) => Meal.fromJson(meal)).toList();
      } else {
        throw Exception('Error al obtener los datos');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }

  // 👇 ESTA ES LA FUNCIÓN QUE FALTA
  static Future<MealDetail> getMealDetail(String id) async {
    try {
      final response = await http.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id',
      ));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final meals = data['meals'] as List<dynamic>;
        return MealDetail.fromJson(meals.first);
      } else {
        throw Exception('Error al obtener el detalle');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }
}
