import 'package:booking_app/resources/constants/constants.dart';

extension StringX on String {

  String tempC() => '${this} \u00B0';

  String rmvTralling() => this.replaceAll(regexpSuffix, '');

  String rmvLeading() => this.replaceAll(regexpPrefix, '');

  String cleanString() => this.rmvLeading().rmvTralling();

}

