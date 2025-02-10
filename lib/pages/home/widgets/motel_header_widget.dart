import 'package:flutter/material.dart';
import 'package:guia_de_moteis_go/models/motel_model.dart';
import 'package:guia_de_moteis_go/pages/register/register_page.dart';

class MotelHeaderWidget extends StatelessWidget {
  final MotelModel motel;
  final bool isTestEnvironment;
  const MotelHeaderWidget({super.key, required this.motel, this.isTestEnvironment =false});

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // motel logo
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ClipOval(
                    child: isTestEnvironment
                    ? Image.asset(
                      motel.logo,
                      width: 45,
                      fit: BoxFit.cover,
                    )
                    : Image.network(
                      motel.logo,
                      width: 45,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
      
                // // Informações do motel
                Expanded(
                  child:  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                                                            
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // nome fantasia
                        Text(
                          motel.fantasia,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 28,
                              fontFamily: 'Roboto',
                              height: 1,
                              color: Colors.black54),
                        ),
      
                        // bairro
                        Text(                                          
                          motel.bairro,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Roboto',
                              color: Colors.black54),
                        ),
                        const SizedBox(height: 8,),
      
                        Row(
                          children: [ 
                            Expanded(
                              child: SizedBox(
                                height: 20,
                                child: OutlinedButton(
                                  onPressed: null,
                                  style: ButtonStyle(             
                                    padding: WidgetStateProperty.all(EdgeInsets.only(left: 7)),                                   
                                    side: WidgetStateProperty.all(
                                      BorderSide(color: Colors.amber)
                                    ),
                                    shape: WidgetStateProperty.all(
                                      RoundedRectangleBorder(                                                                                                      
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                  child: Row(                                    
                                    children: [
                                      Icon(Icons.star, size: 14, color: Colors.amber),
                                      const SizedBox(width: 3),
                                      Text(
                                        motel.media.toString(),
                                        style: TextStyle(fontSize: 11, color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),                            
                            const SizedBox(width: 13),

                            Row(
                              children: [
                                Text("${motel.qtdAvaliacoes} avaliações", 
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
                                ),
                                const Icon(Icons.keyboard_arrow_down, color: Colors.black54, size: 18),
                              ],
                            ),
                            const SizedBox(width: 20),
                            Spacer(),
                          ],
                        )

                      ],
                    ),
                  ),
                ),
      
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.black38,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          );
  }
}