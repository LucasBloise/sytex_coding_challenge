import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:sytex_coding_challenge/core/entities/form_questions_entity.dart';
import 'package:sytex_coding_challenge/core/enviroment/sytex_colors.dart';
import 'package:sytex_coding_challenge/features/form_module/use_cases/answer_question_use_case/input_output/answer_question_input.dart';
import 'package:sytex_coding_challenge/helpers/abstractions/event_bus.dart';
import 'package:toggle_switch/toggle_switch.dart';

class PageYesNoInput extends StatefulWidget {
  final Content _questionContent;
  final ServiceBus _serviceBus;
  final int _pageIndex;

  const PageYesNoInput({
    Key? key,
    required Content questionContent,
    required ServiceBus serviceBus,
    required int pageIndex,
  })  : _questionContent = questionContent,
        _serviceBus = serviceBus,
        _pageIndex = pageIndex,
        super(key: key);

  @override
  State<PageYesNoInput> createState() => _PageYesNoInputState();
}

class _PageYesNoInputState extends State<PageYesNoInput> implements ServiceBusSubscriber {
  bool? _optionSelected;

  @override
  void initState() {
    widget._serviceBus.subscribe(this, 'page_changued');
    super.initState();
  }

  @override
  void dispose() {
    widget._serviceBus.unsubscribe(this, 'page_changued');
    super.dispose();
  }

  @override
  Future<void> onEventPublished(Map<String, dynamic> data, String event) async {
    if (event == 'page_changued' && data['index'] == widget._pageIndex) {
      await widget._serviceBus.publish(
        {'input': AnswerQuestionInput(answer: _optionSelected, id: widget._questionContent.id)},
        'save_answer',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: SytexColors.scaffoldBackgroundColor),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 60, left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    widget._questionContent.label!,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                      color: SytexColors.textTitleColor,
                    ),
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
                isRepeatingAnimation: false,
                pause: const Duration(milliseconds: 200),
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ToggleSwitch(
                    minWidth: 150.0,
                    minHeight: 80,
                    cornerRadius: 20.0,
                    activeBgColors: [
                      [Colors.green[800]!],
                      [Colors.red[800]!]
                    ],
                    customTextStyles: [TextStyle(fontWeight: FontWeight.w400, fontSize: 26, color: Colors.white)],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    initialLabelIndex: 1,
                    totalSwitches: 2,
                    labels: ['Yes', 'No'],
                    radiusStyle: true,
                    onToggle: (index) {
                      _optionSelected = index == 0;
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
