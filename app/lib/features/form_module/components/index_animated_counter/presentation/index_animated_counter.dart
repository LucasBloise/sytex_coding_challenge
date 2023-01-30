import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sytex_coding_challenge/core/enviroment/sytex_colors.dart';
import 'package:sytex_coding_challenge/features/form_module/components/index_animated_counter/cubit/index_animated_counter_cubit.dart';

class IndexAnimatedCounterComponent extends StatelessWidget {
  final IndexAnimatedCounterCubit _cubit;
  final int _questionsAmount;
  final PageController _pageController;
  const IndexAnimatedCounterComponent(
      {required PageController pageController,
      required int questionsAmount,
      required IndexAnimatedCounterCubit cubit,
      Key? key})
      : _cubit = cubit,
        _pageController = pageController,
        _questionsAmount = questionsAmount,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<IndexAnimatedCounterCubit, IndexAnimatedCounterState>(
      bloc: _cubit
        ..setPageController(_pageController)
        ..listenToCurrentPage(),
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (int i = 0; i < _questionsAmount; i++)
                AnimatedContainer(
                  decoration: BoxDecoration(
                      color: state.index == i ? SytexColors.sytexBlue : Colors.grey, shape: BoxShape.circle),
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.only(top: 10),
                  width: state.index == i ? 20 : 15,
                  height: state.index == i ? 20 : 15,
                )
            ],
          ),
        );
      },
    );
  }
}
