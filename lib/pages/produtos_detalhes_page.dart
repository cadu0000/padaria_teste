import 'package:flutter/material.dart';
import 'package:padaria/models/produtos.dart';

// ignore: must_be_immutable
class ProdutosDetalhesPage extends StatefulWidget {
  Produto produto;

  ProdutosDetalhesPage({super.key, required this.produto});

  @override
  State<ProdutosDetalhesPage> createState() => _ProdutosDetalhesPageState();
}

class _ProdutosDetalhesPageState extends State<ProdutosDetalhesPage> {
  final _form = GlobalKey<FormState>();
  final _valor = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.produto.name),
      ),
      body: Center(
        child: Container(
          color: Colors.amber,
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Image.asset(widget.produto.image),
              Text(
                widget.produto.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Form(
                  key: _form,
                  child: TextFormField(
                    controller: _valor,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
