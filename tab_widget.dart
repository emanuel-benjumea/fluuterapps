import 'package:flutter/material.dart';
import 'grid_widget.dart';

class TabWidget extends StatelessWidget {
  const TabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Número de pestañas
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ejemplo TabBar'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.grid_view), text: 'Grid'),
              Tab(icon: Icon(Icons.info), text: 'Info'),
              Tab(icon: Icon(Icons.star), text: 'Extra'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            // Primera pestaña con GridView
            GridWidget(),

            // Segunda pestaña: contenido de texto
            Center(
              child: Text(
                'Esta es la pestaña de información.',
                style: TextStyle(fontSize: 18),
              ),
            ),

            // Tercera pestaña: contenido adicional
            Center(
              child: Text(
                'Contenido personalizado en la pestaña extra.',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
