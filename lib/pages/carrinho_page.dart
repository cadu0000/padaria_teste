import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:padaria/models/produtos.dart';
import 'package:padaria/pages/selection_page.dart';

// ignore: must_be_immutable
class CarrinhoPage extends StatefulWidget {
  SelectionPageState selectionPageState = SelectionPageState();
  late List<Produto> itemCarrinho = selectionPageState.itemCarrinho;
  //late List<Produto> selecionadas;
  CarrinhoPage({super.key});

  @override
  State<CarrinhoPage> createState() => CarrinhoPageState();
}

class CarrinhoPageState extends State<CarrinhoPage> {
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');

  listaCarrinho() {
    if (widget.itemCarrinho.isEmpty) {
      return const Center(
        child: Text('Não há nada no carrinho'),
      );
    } else {
      return ListView.separated(
          itemBuilder: (BuildContext context, int produto) {
            return ListTile(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              leading: SizedBox(
                width: 80,
                child: Image.asset(widget.itemCarrinho[produto].image),
              ),
              title: Text(widget.itemCarrinho[produto].name),
              trailing: Text(
                real.format(widget.itemCarrinho[produto].price),
              ),
            );
          },
          separatorBuilder: (_, __) => const Divider(),
          itemCount: widget.itemCarrinho.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho de compras'),
      ),
      body: listaCarrinho(),
    );
  }
}
