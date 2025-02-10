import 'package:flutter/material.dart';
import 'package:guia_de_moteis_go/models/suite_model.dart';
import 'package:guia_de_moteis_go/pages/images/images_page.dart';

class FotoMotelWidget extends StatelessWidget {
  final SuiteModel suite;
  final double screenWidth;
  final bool isTestEnvironment;
  const FotoMotelWidget({super.key, required this.suite, required this.screenWidth, this.isTestEnvironment = false});

  Image _buildImage(bool isTestEnvironment, String path) {
    if (isTestEnvironment) {
      return Image.asset(path, fit: BoxFit.cover, );
    } else {
      return Image.network(path, fit: BoxFit.cover, );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:15, top: 15, right: 15),
      child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),                                      
          width: screenWidth-30,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))
      
          ),
          child: Column(children: [
            // imagem
            InkWell(
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ImagesPage(nome: suite.nome, images: suite.fotos, isTestEnvironment: isTestEnvironment,)),
              );
              },
              child: Container(
                padding: EdgeInsets.only(top: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),                  
                  child: _buildImage(isTestEnvironment, suite.fotos.first)
                )
              ),
            ),     
            // nome suite                                   
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Center(child: Text(suite.nome, maxLines: 2, style: TextStyle(fontSize: 20, fontFamily: 'Roboto', fontStyle: FontStyle.italic),),),
            )
          ],),
        ),
    );
  }
}