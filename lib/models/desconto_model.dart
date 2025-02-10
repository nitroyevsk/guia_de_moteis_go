class DescontoModel {
  final double discount;
  DescontoModel({required this.discount});

  factory DescontoModel.fromMap(Map<String, dynamic> json) {
    return DescontoModel(
      discount: json["desconto"]
    );
  }
}