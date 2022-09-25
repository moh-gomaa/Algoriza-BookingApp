import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'x_state.dart';

class XCubit extends Cubit<XState> {
  XCubit() : super(XInitial());
}
