import 'package:flutter/material.dart';
import '../../../core/constanst/ui_constans.dart';
import '../../../core/formatter/formatter.dart';
import '../../../models/travel.dart';
import '../../styles/palette.dart';

class CardHeaderTravel extends StatelessWidget {
  const CardHeaderTravel({
    Key? key,
    required this.name,
    required this.date,
    required this.travel,
  }) : super(key: key);
  final String name;
  final String date;
  final List<Travel> travel;

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    for (Travel item in travel) {
      if (item.done == false) {
        counter++;
      }
    }
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: UIConstants.buttonQuartSize, horizontal: UIConstants.buttonQuartSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Buenos días $name'),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Today',
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                            fontSize: 22,
                          ),
                    ),
                    Text(Formatter.timestampFormatter(date),
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                              fontSize: 18,
                            )),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Text(
                      'Completados',
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          ?.copyWith(fontSize: 22, color: Palette.tractoGreen),
                    ),
                    Row(
                      children: [
                        Text('$counter',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(fontSize: 18, color: Palette.red)),
                        Text(' /',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(fontSize: 18, color: Palette.tractoGreen)),
                        Text('${travel.length}',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(fontSize: 18, color: Palette.tractoGreen)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
