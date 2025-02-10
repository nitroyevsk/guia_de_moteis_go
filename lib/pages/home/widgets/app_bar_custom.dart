import 'package:flutter/material.dart';
import 'package:guia_de_moteis_go/pages/register/register_page.dart';


// AppBar contendo os botoes de menu, pesquisa, 'ir agora' e 'outro dia'
class AppBarCustom extends StatelessWidget {
  const AppBarCustom({super.key});

  @override
  Widget build(BuildContext context) {    
    double iconSize = 30;


    return SizedBox.expand(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterPage()),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[ 
                // menu icon
                Expanded(child: Icon(Icons.menu, color: Colors.white, size: iconSize,)),

                // tabs
                Expanded(flex: 4, 
                  child: Container(
                    height: iconSize + 10,
                    decoration: BoxDecoration(
                        color:  Color(0xFFB8000C),
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                    child: Row(children: [
                      
                      Expanded(
                        child: Container(
                          height: iconSize + 10,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          child: Row(
                            
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(child: Icon(Icons.flash_on, color: Color(0xFFD2242E),)),
                              Expanded(
                                flex: 2,
                                child: Text("ir agora", style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),),
                              )
                            ],),
                          )
                        ),
            
                      Expanded(
                        child: Container(
                          height: iconSize + 10,
                          decoration: BoxDecoration(
                            color:Color(0xFFB8000C),
                            borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
            
                          child: Row(                            
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(child: Icon(Icons.event_available, color:Colors.white,)),
                              const SizedBox(width: 3,),
                              Expanded(flex: 2,
                                child: Text("ir outro dia", style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),),
                              )
                            ],),
                          )
                        ),
                    ],),                  
                  )
                ),
            
                // search icon
                Expanded(child: Icon(Icons.search, color: Colors.white, size: iconSize,)),         
              ]),
          ),        
      );
  }
}