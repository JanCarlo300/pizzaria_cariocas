import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/cadastro_screen.dart';
import 'screens/telainicial_screen.dart';
import 'screens/pizza_especial_screen.dart';
import 'screens/doces_screen.dart';
import 'screens/refrigerantes_screen.dart';
import 'screens/tela_carrinho.dart'; 

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
      home: const LoginScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/cadastro': (context) => CadastroScreen(),
        '/telainicial': (context) => TelaInicial(),
        '/pizza_especial': (context) => PizzaEspecialScreen(),
        '/doces': (context) => TelaDoces(),
        '/refrigerantes': (context) => TelaRefrigerantes(),
        '/carrinho': (context) => TelaCarrinho(cartItems: [],), 
      },
    );
  }
}
