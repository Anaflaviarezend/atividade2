import 'package:atividade2/model/lanche_model.dart';


class LanchesController {
 
  Future<List<ModelLanches>> listarLanches() async {
    return await ModelLanches.listarlanchs();
  }
}