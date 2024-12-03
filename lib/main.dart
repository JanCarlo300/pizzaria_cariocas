import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/cadastro_screen.dart';
import 'screens/telainicial_screen.dart';
import 'screens/pizza_especial_screen.dart';
import 'screens/doces_screen.dart';
import 'screens/refrigerantes_screen.dart';
import 'screens/tela_carrinho.dart';
import 'screens/tela_carrinho_pagamento.dart';
import 'screens/tela_acompanhar_pedido.dart'; 

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
        '/carrinho': (context) => TelaCarrinho(cartItems: []),
        '/carrinho_pagamento': (context) => TelaCarrinhoPagamento(
              subtotal: 52.00,
              taxaEntrega: 10.00,
              descontoCupom: 15.00,
            ),
        '/acompanhar_pedido': (context) => TelaAcompanharPedido(), // Nova rota adicionada
      },
    );
  }
}
