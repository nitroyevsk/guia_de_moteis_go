import 'package:guia_de_moteis_go/models/desconto_model.dart';

class PeriodoModel {
  final String timeFormatted;
  final double value;
  final double totalValue;
  final DescontoModel? discount;
  final bool hasCourtesy;

  PeriodoModel({
    required this.timeFormatted,
    required this.value,
    required this.totalValue,
    this.discount,
    required this.hasCourtesy,
  });

  factory PeriodoModel.fromMap(Map<String, dynamic> json) {
    return PeriodoModel(
      timeFormatted: json["tempoFormatado"], 
      value: json["valor"],
      totalValue: json["valorTotal"],
      discount: json["desconto"] == null ? null : DescontoModel.fromMap(json["desconto"]),
      hasCourtesy: json["temCortesia"]
    );
  }
}