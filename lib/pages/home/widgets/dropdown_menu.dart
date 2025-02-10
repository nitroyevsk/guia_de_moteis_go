import 'package:flutter/material.dart';

/// Menu dropdown presento no topo da tela
class DropdownMenuRegions extends StatelessWidget {
  DropdownMenuRegions({super.key});
  final List<String> list = <String>['Zona norte', '', '', ''];  

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: list.first,
        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white, ),
        elevation: 16,
        style: const TextStyle(color: Colors.white, fontSize: 14),                    
        underline: Container(
          height: 1,
          color: Colors.white,
        ),
        onChanged:null,
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: TextStyle(color: Colors.white),),
          );
        }).toList(),
      );
  }
}