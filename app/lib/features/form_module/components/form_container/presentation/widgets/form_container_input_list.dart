import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:sytex_coding_challenge/core/entities/form_questions_entity.dart';
import 'package:sytex_coding_challenge/core/enviroment/sytex_colors.dart';
import 'package:sytex_coding_challenge/features/form_module/components/form_container/presentation/widgets/form_group.dart';
import 'package:sytex_coding_challenge/features/form_module/components/form_container/presentation/widgets/form_option_input.dart';
import 'package:sytex_coding_challenge/features/form_module/components/form_container/presentation/widgets/form_text_input.dart';
import 'package:sytex_coding_challenge/features/form_module/components/form_container/presentation/widgets/form_yes_no_input.dart';
import 'package:sytex_coding_challenge/features/form_module/components/index_animated_counter/cubit/index_animated_counter_cubit.dart';
import 'package:sytex_coding_challenge/features/form_module/components/index_animated_counter/presentation/index_animated_counter.dart';
import 'package:sytex_coding_challenge/helpers/abstractions/event_bus.dart';

class FormContainerInputList extends StatelessWidget {
  final FormQuestionsEntity _formQuestionsEntity;
  final IndexAnimatedCounterCubit _cubit;
  final PageController _controller;
  final ServiceBus _serviceBus;
  const FormContainerInputList({
    super.key,
    required FormQuestionsEntity formQuestionsEntity,
    required PageController controller,
    required IndexAnimatedCounterCubit cubit,
    required ServiceBus serviceBus,
  })  : _cubit = cubit,
        _controller = controller,
        _formQuestionsEntity = formQuestionsEntity,
        _serviceBus = serviceBus;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          IndexAnimatedCounterComponent(
            questionsAmount: _formQuestionsEntity.content.length,
            cubit: _cubit,
            pageController: _controller,
          ),
          Expanded(
            child: PageView.builder(
                controller: _controller,
                itemCount: _formQuestionsEntity.content.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                'Welcome to ${_formQuestionsEntity.name}',
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 48,
                                  wordSpacing: 1.5,
                                  letterSpacing: 1.5,
                                  color: SytexColors.textTitleColor,
                                ),
                                speed: const Duration(milliseconds: 100),
                              ),
                              TypewriterAnimatedText(
                                _formQuestionsEntity.description,
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 48,
                                  wordSpacing: 1.5,
                                  letterSpacing: 1.5,
                                  color: SytexColors.textTitleColor,
                                ),
                                speed: const Duration(milliseconds: 100),
                              ),
                            ],
                            repeatForever: true,
                            pause: const Duration(milliseconds: 200),
                          ),
                          getInputWidget(index)
                        ],
                      ),
                    );
                  }

                  return getInputWidget(index);
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: SizedBox(
                  height: 80,
                  child: Center(
                    child: IconButton(
                      onPressed: _decrementPage,
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 48,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: SizedBox(
                  height: 80,
                  child: Center(
                    child: IconButton(
                      onPressed: _incrementPage,
                      icon: const Icon(
                        Icons.arrow_forward,
                        size: 48,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget getInputWidget(int index) {
    switch (_formQuestionsEntity.content[index].inputType) {
      case InputType.textInput:
        return PageTextInput(
          questionContent: _formQuestionsEntity.content[index],
          pageIndex: index,
          serviceBus: _serviceBus,
        );
      case InputType.options:
        return PageOptionInput(
          pageIndex: index,
          questionContent: _formQuestionsEntity.content[index],
          serviceBus: _serviceBus,
        );
      case InputType.yesNo:
        return PageYesNoInput(
          questionContent: _formQuestionsEntity.content[index],
          pageIndex: index,
          serviceBus: _serviceBus,
        );
      default:
        return PageFormGroup(
          groupContent: _formQuestionsEntity.content[index],
        );
    }
  }

  void _incrementPage() {
    _serviceBus.publish({'index': _cubit.state.index}, 'page_changued');
    _controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    _cubit.onIncrement(questionsAmount: _formQuestionsEntity.content.length);
  }

  void _decrementPage() {
    _serviceBus.publish({'index': _cubit.state.index}, 'page_changued');
    _controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    _cubit.onDecrement();
  }
}
