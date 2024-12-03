import 'package:flutter/material.dart';

class TelaAcompanharPedido extends StatelessWidget {
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
              "Acompanhe seu Pedido",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Ação para abrir menu (opcional)
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                // "Preparando"
                _stepWidget(
                  icon: Icons.restaurant_menu,
                  label: "Preparando",
                  isActive: true,
                  isCompleted: false,
                ),
                _lineConnector(isActive: true),
                // "A Caminho"
                _stepWidget(
                  icon: Icons.delivery_dining,
                  label: "A caminho",
                  isActive: false,
                  isCompleted: false,
                ),
                _lineConnector(isActive: false),
                // "Avaliação"
                _stepWidget(
                  icon: Icons.star_rate_outlined,
                  label: "Avaliação",
                  isActive: false,
                  isCompleted: false,
                ),
              ],
            ),
          ),
          Spacer(),
          // Botão de Chat no WhatsApp
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                // Lógica para abrir o WhatsApp
                print("Abrir WhatsApp");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              icon: Icon(Icons.chat, color: Colors.white),
              label: Text(
                "Chat",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _stepWidget({
    required IconData icon,
    required String label,
    required bool isActive,
    required bool isCompleted,
  }) {
    return Row(
      children: [
        // Ícone com estilo dinâmico
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: isActive ? Colors.red : Colors.grey[300],
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: isActive ? Colors.white : Colors.black54,
            size: 28,
          ),
        ),
        SizedBox(width: 16),
        // Texto do passo
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.black : Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _lineConnector({required bool isActive}) {
    return Container(
      width: 4,
      height: 40,
      margin: EdgeInsets.symmetric(horizontal: 28), // Alinhado ao ícone
      decoration: BoxDecoration(
        color: isActive ? Colors.red : Colors.grey[300],
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
