import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/tab_widget.dart';
import '../lifecycle/lifecycle_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const mensaje = 'Hola desde HomeScreen!';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla Principal'),
      ),
      body: Center(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centra verticalmente
            crossAxisAlignment: CrossAxisAlignment.center, // Centra horizontalmente
            children: [
              ElevatedButton(
                onPressed: () {
                  context.push('/detail/$mensaje');
                },
                child: const Text('Ir a Detalle con mensaje'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const TabWidget()),
                  );
                },
                child: const Text('Ir a pestañas (TabWidget)'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LifecycleWidget()),
                  );
                },
                child: const Text('Ir a ciclo de vida (LifecycleWidget)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
