import 'package:atividade2/view/meus_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controller/lanches_controller.dart';

class Lanches extends StatefulWidget {
  const Lanches({Key? key}) : super(key: key);

  @override
  LanchesState createState() => LanchesState();
}

class LanchesState extends State<Lanches> {
  //instanciar o controller
  LanchesController controller = LanchesController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Lanches")),
        body: FutureBuilder(
            future: controller.listarLanches(),
            builder: (context, AsyncSnapshot? res) {
              if (!res!.hasData) {
                return const Text("listar de Lanches vazia!");
              } else if (res.hasError) {
                return const Text("erro ao carregar lista de Lanches!");
              } else {
                //caso exista dados , deveremos exibi-lo
                return ListView.builder(
                    itemCount: res.data.length ?? 0,
                    itemBuilder: (context, i) {
                      return Lanche(
                        fotoUrl: res.data[i].imagem,
                        nome: res.data[i].nome,
                        descricao: res.data[i].descricao,
                        preco: res.data[i].preco.toString(),
                      );
                    });
              }
            }));
  }
}
