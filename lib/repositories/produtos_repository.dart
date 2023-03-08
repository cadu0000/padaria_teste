import 'package:padaria/models/produtos.dart';

class ProdutosRepository {
  static List<Produto> listaProduto = [
    Produto(
      image: 'images/pao_carteira.png',
      name: 'Pão Carteira',
      price: 2.0,
    ),
    Produto(
      image: 'images/pao_frances.png',
      name: 'Pão francês',
      price: 2.0,
    ),
    Produto(
      image: 'images/pao_queijo.png',
      name: 'Pão de queijo',
      price: 5.0,
    ),
    Produto(
      image: 'images/pao_forma.png',
      name: 'Pão de forma',
      price: 3.0,
    ),
    Produto(
      image: 'images/agua.png',
      name: 'Água 500ml',
      price: 1.0,
    ),
    Produto(
      image: 'images/baguette.png',
      name: 'baguette',
      price: 4.50,
    ),
    Produto(
      image: 'images/pao_hamburguer.png',
      name: 'Pão de hambúrguer',
      price: 2.50,
    ),
    Produto(
      image: 'images/queijo_coalho.png',
      name: 'Queijo coalho',
      price: 8.0,
    ),
    Produto(
      image: 'images/sonho.png',
      name: 'Sonho',
      price: 5.0,
    ),
    Produto(
      image: 'images/leite.png',
      name: 'Leite',
      price: 6.0,
    ),
  ];
}
