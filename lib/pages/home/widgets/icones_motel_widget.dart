import 'package:flutter/material.dart';
import 'package:guia_de_moteis_go/models/suite_model.dart';
import 'package:guia_de_moteis_go/pages/itens_detalhes/itens_detalhes.dart';

class IconesMotelWidget extends StatelessWidget {
  final SuiteModel suite;
  final double screenWidth;
  final bool isTestEnvironment;
  const IconesMotelWidget({super.key, required this.suite, required this.screenWidth, this.isTestEnvironment = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:15, top: 7, right: 15),
      child: InkWell(
        key: const Key('icones_motel_widget_inkwell'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ItensDetalhes(suite: suite, isTestEnvironment: isTestEnvironment)),
          );
        },
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),                                      
          width: screenWidth * .93,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))
        
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: suite.categoriaItens.take(4).map((categoriaItem) => 
                  Container(    
                    width: 50,       
                    height: 50,                                                                                     
                    margin: EdgeInsets.only(left: 2, right: 2),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  
                    ),
                    child: Center(
                      child: isTestEnvironment ?
                      Image.asset(
                        categoriaItem.icone,                        
                        fit: BoxFit.cover, 
                        width: 40,
                      )
                      : Image.network(
                        categoriaItem.icone,                        
                        fit: BoxFit.cover, 
                        width: 40,
                      ),
                    )
                  ),
                ).toList(),
              ),
                  
             Flexible(
              child: SizedBox(
                width: 60,                    
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        "Ver \ntodos",
                        maxLines: 2,
                        style: TextStyle(fontSize: 11),
                        overflow: TextOverflow.ellipsis, // Adicionar overflow
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black54,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),   
            ],
          )
          ),
      )
      );
  }
}