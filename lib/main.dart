import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/cadastro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pizzaria Carioca\'s',
      theme: ThemeData(primarySwatch: Colors.orange),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/cadastro': (context) =>  CadastroScreen(),
      },
    );
  }
}
