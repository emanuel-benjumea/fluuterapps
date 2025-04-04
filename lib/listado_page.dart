import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'models/meal.dart';
import 'services/meal_service.dart';

class ListadoPage extends StatelessWidget {
  const ListadoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Listado de Recetas')),
      body: FutureBuilder<List<Meal>>(
        future: MealService.getMeals(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar los datos'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay recetas disponibles'));
          }

          final meals = snapshot.data!;
          return ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) {
              final meal = meals[index];
              return Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: Image.network(
                    meal.thumb,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                  title: Text(meal.name),
                onTap: () => context.push('/detalle/${meal.id}'),

                ),
              );
            },
          );
        },
      ),
    );
  }
}
