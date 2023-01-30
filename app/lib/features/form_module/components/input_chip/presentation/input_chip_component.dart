import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sytex_coding_challenge/core/entities/form_questions_entity.dart';
import 'package:sytex_coding_challenge/features/form_module/components/input_chip/cubit/input_chip_cubit.dart';
import 'package:sytex_coding_challenge/features/form_module/use_cases/answer_question_use_case/input_output/answer_question_input.dart';
import 'package:sytex_coding_challenge/helpers/abstractions/event_bus.dart';

class InputChipComponent extends StatefulWidget {
  final InputChipCubit _cubit;
  final Content _questionContent;
  final int _pageIndex;
  final ServiceBus _serviceBus;
  const InputChipComponent({
    required ServiceBus serviceBus,
    required int pageIndex,
    required InputChipCubit cubit,
    required Content questionContent,
    Key? key,
  })  : _cubit = cubit,
  _pageIndex = pageIndex,
  _serviceBus = serviceBus,
        _questionContent = questionContent,
        super(key: key);

  @override
  State<InputChipComponent> createState() => _InputChipComponentState();
}

class _InputChipComponentState extends State<InputChipComponent> implements ServiceBusSubscriber{


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
        {'input': AnswerQuestionInput(answer: getAnswer(widget._cubit.state.index), id: widget._questionContent.id)},
        'save_answer',
      );
    }
  }

  String? getAnswer(int? selectedIndex) {
    if (selectedIndex == null) return null;

    return widget._questionContent.options![selectedIndex].value;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InputChipCubit, InputChipState>(
      bloc: widget._cubit,
      listener: (context, state) {},
      builder: (context, state) {
        if (widget._questionContent.options == null) {
          return const SizedBox();
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: widget._questionContent.options!.length,
          itemBuilder: (BuildContext context, int index) {
            return Align(
              alignment: Alignment.centerRight,
              child: InputChip(
                label: Text(
                  widget._questionContent.options![index].label,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                selected: state.index == index,
                selectedColor: const Color(0xff6750a4).withOpacity(0.5),
                onSelected: (bool selected) {
                  if (state.index == index) {
                    widget._cubit.cleanSelection();
                  } else {
                    widget._cubit.setNewIndex(index);
                  }
                },
              ),
            );
          },
        );
      },
    );

    ;
  }
}
