import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guia_de_moteis_go/bloc/moteis_bloc.dart';
import 'package:guia_de_moteis_go/data/data_provider/guia_moteis_data_provider.dart';
import 'package:guia_de_moteis_go/data/repository/moteis_repository.dart';
import 'package:guia_de_moteis_go/pages/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => MoteisRepository(MoteisDataProvider()), // fornecendo a instancia do repositoryProvider
      child: BlocProvider(
        create: (context) => MoteisBloc(context.read<MoteisRepository>()), // fornecendo a instancia do bloc e obtendo a instancia do repository
        child: MaterialApp(
          title: 'Guia de Motéis GO',
          theme: ThemeData(        
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,surface: Color(0xFFD2242E)),
            useMaterial3: true,        
          ), 
          home: Home(),
        ),
      ),
    );
  }
}
