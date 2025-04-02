import 'package:flutter/material.dart';

class ListaEstudiantesPage extends StatefulWidget {
  const ListaEstudiantesPage({super.key});

  @override
  State<ListaEstudiantesPage> createState() => _ListaEstudiantesPageState();
}

class _ListaEstudiantesPageState extends State<ListaEstudiantesPage> {
  late Future<List<String>> _estudiantesFuture;

  Future<List<String>> _cargarEstudiantes() async {
    await Future.delayed(const Duration(seconds: 2));
    return ['Juan', 'María', 'Carlos', 'Luisa', 'Andrés'];
  }

  @override
  void initState() {
    super.initState();
    _estudiantesFuture = _cargarEstudiantes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Estudiantes')),
      body: FutureBuilder<List<String>>(
        future: _estudiantesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay estudiantes'));
          } else {
            final estudiantes = snapshot.data!;
            return ListView.builder(
              itemCount: estudiantes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(estudiantes[index]),
                );
              },
            );
          }
        },
      ),
    );
  }
}
