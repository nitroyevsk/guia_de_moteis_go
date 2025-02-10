import 'package:guia_de_moteis_go/models/suite_model.dart';

class MotelModel {
  final String fantasia;
  final String logo;
  final String bairro;
  final double distancia;
  final int qtdAvaliacoes;
  final double media;
  final List<SuiteModel> suites;

  MotelModel({
    required this.fantasia,
    required this.logo,
    required this.bairro,
    required this.distancia,
    required this.qtdAvaliacoes,
    required this.media,
    required this.suites
  });

  factory MotelModel.fromMap(Map<String, dynamic> json) {    
    return MotelModel(
      fantasia: json["fantasia"],
      logo: json["logo"],
      bairro: json["bairro"],
      distancia: json["distancia"],
      qtdAvaliacoes: json["qtdAvaliacoes"],
      media: json["media"],
      suites: (json["suites"] as List).map((e) => SuiteModel.fromMap(e)).toList()
    );
  }

}