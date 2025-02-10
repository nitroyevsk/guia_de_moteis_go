import 'package:flutter/material.dart';
import 'package:guia_de_moteis_go/models/suite_model.dart';


class ItensDetalhes extends StatelessWidget {
  final SuiteModel suite;  
  final bool isTestEnvironment;
  const ItensDetalhes({super.key, required this.suite, this.isTestEnvironment =false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.keyboard_arrow_left_outlined)),
        backgroundColor: Colors.white,
      
      ),
      body: SizedBox.expand(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [ 

              // nome suite           
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 50),
                child: Text(
                  suite.nome,
                  style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
              ),

              // sepadador 
              Row(                
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: .6, color: Colors.black))
                      ),
                    ),
                  ),            
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text("principais itens", style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic),),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: .6, color: Colors.black))
                      ),
                    ),
                  ),            
              ],),

              // itens principais
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 10,
                  runSpacing: 10,
                  children: suite.categoriaItens.map((item) => 
                    IntrinsicWidth( 
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          (isTestEnvironment 
                          ? Image.asset(
                            item.icone,                        
                            fit: BoxFit.cover, 
                            width: 40,
                            height: 40, 
                          ): 
                          Image.network(
                            item.icone,                        
                            fit: BoxFit.cover, 
                            width: 40,
                            height: 40, 
                          )),
                          SizedBox(width: 3), 
                          Flexible( 
                            child: Text(
                              item.nome,
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).toList(),
                ),
              ),


              // separador
              Row(                
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: .6, color: Colors.black))
                    ),
                  ),
                ),            
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text("tem também", style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic),),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: .6, color: Colors.black))
                    ),
                  ),
                ),            
              ],),

              // outros itens
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 25),
                child: Text(
                    suite.itens.join(", "),
                    softWrap: true,
                  )
              ),
              const Spacer(),

            ],),
          ),
        ),
      ),
    );
  }
}