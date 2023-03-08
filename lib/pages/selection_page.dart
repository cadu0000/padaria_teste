import 'package:flutter/material.dart';
import 'package:padaria/models/produtos.dart';
import 'package:padaria/pages/carrinho_page.dart';
import 'package:padaria/pages/produtos_detalhes_page.dart';
import 'package:padaria/repositories/produtos_repository.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => SelectionPageState();
}

class SelectionPageState extends State<SelectionPage> {
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  var listaProduto = ProdutosRepository.listaProduto;
  List<Produto> selecionadas = [];
  List<Produto> itemCarrinho = [];
  int itemSelecionado = 0;
  int paginaSelecionada = 0;
  String mensagem = "ordenar os preços";

  bool isSorted = false;

  detalhes(Produto produto) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProdutosDetalhesPage(produto: produto),
      ),
    );
  }

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
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          '${selecionadas.length} selecionadas',
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

  bool carrinhoCheio = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDinamica(),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int produto) {
          return ListTile(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            leading: (selecionadas.contains(listaProduto[produto]))
                ? const CircleAvatar(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black,
                    child: Icon(Icons.check),
                  )
                : SizedBox(
                    width: 80,
                    child: Image.asset(listaProduto[produto].image),
                  ),
            title: Text(
                '${listaProduto[produto].name}\n${real.format(listaProduto[produto].price)}'),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  itemCarrinho.add(listaProduto[produto]);
                });
              },
              icon: const Icon(Icons.shopping_cart),
            ),
            selected: selecionadas.contains(listaProduto[produto]),
            selectedTileColor: Colors.orange[80],
            onTap: () => detalhes(listaProduto[produto]),
            onLongPress: () {
              setState(() {
                (selecionadas.contains(listaProduto[produto]))
                    ? selecionadas.remove(listaProduto[produto])
                    : selecionadas.add(listaProduto[produto]);
              });
            },
          );
        },
        padding: const EdgeInsets.all(8),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: listaProduto.length,
      ),
      floatingActionButton: selecionadas.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CarrinhoPage(),
                    ));
              }, //carrinhoCompras(itemCarrinho),
              label: const Text('Colocar no carrinho'),
              extendedTextStyle: const TextStyle(
                letterSpacing: 0,
                fontWeight: FontWeight.bold,
              ),
              icon: const Icon(Icons.shopping_bag),
            )
          : null,
    );
  }
}
