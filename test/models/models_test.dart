import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis_go/models/suite_model.dart';

void main() {
  group('SuiteModel', () {
    test('deve criar um modelo corretamente a partir de um mapa', () {
      // Preparando os dados de entrada para o fromMap
      final json = {
        "nome": "Suíte Marselha s/ garagem privativa",
        "fotos": [
          "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_1.jpg"
        ],
        "periodos": [
          {
            "tempoFormatado": "3 horas",
            "tempo": "3",
            "valor": 88.0,
            "valorTotal": 88.0,
            "temCortesia": false,
            "desconto": null
          }
        ],
        "categoriaItens": [
          {
            "nome": "Frigobar",
            "icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/frigobar-04-09-2018-12-14.png"
          }
        ],
        "itens": [
          {"nome": "ducha dupla"}
        ]
      };

      // Criando o modelo
      final suiteModel = SuiteModel.fromMap(json);

      // Validando a criação
      expect(suiteModel.nome, "Suíte Marselha s/ garagem privativa");
      expect(suiteModel.fotos.length, 1);
      expect(suiteModel.periodos.length, 1);
      expect(suiteModel.categoriaItens.length, 1);
      expect(suiteModel.itens.length, 1);
      expect(suiteModel.itens[0], "ducha dupla");
    });
  });
}
