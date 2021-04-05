import 'package:covid_app/custom_widgets/custom_text.dart';
import 'package:covid_app/custom_widgets/stats_item.dart';
import 'package:covid_app/model/data.dart';
import 'package:covid_app/utils/image_switch.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataCard extends StatelessWidget {
  final Data data;

  DataCard(this.data);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 15,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                child: CustomText(
                  texto: "${data.state} - ${data.uf}",
                  bold: true,
                  tamanhoFonte: 17,
                ),
              ),
              Container(
                height: 30,
                width: 30,
                child: Image.asset(
                  ImageSwtich.imageSwtich(uf: data.uf),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StatsItem("assets/images/cases.png", "Casos", "${data.cases}"),
              StatsItem("assets/images/suspects.png", "Suspeitos",
                  "${data.suspects}"),
            ],
          ),
          StatsItem("assets/images/deaths.png", "Mortos", "${data.deaths}"),
          Container(
            child: CustomText(
              texto: "Dados atualizados pela ultima vez em: ${_dateConvert()}.",
              tamanhoFonte: 13.5,
            ),
          ),
        ],
      ),
    );
  }

  String _dateConvert() {
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");
    var date = DateTime.parse(data.datetime);
    return dateFormat.format(date);
  }
}
