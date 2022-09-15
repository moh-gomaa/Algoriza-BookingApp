import 'package:intl/intl.dart';

class DateTimeUtil {
  DateTime _timestampToDateTime({required int timestamp}) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  }

  String ShortDateFormat(
      {required dynamic date,
      required bool isTimestamp,
      required String lang}) {
    DateTime? _date;
    if (isTimestamp)
      _date = _timestampToDateTime(timestamp: date);
    else
      _date = DateTime.tryParse(date);

    if (_date != null) {
      if (lang == 'ar') {
        return DateFormat("yyyy-M-d", 'en_US').format(_date);
      } else {
        return DateFormat("d-M-yyyy", 'en_US').format(_date);
      }
    }
    return '';
  }

  String ShortDateWithTimeFormat(
      {required dynamic date,
      required bool isTimestamp,
      required String lang}) {
    DateTime? _date;
    if (isTimestamp)
      _date = _timestampToDateTime(timestamp: date);
    else
      _date = DateTime.tryParse(date);

    if (_date != null) {
      if (lang == 'ar') {
        return DateFormat("yyyy-M-d  hh:mm a", 'en_US').format(_date);
      } else {
        return DateFormat("d-M-yyyy  hh:mm a", 'en_US').format(_date);
      }
    }
    return '';
  }

  String fullDayTimeFormat(
      {required dynamic date,
      required bool isTimestamp,
      required String lang}) {
    DateTime? _date;

    if (isTimestamp)
      _date = _timestampToDateTime(timestamp: date);
    else
      _date = DateTime.tryParse(date);

    if (_date != null) {
      if (lang == 'ar') {
        var day = DateFormat.EEEE('ar').format(_date);
        return day;
      } else {
        var day = DateFormat('EEEE hh:mm a', 'en_US').format(_date);
        return day;
      }
    }

    return '';
  }

  String shortDayTimeFormat(
      {required dynamic date,
        required bool isTimestamp,
        required String lang}) {
    DateTime? _date;

    if (isTimestamp)
      _date = _timestampToDateTime(timestamp: date);
    else
      _date = DateTime.tryParse(date);

    if (_date != null) {
      if (lang == 'ar') {
        var day = DateFormat.EEEE('ar').format(_date);
        return day;
      } else {
        var day = DateFormat('EE hh:mm a', 'en_US').format(_date);
        return day;
      }
    }

    return '';
  }

  String dayFormat(
      {required dynamic date,
        required bool isTimestamp,
        required String lang}) {
    DateTime? _date;

    if (isTimestamp)
      _date = _timestampToDateTime(timestamp: date);
    else
      _date = DateTime.tryParse(date);

    if (_date != null) {
      if (lang == 'ar') {
        var day = DateFormat.EEEE('ar').format(_date);
        return day;
      } else {
        var day = DateFormat('EEEE', 'en_US').format(_date);
        return day;
      }
    }

    return '';
  }

  String hourFormat(
      {required dynamic date,
        required bool isTimestamp,
        required String lang}) {
    DateTime? _date;

    if (isTimestamp)
      _date = _timestampToDateTime(timestamp: date);
    else
      _date = DateTime.tryParse(date);

    if (_date != null) {
      if (lang == 'ar') {
        var day = DateFormat.EEEE('ar').format(_date);
        return day;
      } else {
        var day = DateFormat('hh a', 'en_US').format(_date);
        return day;
      }
    }

    return '';
  }

  int hourIntegerFormat(
      {required dynamic date,
        required bool isTimestamp,
        required String lang}) {
    DateTime? _date;

    if (isTimestamp)
      _date = _timestampToDateTime(timestamp: date);
    else
      _date = DateTime.tryParse(date);

    if (_date != null) {
      if (lang == 'ar') {
        var day = DateFormat.EEEE('ar').format(_date);
        return int.tryParse(day) ?? 0;
      } else {
        var day = DateFormat('HH', 'en_US').format(_date);
        return int.tryParse(day) ?? 0;
      }
    }

    return 0;
  }
}
