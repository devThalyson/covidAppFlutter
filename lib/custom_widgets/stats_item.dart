import 'package:covid_app/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class StatsItem extends StatelessWidget {
  final String image;
  final String info;
  final String dataInfo;

  StatsItem(this.image, this.info, this.dataInfo);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(3),
            height: 30,
            width: 30,
            child: Image.asset(image),
          ),
          Container(
            child: CustomText(
              texto: "$info: $dataInfo",
              bold: true,
            ),
          ),
        ],
      ),
    );
  }
}
