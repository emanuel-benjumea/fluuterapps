import 'package:flutter/material.dart';
import 'services/meal_service.dart';
import 'models/meal_detail.dart';
import 'package:go_router/go_router.dart'; // Para usar context.pop()

class DetallePage extends StatelessWidget {
  final String id;

  const DetallePage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de la Receta'),
        automaticallyImplyLeading: true,
        leading: Navigator.canPop(context) ? const BackButton() : null,
      ),

      body: FutureBuilder<MealDetail>(
        future: MealService.getMealDetail(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar el detalle'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No se encontró la receta'));
          }

          final meal = snapshot.data!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal.name,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Image.network(meal.thumb),
                const SizedBox(height: 16),
                Text(
                  'Instrucciones:',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(meal.instructions),
                const SizedBox(height: 24),
                // 🔙 Botón adicional de regreso (opcional)
                Center(
                        child:ElevatedButton(
                          onPressed: () {
                            if (context.canPop()) {
                              context.pop(); // retrocede
                            } else {
                              context.go('/'); // regresa a listado por si no hay historial
                            }
                          },
                          child: const Text('Volver al listado'),
                        ),

                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
