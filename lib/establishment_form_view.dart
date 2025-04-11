import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_service.dart';

class EstablishmentFormView extends StatefulWidget {
  final Map<String, dynamic>? establishment;

  const EstablishmentFormView({super.key, this.establishment});

  @override
  State<EstablishmentFormView> createState() => _EstablishmentFormViewState();
}

class _EstablishmentFormViewState extends State<EstablishmentFormView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreCtrl = TextEditingController();
  final TextEditingController _direccionCtrl = TextEditingController();
  File? _selectedImage;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    if (widget.establishment != null) {
      _nombreCtrl.text = widget.establishment!['nombre'] ?? '';
      _direccionCtrl.text = widget.establishment!['direccion'] ?? '';
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _selectedImage = File(picked.path);
      });
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSaving = true);

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    final uri = widget.establishment == null
        ? Uri.parse('http://192.168.0.14:8000/api/establecimientos')
        : Uri.parse(
            'http://192.168.0.14:8000/api/establecimientos/${widget.establishment!['id']}');

    final request = http.MultipartRequest(
      widget.establishment == null ? 'POST' : 'POST', // PUT si tu API lo soporta
      uri,
    );

    request.headers['Authorization'] = 'Bearer $token';
    request.fields['nombre'] = _nombreCtrl.text.trim();
    request.fields['direccion'] = _direccionCtrl.text.trim();

    if (_selectedImage != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'imagen',
        _selectedImage!.path,
      ));
    }

    final response = await request.send();
    setState(() => _isSaving = false);

    if (response.statusCode == 200 || response.statusCode == 201) {
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al guardar el establecimiento')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.establishment != null;

    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? 'Editar Establecimiento' : 'Nuevo Establecimiento')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nombreCtrl,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Campo requerido' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _direccionCtrl,
                decoration: const InputDecoration(labelText: 'Dirección'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Campo requerido' : null,
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: _pickImage,
                icon: const Icon(Icons.image),
                label: const Text('Seleccionar imagen'),
              ),
              const SizedBox(height: 8),
              _selectedImage != null
                  ? Image.file(_selectedImage!, height: 150)
                  : widget.establishment?['imagen'] != null
                      ? Image.network(
                          'http://192.168.0.14:8000/storage/${widget.establishment!['imagen']}',
                          height: 150,
                        )
                      : const Text('No se ha seleccionado imagen'),
              const SizedBox(height: 20),
              _isSaving
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: _save,
                      child: Text(isEdit ? 'Guardar Cambios' : 'Crear'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
