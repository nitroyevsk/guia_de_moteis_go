import 'dart:convert';

import 'package:guia_de_moteis_go/data/data_provider/abstract_moteis_data_provider.dart';
import 'package:guia_de_moteis_go/models/motel_model.dart';

// Repository responsavel por abstrair a regra de negocio e encapsular os dados em modelos de dados
class MoteisRepository {
    final AbstractMoteisDataProvider moteisDataProvider;
    MoteisRepository(this.moteisDataProvider);

    Future<List<MotelModel>> getMoteisList() async {
      try {
        final moteisData = await moteisDataProvider.getListMoteis();

        final data = jsonDecode(moteisData);

        if (data['sucesso'] != true) {
          throw 'An unexpected error occurred';
        }        
        return (data["data"]["moteis"] as List).map((e) => MotelModel.fromMap(e)).toList();
      } catch (e) {
        throw e.toString();
      }
    }
}