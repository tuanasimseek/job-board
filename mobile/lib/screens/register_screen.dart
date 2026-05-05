import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Register form valid")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email boş olamaz";
                  }
                  if (!value.contains("@")) {
                    return "Geçerli bir email gir";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Şifre boş olamaz";
                  }
                  if (value.length < 6) {
                    return "Şifre en az 6 karakter olmalı";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Confirm Password",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Şifre tekrar boş olamaz";
                  }
                  if (value != passwordController.text) {
                    return "Şifreler eşleşmiyor";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // 🔵 REGISTER BUTONU
              ElevatedButton(
                onPressed: _register,
                child: const Text("Register"),
              ),

              const SizedBox(height: 12),

              // 🔥 EKLENEN KISIM (GERİ DÖNÜŞ)
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Zaten hesabın var mı? Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}