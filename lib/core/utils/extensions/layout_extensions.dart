import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/resources/constants/constants.dart';

extension LayoutX on dynamic {
  Widget safeArea() => SafeArea(child: this);

  Widget wholePadding() => Padding(
        padding:
            EdgeInsets.only(right: side, left: side, top: top, bottom: bottom),
        child: this,
      );
}
