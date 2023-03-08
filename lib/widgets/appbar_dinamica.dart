import 'package:flutter/material.dart';
import '../models/produtos.dart';
import '../repositories/produtos_repository.dart';

class AppBarDinamica extends StatefulWidget {
  const AppBarDinamica({super.key});

  @override
  State<AppBarDinamica> createState() => AppBarDinamicaState();
}

class AppBarDinamicaState extends State<AppBarDinamica> {
  var listaProduto = ProdutosRepository.listaProduto;
  List<Produto> selecionadas = [];
  bool isSorted = false;

  appBarDinamica() {
    if (selecionadas.isEmpty) {
      return AppBar(
        title: const Text('Compras'),
        actions: [
          IconButton(
            onPressed: () => sort(),
            icon: const Icon(Icons.swap_horiz),
            // tooltip: Tooltip(message:'ordenar os preços',),
          ),
        ],
      );
    } else {
      return AppBar(
        leading: IconButton(
          onPressed: () {
            setState(() {
              selecionadas = [];
            });
          },
          icon: const Icon(Icons.arrow_back),
        ),
      );
    }
  }

  sort() {
    if (!isSorted) {
      setState(() {
        listaProduto.sort((Produto a, Produto b) => a.price.compareTo(b.price));
        isSorted = true;
      });
    } else {
      setState(() {
        listaProduto = listaProduto.reversed.toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDinamica(),
    );
  }
}
