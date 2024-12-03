import 'package:flutter/material.dart';

class TelaCarrinhoPagamento extends StatefulWidget {
  final double subtotal;
  final double taxaEntrega;
  final double descontoCupom;

  TelaCarrinhoPagamento({
    required this.subtotal,
    required this.taxaEntrega,
    required this.descontoCupom,
  });

  @override
  _TelaCarrinhoPagamentoState createState() => _TelaCarrinhoPagamentoState();
}

class _TelaCarrinhoPagamentoState extends State<TelaCarrinhoPagamento> {
  bool combinarPagamentos = false;
  bool pagarNaHora = false;

  double get total => widget.subtotal + widget.taxaEntrega - widget.descontoCupom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Escolha como Pagar',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Resumo do Pedido
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Resumo do pedido',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(),
                      resumoLinha('Subtotal', widget.subtotal),
                      resumoLinha('Taxa de entrega', widget.taxaEntrega),
                      resumoLinha('Cupom de Desconto', -widget.descontoCupom),
                      Divider(),
                      resumoLinha('Total', total, isBold: true),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Opções de Configuração
              Column(
                children: [
                  switchOption(
                    'Combinar 2 meios de pagamento',
                    combinarPagamentos,
                    (value) {
                      setState(() {
                        combinarPagamentos = value;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  switchOption(
                    'Pagar na Hora',
                    pagarNaHora,
                    (value) {
                      setState(() {
                        pagarNaHora = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Meios de Pagamento
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  pagamentoBotao(
                    icon: Icons.credit_card,
                    label: 'Cartão de Credito',
                    onTap: () {
                      // Ação para Cartão de Crédito
                      print('Selecionado Cartão de Crédito');
                    },
                  ),
                  pagamentoBotao(
                    icon: Icons.qr_code,
                    label: 'Pix',
                    onTap: () {
                      // Ação para Pix
                      print('Selecionado Pix');
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Botões de Ação
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Voltar para o carrinho
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Carrinho',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Redirecionar para a tela de Acompanhar Pedido
                      Navigator.pushNamed(context, '/acompanhar_pedido');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Realizar pedido',
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

  Widget resumoLinha(String label, double value, {bool isBold = false}) {
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

  Widget switchOption(String label, bool value, Function(bool) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.orange,
        ),
      ],
    );
  }

  Widget pagamentoBotao({required IconData icon, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.shade100,
        ),
        child: Column(
          children: [
            Icon(icon, size: 40, color: Colors.black),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
