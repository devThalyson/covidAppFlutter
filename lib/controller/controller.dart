import 'package:covid_app/api/api.dart';
import 'package:covid_app/model/covid_stats.dart';
import 'package:covid_app/model/data.dart';
import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {
  @observable
  List<Data> data;

  @action
  getData() async {
    CovidStats cs = await Api.getCovidStats();
    data = cs.data;
    print("###### Dados Carregados ######");
  }
}
