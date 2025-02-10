import 'package:flutter/material.dart';

class ImagesPage extends StatelessWidget {
  final String nome;
  final List<String> images;
  final bool isTestEnvironment;
  const ImagesPage({super.key, required this.nome, required this.images, this.isTestEnvironment = false});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text(nome, style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic ),),),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, size: 15,)),        
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < images.length; i += 3) 
              Column(
                children: [
                  // Imagem 1 - Ocupa toda a largura
                  if (i < images.length)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child:  isTestEnvironment ?                      
                        Image.asset(
                          images[i],
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )

                        : Image.network(
                          images[i],
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                    ),
                  // Imagens 2 e 3 - Dividem a largura
                  if (i + 1 < images.length)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: isTestEnvironment
                            ? Image.asset(
                              images[i + 1],
                              fit: BoxFit.cover,
                            )
                            : Image.network(
                              images[i + 1],
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10,),
                          if (i + 2 < images.length)
                            Expanded(
                              child: isTestEnvironment
                              ? Image.asset(
                                images[i + 2],
                                fit: BoxFit.cover,
                              )
                              : Image.network(
                                images[i + 2],
                                fit: BoxFit.cover,
                              ),
                            ),
                        ],
                      ),
                    ),
                ],
              ),
          ],
        ),
      )
        
    );
  }
}