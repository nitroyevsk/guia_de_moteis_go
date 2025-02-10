class CategoriaItemModel {
  final String nome;
  final String icone;

  CategoriaItemModel({
    required this.nome,
    required this.icone,
  });

   factory CategoriaItemModel.fromMap(Map<String, dynamic> json) {
    return CategoriaItemModel(
      nome: json["nome"],
      icone: json["icone"]
    );
   }
}