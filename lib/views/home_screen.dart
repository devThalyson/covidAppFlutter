import 'package:covid_app/controller/controller.dart';
import 'package:covid_app/custom_widgets/custom_appbar.dart';
import 'package:covid_app/custom_widgets/data_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = Controller();

  @override
  void initState() {
    super.initState();

    _controller.getData();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      titulo: "Covid status in Brazil",
      child: _body(),
    );
  }

  _body() {
    return Observer(
      builder: (_) {
        return _controller.data != null
            ? MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  itemCount: _controller.data.length,
                  itemBuilder: (context, index) {
                    _controller.data.sort(
                      (a, b) => a.state.compareTo(b.state),
                    );
                    var data = _controller.data[index];
                    return DataCard(data);
                  },
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
