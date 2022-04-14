import 'package:tractoapp/models/travel.dart';

class UserTravel {
  const UserTravel(
      {this.name = '',
      this.id = 1,
      this.listtravel = const [],
      this.date = '2022-04-13 15:03:16.795656'});
  final String name;
  final int id;
  final List<Travel> listtravel;
  final String date;
}
