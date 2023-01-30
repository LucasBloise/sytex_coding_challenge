import 'package:flutter/material.dart';
import 'package:sytex_coding_challenge/core/entities/form_questions_entity.dart';
import 'package:sytex_coding_challenge/core/enviroment/sytex_colors.dart';
import 'package:sytex_coding_challenge/features/form_module/use_cases/answer_question_use_case/input_output/answer_question_input.dart';
import 'package:sytex_coding_challenge/helpers/abstractions/event_bus.dart';

class PageTextInput extends StatefulWidget {
  final ServiceBus _serviceBus;
  final int _pageIndex;
  final Content _questionContent;

  const PageTextInput({
    Key? key,
    required Content questionContent,
    required ServiceBus serviceBus,
    required int pageIndex,
  })  : _questionContent = questionContent,
        _serviceBus = serviceBus,
        _pageIndex = pageIndex,
        super(key: key);

  @override
  State<PageTextInput> createState() => _PageTextInputState();
}

class _PageTextInputState extends State<PageTextInput> implements ServiceBusSubscriber {
  final TextEditingController _textEditingController = TextEditingController();

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
      await saveAnswer();
    }
  }

  Future<void> saveAnswer() {
    return widget._serviceBus.publish(
      {'input': AnswerQuestionInput(answer: getAnswer(), id: widget._questionContent.id)},
      'save_answer',
    );
  }

  String? getAnswer() {
    if (_textEditingController.text.isEmpty) return null;

    return _textEditingController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget._questionContent.label!,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 32,
                color: SytexColors.textTitleColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 26),
              child: TextField(
                controller: _textEditingController,
                onEditingComplete: saveAnswer,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: SytexColors.sytexBlue,
                    ),
                  ),
                  labelText: 'Enter your answer',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
