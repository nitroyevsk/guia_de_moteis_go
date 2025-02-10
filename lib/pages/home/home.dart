import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guia_de_moteis_go/bloc/moteis_bloc.dart';
import 'package:guia_de_moteis_go/pages/home/widgets/app_bar_custom.dart';
import 'package:guia_de_moteis_go/pages/home/widgets/dropdown_menu.dart';
import 'package:guia_de_moteis_go/pages/home/widgets/filter_buttons_widget.dart';
import 'package:guia_de_moteis_go/pages/home/widgets/foto_motel_widget.dart';
import 'package:guia_de_moteis_go/pages/home/widgets/icones_motel_widget.dart';
import 'package:guia_de_moteis_go/pages/home/widgets/motel_header_widget.dart';
import 'package:guia_de_moteis_go/pages/home/widgets/periodo_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  

  @override
  void initState() {
    context.read<MoteisBloc>().add(MoteisFetchedEvent());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // Custom appbar
      appBar: AppBar(
        leading: AppBarCustom(),
        leadingWidth: screenWidth,
        backgroundColor: Color(0xFFD2242E),
      ),

      //
      body: Column(
        children: [
          // Menu regiões
          Padding(
            padding: const EdgeInsets.only(top: 3, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [DropdownMenuRegions()],
            ),
          ),

          // Widget de conteúdo
          Expanded(
              child: Container(
            width: screenWidth,
            padding: EdgeInsets.only(
              top: 15,
            ),
            decoration: BoxDecoration(
                color: Color(0xFFEFF0F2),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              children: [

                // lista de filtros
                FilterButtonsWidget(),

                // lista de moteis
                BlocBuilder<MoteisBloc, MoteisState>(builder: (context, state) {
                  if (state is MoteisFailureState) {
                    return Center(
                      child: Text(state.error),
                    );
                  }

                  if (state is! MoteisSuccessState) {
                    return Container(
                      padding: EdgeInsets.all(50),
                      child: const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    );
                  }

                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.moteis.length,
                      itemBuilder: (context, index) {
                        final motel = state.moteis[index];
                    
                        return  Column(
                          children: [

                            // motel header
                            MotelHeaderWidget(motel: motel),
                            const SizedBox(height: 20,),

                            // motel suites
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(children: motel.suites.map((suite) => 
                                Column(
                                  children: [
                                    // container com foto e nome
                                    FotoMotelWidget(suite: suite, screenWidth: screenWidth),

                                    // container de icones
                                    IconesMotelWidget(suite: suite, screenWidth: screenWidth),  
                                  
                                    // Column de tempo e preço
                                    Column(
                                      children: suite.periodos.map((periodo) => 
                                        PeriodoSuiteWidget(periodo: periodo, screenWidth: screenWidth)
                                      ).toList(),
                                    ),

                                    SizedBox(height: 30,)
                                  ],
                                ),
                              ).toList()
                            ,),)
                          ],
                        );
                      },
                    ),
                  );                  
                })
              ],
            ),
          ))
        ],
      ),
    );
  }
}
