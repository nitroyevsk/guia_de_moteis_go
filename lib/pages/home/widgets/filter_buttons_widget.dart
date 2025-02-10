import 'package:flutter/material.dart';

class FilterButtonsWidget extends StatelessWidget {
  FilterButtonsWidget({super.key});
  final List<String> buttonFilters = [
    "com desconto",
    "disponíveis",
    "hidro",
    "piscina",
    "sauna"
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: .4, color: Colors.grey))),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 18, bottom: 10, top: 10),
            child: Row(
              children: [
                OutlinedButton(
                  onPressed: null,
                  style: ButtonStyle(
                      shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  )),
                  child: Row(
                    children: [
                      Icon(
                        Icons.tune,
                        size: 21,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "filtros",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: buttonFilters
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: OutlinedButton(
                            onPressed: null,
                            style: ButtonStyle(
                                shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(8),
                              ),
                            )),
                            child: Text(
                              e,
                              style: TextStyle(color: Colors.black54),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      );
  }
}