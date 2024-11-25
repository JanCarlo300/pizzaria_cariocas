import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  // Índice da aba atualmente selecionada
  int _selectedTabIndex = 0;

  // Dados de exemplo para cada aba
  final List<Map<String, dynamic>> _menuData = [
    {
      'title': 'Tradicionais',
      'items': [
        {
          'image': 'assets/images/calabresa.jpg',
          'name': 'Calabresa',
          'description': 'Molho, mussarela, calabresa, cebola, pimentão, azeitona e orégano',
          'price': 50.00,
        },
        {
          'image': 'assets/images/bacon.jpg',
          'name': 'Bacon',
          'description': 'Molho, mussarela, tomate, bacon, azeitona e orégano',
          'price': 50.00,
        },
      ],
    },
    {
      'title': 'Especiais',
      'items': [
        {
          'image': 'assets/images/4queijos.jpg',
          'name': '4 Queijos',
          'description': 'Molho branco, mussarela, provolone, parmesão e orégano',
          'price': 55.00,
        },
        {
          'image': 'assets/images/frango_catupiry.jpg',
          'name': 'Frango com Catupiry',
          'description': 'Molho, mussarela, frango desfiado, catupiry e orégano',
          'price': 60.00,
        },
      ],
    },
    {
      'title': 'Doces',
      'items': [
        {
          'image': 'assets/images/bolo_pote.jpg',
          'name': 'Bolo no Pote',
          'description': 'Bolo no pote com cobertura de chocolate',
          'price': 40.00,
        },
        {
          'image': 'assets/images/pizza_chocolate.jpg',
          'name': 'Pizza de Chocolate',
          'description': 'Molho de chocolate, granulado e morango',
          'price': 45.00,
        },
      ],
    },
    {
      'title': 'Refrigerante',
      'items': [
        {
          'image': 'assets/images/coca_cola.jpg',
          'name': 'Coca-Cola 2L',
          'description': 'Refrigerante Coca-Cola 2L',
          'price': 12.00,
        },
        {
          'image': 'assets/images/guarana.jpg',
          'name': 'Guaraná 2L',
          'description': 'Refrigerante Guaraná Antarctica 2L',
          'price': 10.00,
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('assets/images/logocariocas.jpg'),
            ),
            SizedBox(width: 8),
            Text(
              "Cariocas's",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(Icons.shopping_cart_outlined, size: 28),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nosso Menu',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _menuTab('Tradicionais', 0),
                  _menuTab('Especiais', 1),
                  _menuTab('Doces', 2),
                  _menuTab('Refrigerante', 3),
                ],
              ),
              SizedBox(height: 20),
              ..._menuData[_selectedTabIndex]['items'].map((item) {
                return _pizzaItem(
                  image: item['image'],
                  name: item['name'],
                  description: item['description'],
                  price: item['price'],
                );
              }).toList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrinho',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }

  Widget _menuTab(String title, int tabIndex) {
    return TextButton(
      onPressed: () {
        setState(() {
          _selectedTabIndex = tabIndex;
        });
      },
      child: Text(
        title,
        style: TextStyle(
          color: _selectedTabIndex == tabIndex ? Colors.orange : Colors.black,
          fontWeight: _selectedTabIndex == tabIndex
              ? FontWeight.bold
              : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _pizzaItem({
    required String image,
    required String name,
    required String description,
    required double price,
  }) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'R\$ ${price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print("Adicionar '$name' ao carrinho");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Adicionar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
