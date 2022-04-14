import 'package:flutter/material.dart';
import 'package:tractoapp/ui/components/card/card_travel.dart';

import '../../../core/constanst/ui_constans.dart';
import '../../../models/travel.dart';
import '../../../models/user_travel.dart';
import '../../components/background/background.dart';
import '../../components/botton/botton_action.dart';
import '../../components/card/card_header_travel.dart';
import '../../styles/palette.dart';
import '../gastos/gastos.dart';

const infoquemada = UserTravel(
  name: 'John',
  date: '2022-04-13 15:03:16.795656',
  id: 1,
  listtravel: [
    Travel(name: 'Viaje 1', ruta: 'Ruta 1', date: '2022-04-13 15:03:16.795656', done: true),
    Travel(name: 'Viaje 2', ruta: 'Ruta 2', date: '2022-04-13 15:03:16.795656', done: true),
    Travel(name: 'Viaje 3', ruta: 'Ruta 3', date: '2022-04-13 15:03:16.795656', done: false),
    Travel(name: 'Viaje 4', ruta: 'Ruta 5', date: '2022-04-13 15:03:16.795656', done: false)
  ],
);

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const route = 'Home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Background(
            appBar: AppBar(
              actions: [
                SizedBox(
                  width: constraints.maxWidth,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: UIConstants.buttonHalfSize),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Viaje',
                          style: Theme.of(context).textTheme.headline2?.copyWith(
                                color: Palette.white,
                                fontSize: 30,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                context,
                                Gastos.route,
                              );
                            },
                            child: Ink(
                              child: const Icon(
                                Icons.monetization_on_outlined,
                                color: Palette.yellow,
                                size: 30,
                              ),
                            ))
                      ],
                    ),
                  ),
                )
              ],
              backgroundColor: Palette.darkGrey,
            ),
            children: [
              SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(UIConstants.buttonHalfSize),
                  margin: const EdgeInsets.all(UIConstants.margin),
                  child: ListView(
                    shrinkWrap: false,
                    children: [
                      CardHeaderTravel(
                        name: infoquemada.name,
                        date: infoquemada.date,
                        travel: infoquemada.listtravel,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: infoquemada.listtravel.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CardTravel(
                            name: infoquemada.listtravel[index].name,
                            date: infoquemada.listtravel[index].date,
                            done: infoquemada.listtravel[index].done,
                            ruta: infoquemada.listtravel[index].ruta,
                          );
                        },
                      ),
                      const SizedBox(height: UIConstants.buttonSize),
                      CustomRaisedButton(
                        onPressed: () {},
                        text: 'Tomar viaje',
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
