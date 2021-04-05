import 'dart:convert' as convert;

import 'package:covid_app/model/covid_stats.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<CovidStats> getCovidStats() async {
    var url = Uri.https("covid19-brazil-api.now.sh", "/api/report/v1");

    var response = await http.get(url);

    //print(response.body);

    Map mapResponse = convert.json.decode(response.body);

    final covidStats = CovidStats.fromJson(mapResponse);

    return covidStats;
  }
}
