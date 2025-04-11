import 'package:flutter/material.dart';

class StudentListView extends StatelessWidget {
  const StudentListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Listado de Estudiantes')),
      body: const Center(child: Text('Aquí va el listado de estudiantes...')),
    );
  }
}
