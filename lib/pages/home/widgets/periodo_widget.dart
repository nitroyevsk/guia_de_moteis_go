import 'package:flutter/material.dart';
import 'package:guia_de_moteis_go/models/periodo_model.dart';
import 'package:guia_de_moteis_go/pages/register/register_page.dart';

class PeriodoSuiteWidget extends StatelessWidget {
  final double screenWidth;
  final PeriodoModel periodo;
  const PeriodoSuiteWidget({super.key, required this.periodo, required this.screenWidth});

  int _discountInPercentage(double value, double totalValue) {
    if (totalValue == 0) return 0; // Evita divisão por zero
    return (((totalValue - value) / totalValue) * 100).round();
  }



  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: const Key("periodo_widget_key"),  
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegisterPage()),
        );
      },                                        
      child: Padding(
        padding: const EdgeInsets.only(left:15, top: 7, right: 15),
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),                                      
          width: screenWidth*.93,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))
      
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(periodo.timeFormatted, style: TextStyle(fontSize: 21),),
                
                        // box de desconto
                        periodo.discount == null ? SizedBox()
                        : SizedBox(
                          height: 25,
                          
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: OutlinedButton(
                                onPressed: null,                        
                                style: ButtonStyle(             
                                  padding: WidgetStateProperty.all(EdgeInsets.only(left: 1)),                                   
                                  side: WidgetStateProperty.all(
                                    BorderSide(color: Colors.green)
                                  ),
                                    shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(                                                                                                      
                                    borderRadius:
                                        BorderRadius.circular(15),
                                  ),
                                )),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${_discountInPercentage(periodo.totalValue, periodo.value)}% off",
                                      style: TextStyle(fontSize: 11, color: Colors.green),
                                    ),
                                  ],
                                ),
                              ),
                          ),
                        )
                      ],
                    ),
                
                    // valor e valor descontado
                    Row(
                      children: [
                        periodo.discount != null 
                        ? Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Text(
                            "R\$ ${periodo.value}", 
                            style: TextStyle(
                              fontSize: 21, 
                              color: Colors.black45, 
                              decoration: TextDecoration.lineThrough, 
                              decorationColor: Colors.black45
                            )
                          ),
                        ) 
                        : SizedBox(),        
                
                        Text("R\$ ${periodo.totalValue}", style: TextStyle(fontSize: 21))
                      ],
                    ),
                  ],
                ),

                Icon(Icons.keyboard_arrow_right_outlined)
              ],
            ),
          )
        )
      ),
    );
  }
}