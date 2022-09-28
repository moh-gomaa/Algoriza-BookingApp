
import 'package:bloc/bloc.dart';
import 'package:booking_app/features/home/cubit/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int count=0;

  List toolbarColors=List.generate(3, (index) => false);

  void toolbarColorSwitch(index){
    toolbarColors=List.generate(3, (index) => false);
    toolbarColors[index]=! toolbarColors[index];
    emit(ToolBarSwitchSuccess());

  }

  void toolbarSwitch(int value){

    count = value;
    emit(ToolBarSwitchSuccess());

  }


}