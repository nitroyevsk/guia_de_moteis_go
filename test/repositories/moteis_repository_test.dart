import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis_go/data/data_provider/abstract_moteis_data_provider.dart';
import 'package:guia_de_moteis_go/data/repository/moteis_repository.dart';
import 'package:guia_de_moteis_go/models/categoria_item_model.dart';
import 'package:guia_de_moteis_go/models/motel_model.dart';
import 'package:guia_de_moteis_go/models/periodo_model.dart';
import 'package:guia_de_moteis_go/models/suite_model.dart';

class MoteisDataProviderMockup implements AbstractMoteisDataProvider {
  
  @override
  Future<String> getListMoteis() async {   
    var data = {
        "sucesso": true,
        "data": {
          "pagina": 1,
          "qtdPorPagina": 10,
          "totalSuites": 0,
          "totalMoteis": 1,
          "raio": 0,
          "maxPaginas": 1.0,
          "moteis": [
            {
              "fantasia": "Motel Le Nid",
              "logo": "https://cdn.guiademoteis.com.br/imagens/logotipos/3148-le-nid.gif",
              "bairro": "Chácara Flora - São Paulo",
              "distancia": 28.27,
              "qtdFavoritos": 0,
              "suites": [
                {
                  "nome": "Suíte Marselha s/ garagem privativa",
                  "qtd": 1,
                  "exibirQtdDisponiveis": true,
                  "fotos": [
                    "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_1.jpg",
                    "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_2.jpg",
                    "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_3.jpg",
                    "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_4.jpg"
                  ],
                  "itens": [
                    {
                      "nome": "ducha dupla"
                    },
                    {
                      "nome": "TV a cabo"
                    },
                    {
                      "nome": "TV LED 32''"
                    },
                    {
                      "nome": "iluminação por leds"
                    },
                    {
                      "nome": "garagem coletiva"
                    },
                    {
                      "nome": "som AM/FM"
                    },
                    {
                      "nome": "3 canais eróticos"
                    },
                    {
                      "nome": "bluetooth"
                    },
                    {
                      "nome": "espelho no teto"
                    },
                    {
                      "nome": "acesso à suíte via escadas"
                    },
                    {
                      "nome": "frigobar"
                    },
                    {
                      "nome": "ar-condicionado split"
                    },
                    {
                      "nome": "WI-FI"
                    },
                    {
                      "nome": "secador de cabelo"
                    }
                  ],
                  "categoriaItens": [
                    {
                      "nome": "Frigobar",
                      "icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/frigobar-04-09-2018-12-14.png"
                    },
                    {
                      "nome": "Ar-Condicionado",
                      "icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/arcondicionado-04-09-2018-12-13.png"
                    },
                    {
                      "nome": "Internet Wi-Fi",
                      "icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/internet-wifi-22-08-2018-11-42.png"
                    },
                    {
                      "nome": "Secador de Cabelo",
                      "icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/secador-de-cabelo-04-09-2018-12-14.png"
                    }
                  ],
                  "periodos": [
                    {
                      "tempoFormatado": "3 horas",
                      "tempo": "3",
                      "valor": 88.0,
                      "valorTotal": 88.0,
                      "temCortesia": false,
                      "desconto": null
                    },
                    {
                      "tempoFormatado": "6 horas",
                      "tempo": "6",
                      "valor": 101.0,
                      "valorTotal": 101.0,
                      "temCortesia": false,
                      "desconto": null
                    },
                    {
                      "tempoFormatado": "12 horas",
                      "tempo": "12",
                      "valor": 129.58,
                      "valorTotal": 81.58,
                      "temCortesia": false,
                      "desconto": {
                        "desconto": 48.0
                      }
                    }
                  ]
                },
              ],
              "qtdAvaliacoes": 2159,
              "media": 4.6
            }
          ]
        },
        "mensagem": [

        ]
      };
    return await Future.delayed(Duration(seconds: 2), () => jsonEncode(data));
  }

}

void main() {
  late MoteisRepository mRepository;

  setUp(() {
    mRepository = MoteisRepository(MoteisDataProviderMockup());
  });
  
  test('Deve obter os dados do repository em modelos', () async {
    List<MotelModel> moteis = await mRepository.getMoteisList();
    // verifica nulidade
    expect(moteis, isNotEmpty);

    // verifica modelos e valores
    expect(moteis.first, isA<MotelModel>());
    expect(moteis.first.fantasia, equals("Motel Le Nid"));
    
    expect(moteis.first.suites.first, isA<SuiteModel>());
    expect(moteis.first.suites.first.nome, equals("Suíte Marselha s/ garagem privativa"));
    
    expect(moteis.first.suites.first.periodos, isA<List<PeriodoModel>>());
    
    expect(moteis.first.suites.first.categoriaItens, isA<List<CategoriaItemModel>>());

    expect(moteis.first.media, equals(4.6));
  });
}