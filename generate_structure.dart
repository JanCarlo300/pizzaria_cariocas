import 'dart:io';

void main() {
  final projectName = "pizzaria_cariocas";

  // Diretórios principais
  final directories = [
    'lib/screens',
    'lib/widgets',
    'lib/utils',
    'assets/images',
  ];

  // Arquivos principais
  final files = {
    'lib/main.dart': mainFileContent(),
    'lib/screens/cadastro_screen.dart': cadastroScreenContent(),
    'assets/images/logo_placeholder.txt': 'Coloque o logo aqui',
    'pubspec.yaml': pubspecContent(),
  };

  print('🛠️ Gerando estrutura para o projeto "$projectName"...');

  // Criar diretórios
  for (var dir in directories) {
    Directory(dir).createSync(recursive: true);
    print('📁 Diretório criado: $dir');
  }

  // Criar arquivos
  for (var path in files.keys) {
    File file = File(path);
    file.createSync(recursive: true);
    file.writeAsStringSync(files[path]!);
    print('📄 Arquivo criado: $path');
  }

  print('\n✅ Estrutura gerada com sucesso! Certifique-se de adicionar o logo em "assets/images/logo.png".');
}

// Conteúdo do arquivo `main.dart`
String mainFileContent() => '''
import 'package:flutter/material.dart';
import 'screens/cadastro_screen.dart';

void main() {
  runApp(PizzariaCariocasApp());
}

class PizzariaCariocasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CadastroScreen(),
      theme: ThemeData(
        primaryColor: Colors.orange,
        fontFamily: 'Roboto',
      ),
    );
  }
}
''';

// Conteúdo do arquivo `cadastro_screen.dart`
String cadastroScreenContent() => '''
import 'package:flutter/material.dart';

class CadastroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade300,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/images/logo.png'),
                ),
                SizedBox(height: 16),
                // Título
                Text(
                  'Cadastre-se',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                // Formulário
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 16.0),
                    child: Column(
                      children: [
                        // Nome Completo
                        TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: 'Nome Completo',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        // Email
                        TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        // Senha
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            labelText: 'Senha',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        // Confirmar Senha
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            labelText: 'Confirmar senha',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        // Telefone
                        TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            labelText: 'Telefone',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        // Endereço
                        TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.location_on),
                            labelText: 'Endereço',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        // Botão de cadastro
                        ElevatedButton(
                          onPressed: () {
                            // Implementar lógica de cadastro
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: Center(
                            child: Text(
                              'Cadastrar',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        // Texto para login
                        GestureDetector(
                          onTap: () {
                            // Navegar para tela de login
                          },
                          child: Text(
                            'Já tem conta? Fazer login',
                            style: TextStyle(
                              color: Colors.orange.shade600,
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
''';

// Conteúdo do arquivo `pubspec.yaml`
String pubspecContent() => '''
name: pizzaria_cariocas
description: Projeto Flutter para Pizzaria Carioca's

environment:
  sdk: ">=2.17.0 <3.0.0"

dependencies:
  flutter:
    sdk: flutter

flutter:
  assets:
    - assets/images/
''';
