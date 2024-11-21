import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 50),
              // Logo da Pizzaria
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.white,
                child: Image.asset(
                  'assets/images/logo.png', // Substitua pelo seu logo
                  fit: BoxFit.cover,
                  height: 90,
                ),
              ),
              const SizedBox(height: 30),
              // Formulário de Login
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'BEM-VINDO!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Campo de Email
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    // Campo de Senha
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        prefixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    // Botão de Entrar
                    ElevatedButton(
                      onPressed: () {
                        // Ação de login
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'ENTRAR',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Esqueceu sua senha
                    TextButton(
                      onPressed: () {
                        // Ação de "esqueceu sua senha"
                      },
                      child: const Text(
                        'Esqueceu sua senha?',
                        style: TextStyle(color: Colors.orange),
                      ),
                    ),
                    const Divider(),
                    // Link para Cadastro
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Não tem uma conta? '),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/cadastro');
                          },
                          child: const Text(
                            'Cadastre-se',
                            style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
