import 'package:flutter/material.dart';
import 'package:sytex_coding_challenge/core/entities/form_questions_entity.dart';
import 'package:sytex_coding_challenge/features/form_module/components/form_container/presentation/widgets/form_container_input_list.dart';
import 'package:sytex_coding_challenge/features/form_module/components/index_animated_counter/cubit/index_animated_counter_cubit.dart';
import 'package:sytex_coding_challenge/helpers/abstractions/event_bus.dart';
import 'package:sytex_coding_challenge/ioc/ioc_manager.dart';

class FormContainerLoaded extends StatelessWidget {
  final FormQuestionsEntity _formQuestionsEntity;

  const FormContainerLoaded({
    super.key,
    required FormQuestionsEntity formQuestionsEntity,
  }) : _formQuestionsEntity = formQuestionsEntity;

  @override
  Widget build(BuildContext context) {
    return FormContainerInputList(
      controller: PageController(),
      cubit: IocManager.instance!.resolve<IndexAnimatedCounterCubit>(),
      formQuestionsEntity: _formQuestionsEntity,
      serviceBus: IocManager.instance!.resolve<ServiceBus>(),
    );
  }
}
