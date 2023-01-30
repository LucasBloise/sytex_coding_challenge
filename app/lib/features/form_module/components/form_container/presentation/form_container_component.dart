import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sytex_coding_challenge/features/form_module/components/form_container/cubit/form_container_cubit.dart';
import 'package:sytex_coding_challenge/features/form_module/components/form_container/cubit/form_container_state.dart';
import 'package:sytex_coding_challenge/features/form_module/components/form_container/presentation/widgets/form_container_loaded.dart';
import 'package:sytex_coding_challenge/features/form_module/use_cases/answer_question_use_case/input_output/answer_question_input.dart';
import 'package:sytex_coding_challenge/helpers/abstractions/event_bus.dart';

class FormContainerComponent extends StatefulWidget {
  final FormContainerCubit _formContainerCubit;
  final ServiceBus _serviceBus;
  const FormContainerComponent({
    super.key,
    required FormContainerCubit formContainerCubit,
    required ServiceBus serviceBus,
  })  : _formContainerCubit = formContainerCubit,
        _serviceBus = serviceBus;

  @override
  State<FormContainerComponent> createState() => _FormContainerComponentState();
}

class _FormContainerComponentState extends State<FormContainerComponent> implements ServiceBusSubscriber {
  @override
  void initState() {
    widget._serviceBus.subscribe(this, 'save_answer');
    super.initState();
  }

  @override
  void dispose() {
    widget._serviceBus.unsubscribe(this, 'save_answer');
    super.dispose();
  }

  @override
  Future<void> onEventPublished(Map<String, dynamic> data, String event) async {
    if (event == 'save_answer' && data['input'] is AnswerQuestionInput) {
      await widget._formContainerCubit.saveAnswer(data['input'] as AnswerQuestionInput);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget._formContainerCubit..getData(),
      child: BlocConsumer<FormContainerCubit, FormContainerState>(
        buildWhen: (oldState, newState) => newState is! ConnectionError,
        listener: (listenerContext, newState) async {
          if (newState is ConnectionError) {}
        },
        builder: _buildByState,
      ),
    );
  }

  Widget _buildByState(
    BuildContext context,
    FormContainerState state,
  ) {
    if (state is Loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is Error) {
      return const Text("Error");
    } else if (state is Loaded) {
      return FormContainerLoaded(
        formQuestionsEntity: state.formQuestionsEntity,
      );
    }
    return const SizedBox.shrink();
  }
}
