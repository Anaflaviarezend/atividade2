import 'package:flutter/material.dart';

// Classe de widget de título:
class Titulo extends StatelessWidget {
  const Titulo({Key? key, required this.titulo}) : super(key: key);

  final String titulo;
  @override
  Widget build(BuildContext context) {
    return Text(
      titulo,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
    );
  }
}

// Classe de widget de descrição
// Descricao(descricao: "Lanche show!")
class Descricao extends StatelessWidget {
  const Descricao({Key? key, required this.descricao}) : super(key: key);
  final String descricao;
  @override
  Widget build(BuildContext context) {
    return Text(
      descricao,
      style: const TextStyle(fontSize: 14),
    );
  }
}

class QuadroItem extends StatelessWidget {
  const QuadroItem({Key? key, required this.imagem, required this.nome, required this.descricao, required this.preco})
      : super(key: key);
  final String imagem;
  final String nome;
  final String descricao;
  final String preco;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image(
              image: AssetImage(imagem),
              width: 80,
            ),
          ),
        ),
        Text(
          nome,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 19, fontFamily: "arial"),
        )
      ],
    );
  }
}

class Lanche extends StatelessWidget {
  final String fotoUrl;
  final String nome;
  final String descricao;
  final String preco;


  const Lanche(
      {Key? key,
      required this.fotoUrl,
      required this.nome,
      required this.descricao,
      required this.preco,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        width: double.infinity,
        child: Card(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 50,
                child: ClipOval(
                  child: Image.network(
                    fotoUrl,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nome,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(descricao),
                  Text(preco),
                 
                ],
              )
            ],
          ),
        )));
  }
}
