import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'index_animated_counter_state.dart';

class IndexAnimatedCounterCubit extends Cubit<IndexAnimatedCounterState> {
  IndexAnimatedCounterCubit() : super(IndexAnimatedCounterState(index: 0));

  late final PageController pageController;

  void setPageController(PageController pageController) {
    this.pageController = pageController;
  }

  void onIncrement({required int questionsAmount}) {
    if (questionsAmount <= state.index + 1) {
      return;
    }
    final int previuosIndex = state.index;
    emit(IndexAnimatedCounterState(index: previuosIndex + 1));
  }

  void onDecrement() {
    if (state.index <= 0) {
      return;
    }
    final int previuosIndex = state.index;
    emit(IndexAnimatedCounterState(index: previuosIndex - 1));
  }

  void _setCurrentIndex(int index) {
    emit(IndexAnimatedCounterState(index: index));
  }

  void listenToCurrentPage() {
    pageController.addListener(() {
      if (pageController.page!.round() != state.index) {
        _setCurrentIndex(pageController.page!.round());
      }
    });
  }
}
