import 'package:flutter/material.dart';

class TelaCarrinho extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  TelaCarrinho({required this.cartItems});

  @override
  _TelaCarrinhoState createState() => _TelaCarrinhoState();
}

class _TelaCarrinhoState extends State<TelaCarrinho> {
  List<Map<String, dynamic>> get _carrinho => widget.cartItems;

  double get _subtotal => _carrinho.fold(
      0, (total, item) => total + (item['price'] * item['quantity']));

  double _taxas = 5.00; // Taxa fixa para exemplo
  double _frete = 3.00; // Frete fixo para exemplo

  double get _total => _subtotal + _taxas + _frete;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Carrinho de Compras',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Lista de itens no carrinho
              _carrinho.isEmpty
                  ? Center(
                      child: Text(
                        'Seu carrinho está vazio.',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _carrinho.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final item = _carrinho[index];
                        return Card(
                          elevation: 3,
                          margin: EdgeInsets.only(bottom: 16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Imagem do produto
                                Image.asset(
                                  item['image'],
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(width: 12),
                                // Informações do produto
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['name'],
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'R\$ ${item['price'].toStringAsFixed(2)}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Controles de quantidade e botão remover
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove_circle_outline),
                                      color: Colors.orange,
                                      onPressed: () {
                                        setState(() {
                                          if (item['quantity'] > 1) {
                                            item['quantity']--;
                                          }
                                        });
                                      },
                                    ),
                                    Text(
                                      '${item['quantity']}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.add_circle_outline),
                                      color: Colors.orange,
                                      onPressed: () {
                                        setState(() {
                                          item['quantity']++;
                                        });
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete_outline),
                                      color: Colors.red,
                                      onPressed: () {
                                        setState(() {
                                          _carrinho.removeAt(index);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
              SizedBox(height: 16),
              // Resumo do pedido
              if (_carrinho.isNotEmpty)
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Resumo do Pedido',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(),
                        _resumoLinha('Subtotal', _subtotal),
                        _resumoLinha('Taxas e Impostos', _taxas),
                        _resumoLinha('Frete', _frete),
                        Divider(),
                        _resumoLinha('Total', _total, isBold: true),
                      ],
                    ),
                  ),
                ),
              SizedBox(height: 16),
              // Observações
              if (_carrinho.isNotEmpty)
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Observações sobre o pedido',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              SizedBox(height: 16),
              // Botões de ação
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Voltar para o Menu',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  if (_carrinho.isNotEmpty)
                    ElevatedButton(
                      onPressed: () {
                        print('Finalizar Compra');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Confirmar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _resumoLinha(String label, double value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            'R\$ ${value.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: isBold ? Colors.orange : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
