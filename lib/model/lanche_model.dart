import 'dart:convert';


import 'package:http/http.dart' as http;

class ModelLanches {
  int? lancheId;
  String? imagem;
  String? nome;
  String? descricao;
  double? preco;

  ModelLanches(
      {this.lancheId, this.imagem, this.nome, this.descricao, this.preco});

  ModelLanches.fromJson(Map<String, dynamic> json) {
    lancheId = json['lancheId'];
    imagem = json['imagem'];
    nome = json['nome'];
    descricao = json['descricao'];
    preco = json['preco'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lancheId'] = this.lancheId;
    data['imagem'] = this.imagem;
    data['nome'] = this.nome;
    data['descricao'] = this.descricao;
    data['preco'] = this.preco;
    return data;
  }
    static Future<List<ModelLanches>> listarlanchs() async {
    var url =
        Uri.parse('https://api.senac.estevaorada.com/sistema/cardapio/lanches');
    var resposta = await http.get(url);
    //var json = jsonDecode(resposta.body);
    Iterable l = jsonDecode(resposta.body);
    List<ModelLanches> Lanches = List<ModelLanches>.from(
        l.map((model) => ModelLanches.fromJson(model)));
    return Lanches;
  }
}
