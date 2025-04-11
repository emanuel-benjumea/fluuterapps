import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'auth_service.dart';
import 'establishment_form_view.dart';

class EstablishmentListView extends StatefulWidget {
  const EstablishmentListView({super.key});

  @override
  State<EstablishmentListView> createState() => _EstablishmentListViewState();
}

class _EstablishmentListViewState extends State<EstablishmentListView> {
  List<dynamic> establishments = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadEstablishments();
  }

  Future<void> loadEstablishments() async {
    final token = await AuthService.getToken();
    final response = await http.get(
      Uri.parse('http://192.168.0.14:8000/api/establecimientos'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        establishments = jsonDecode(response.body);
        isLoading = false;
      });
    } else {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al cargar establecimientos')),
      );
    }
  }

  Future<void> deleteEstablishment(int id) async {
    final token = await AuthService.getToken();
    final response = await http.delete(
      Uri.parse('http://192.168.0.14:8000/api/establecimientos/$id'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      loadEstablishments();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al eliminar establecimiento')),
      );
    }
  }

  void goToForm({Map<String, dynamic>? establishment}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EstablishmentFormView(establishment: establishment),
      ),
    );
    if (result == true) {
      loadEstablishments();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Establecimientos')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: establishments.length,
              itemBuilder: (_, index) {
                final e = establishments[index];
                return Card(
                  child: ListTile(
                    leading: e['imagen'] != null
                        ? Image.network(
                            'http://192.168.0.14:8000/storage/${e['imagen']}',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )
                        : const Icon(Icons.store),
                    title: Text(e['nombre']),
                    subtitle: Text(e['direccion']),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => deleteEstablishment(e['id']),
                    ),
                    onTap: () => goToForm(establishment: e),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => goToForm(),
        child: const Icon(Icons.add),
        tooltip: 'Crear establecimiento',
      ),
    );
  }
}
