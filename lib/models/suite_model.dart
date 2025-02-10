import 'package:guia_de_moteis_go/models/categoria_item_model.dart';
import 'package:guia_de_moteis_go/models/periodo_model.dart';

class SuiteModel {
  final String nome;
  final List<String> fotos;
  final List<PeriodoModel> periodos;
  final List<CategoriaItemModel> categoriaItens;
  final List<String> itens;

  SuiteModel({
    required this.nome,
    required this.fotos,
    required this.periodos,
    required this.categoriaItens,
    required this.itens,
  });

  factory SuiteModel.fromMap(Map<String, dynamic> json) {    
    return SuiteModel(
      nome: json["nome"], 
      fotos: (json["fotos"] as List).map((e) => e as String).toList(), 
      periodos: (json["periodos"] as List).map((e) => PeriodoModel.fromMap(e)).toList(),
      categoriaItens: (json["categoriaItens"] as List).map((e)=> CategoriaItemModel.fromMap(e)).toList(),
      itens: (json["itens"] as List).map((e) => e["nome"] as String).toList(),
    );
  }
}