import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import '../constanst/localization_constants.dart';

extension CurrencyExtension on num {
  String get toCurrency {
    return Formatter.currencyFormatter(this);
  }
}

class Formatter {
  //static BuildContext get context => GetIt.I<AppState>().currentContext;
  //static String get languageCode => Localizations.localeOf(context).languageCode;

  static Future<void> initializeFormatter() async {
    return initializeDateFormatting(LocalizationConstants.localCurrency);
  }

  static String currencyFormatter(num? value, {int decimalDigits = 0}) {
    final numberFormat = NumberFormat.currency(
      locale: LocalizationConstants.localCurrency,
      decimalDigits: decimalDigits,
      name: '',
    );
    return numberFormat.format(value).trim();
  }

  static String dateFormatter(DateTime date) {
    final _dateFormatter = DateFormat(
      "dd 'd'e MMMM 'd'e yyyy",
      LocalizationConstants.localCurrency,
    );
    return _dateFormatter.format(date);
  }

  static String dateFormatterString(String date) {
    final _dateFormatter = DateFormat(
      "dd 'd'e MMMM 'd'e yyyy",
      LocalizationConstants.localCurrency,
    );
    return _dateFormatter.format(DateTime.parse(date));
  }

  static String timestampFormatter(String date) {
    final rawDate = DateTime.parse(date).toLocal();
    return DateFormat(
      'dd MMM yyyy',
      LocalizationConstants.localCurrency,
    ).format(rawDate);
  }

  static String dateMessageFormatter(DateTime date) {
    final DateFormat formatter = DateFormat.MMMMd('ES-CO');
    return formatter.format(date);
  }

  static String timeFormatter(String date) {
    final rawDate = DateTime.parse(date).toLocal();
    final _timeFormatter = DateFormat('HH:mm', LocalizationConstants.localCurrency);
    return _timeFormatter.format(rawDate);
  }
   static String timeFormatterAMPM(String date) {
    final rawDate = DateTime.parse(date).toLocal();
    final _timeFormatter = DateFormat('a', LocalizationConstants.localCurrency);
    return _timeFormatter.format(rawDate);
  }

  static String documentFormatter(num value) {
    final numberFormat = NumberFormat.decimalPattern(LocalizationConstants.localCurrency);
    return numberFormat.format(value).trim();
  }

  static String phoneNumberFormatter(String phoneNumber) {
    final _phoneNumberFormatter = NumberFormat.decimalPattern(LocalizationConstants.localCurrency);
    return _phoneNumberFormatter.format(int.parse(phoneNumber)).trim();
  }

  static String ucFirst(String str) {
    return str.substring(0, 1).toUpperCase() + str.substring(1);
  }
}
