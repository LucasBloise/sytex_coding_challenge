
import 'package:flutter_bloc/flutter_bloc.dart';

part 'input_chip_state.dart';

class InputChipCubit extends Cubit<InputChipState> {
  InputChipCubit() : super(InputChipState());

  void setNewIndex(int index){
    emit(InputChipState(index: index));
  }

  void cleanSelection(){
    emit(InputChipState());
  }

}
