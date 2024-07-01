import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../binding/global_data_provider.dart';
import '../com/rest_api.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const String routeName = '/home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final RestApi _restApi = RestApi();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double anchoImg =
        MediaQuery.of(context).size.width <= MediaQuery.of(context).size.height
            ? MediaQuery.of(context).size.width / 1.5
            : MediaQuery.of(context).size.height / 2;

    GlobalDataProvider gdp =
        Provider.of<GlobalDataProvider>(context, listen: true);
    _restApi.fetchConfiguration().then((value) {
      gdp.setVersion(value?.version ?? '');
      gdp.setWelcome(value?.welcomeMessage ?? '');
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        actions: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 3, bottom: 3),
                  child: Image(
                    fit: BoxFit.fitHeight,
                    height: 50,
                    image: AssetImage('images/logo.png'),
                  ),
                ),
                Text(
                  "e-Commerce Gapsi",
                  style: TextStyle(color: Colors.blueGrey, fontSize: 20),
                ),
              ],
            ),
          ),
        ],
        iconTheme: IconThemeData(color: Colors.brown),
      ),
      body: Expanded(
        flex: 1,
        child: Container(
          color: Colors.white,
          child: Expanded(
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: anchoImg,
                      height: anchoImg,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        image: DecorationImage(
                          image: AssetImage('images/alex.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.circular(anchoImg)),
                        border: Border.all(
                          color: Colors.blueAccent,
                          width: 4.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      gdp.welcome,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueGrey,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              Colors.lightBlueAccent),
                          textStyle: MaterialStateProperty.all(
                              TextStyle(fontSize: 20)),
                        ),
                        onPressed: () {
                          Get.toNamed("/admin");
                        },
                        child: Tooltip(
                          message: "Ir a la administración de proveedores.",
                          child: Text(
                            'Continuar',
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                  ]),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Expanded(
        child: Container(
          color: Colors.white70,
          child: Text(
            gdp.version,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.blueGrey,
            ),
          ),
        ),
      ),
    );
  }
}
