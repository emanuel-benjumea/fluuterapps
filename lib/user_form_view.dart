import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'auth_service.dart';

class UserFormView extends StatefulWidget {
  final Map<String, dynamic>? user;

  const UserFormView({super.key, this.user});

  @override
  _UserFormViewState createState() => _UserFormViewState();
}

class _UserFormViewState extends State<UserFormView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      _nameCtrl.text = widget.user!['name'] ?? '';
      _emailCtrl.text = widget.user!['email'] ?? '';
    }
  }

  Future<void> saveUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);

    final token = await AuthService.getToken();
    final isEdit = widget.user != null;
    final url = isEdit
        ? 'http://192.168.0.14:8000/api/users/${widget.user!['id']}'
        : 'http://192.168.0.14:8000/api/users';

    final method = isEdit ? 'PUT' : 'POST';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final body = jsonEncode({
      'name': _nameCtrl.text.trim(),
      'email': _emailCtrl.text.trim(),
      if (!isEdit) 'password': _passwordCtrl.text.trim(),
    });

    http.Response response;
    if (isEdit) {
      response = await http.put(Uri.parse(url), headers: headers, body: body);
    } else {
      response = await http.post(Uri.parse(url), headers: headers, body: body);
    }

    setState(() => _isSaving = false);

    if (response.statusCode == 200 || response.statusCode == 201) {
      Navigator.pop(context, true); // Éxito
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al guardar usuario')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.user != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Editar Usuario' : 'Nuevo Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameCtrl,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Campo requerido' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _emailCtrl,
                decoration: const InputDecoration(labelText: 'Correo'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Campo requerido' : null,
              ),
              const SizedBox(height: 12),
              if (!isEdit)
                TextFormField(
                  controller: _passwordCtrl,
                  decoration: const InputDecoration(labelText: 'Contraseña'),
                  obscureText: true,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Campo requerido' : null,
                ),
              const SizedBox(height: 20),
              _isSaving
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: saveUser,
                      child: Text(isEdit ? 'Guardar cambios' : 'Crear usuario'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
