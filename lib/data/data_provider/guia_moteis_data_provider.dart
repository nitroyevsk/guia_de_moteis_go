import 'dart:convert';

import 'package:guia_de_moteis_go/data/data_provider/abstract_moteis_data_provider.dart';
import 'package:http/http.dart' as http;

/// Data provider responsavel por obter os dados da api
class MoteisDataProvider implements AbstractMoteisDataProvider{
  
  @override
  Future<String> getListMoteis() async {
    try {
      final res = await http.get(
        Uri.parse('https://www.jsonkeeper.com/b/1IXK'),
      );

      return utf8.decode(res.bodyBytes); // Decodifica corretamente
    } catch (e) {
      throw e.toString();
    }
  }
}