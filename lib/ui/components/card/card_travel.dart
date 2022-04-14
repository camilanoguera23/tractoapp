import 'package:flutter/material.dart';

import '../../../core/constanst/ui_constans.dart';
import '../../../core/formatter/formatter.dart';
import '../../styles/palette.dart';

class CardTravel extends StatelessWidget {
  const CardTravel(
      {Key? key, required this.name, required this.ruta, required this.date, required this.done})
      : super(key: key);
  final String name;
  final String ruta;
  final String date;
  final bool done;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.symmetric(vertical: UIConstants.marginCardTravel),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: UIConstants.buttonHalfSize, horizontal: UIConstants.buttonQuartSize),
          child: Row(
            children: [
              Column(
                children: [
                  Text(Formatter.timeFormatter(date), style: Theme.of(context).textTheme.headline5?.copyWith(fontSize: 18,)),
                  Text(Formatter.timeFormatterAMPM(date),  style: Theme.of(context).textTheme.headline5?.copyWith(fontSize: 18),)
                ],
              ),
              const SizedBox(width: UIConstants.buttonQuartSize),
              Column(
                children: [
                  Text(name,  style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 18),),
                  Text(
                    ruta,
                    style: Theme.of(context).textTheme.headline5?.copyWith(fontSize: 15),
                  ),
                ],
              ),
              const Spacer(),
              const InkWell(
                child: Icon(Icons.star_border),
              ),
              const SizedBox(width: UIConstants.buttonQuartSize),
              Icon(Icons.circle_sharp, color: done ? Palette.tractoGreen : Palette.red)
            ],
          ),
        ));
  }
}
