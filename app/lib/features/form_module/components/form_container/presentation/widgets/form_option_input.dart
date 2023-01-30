import 'package:flutter/material.dart';
import 'package:sytex_coding_challenge/core/entities/form_questions_entity.dart';
import 'package:sytex_coding_challenge/core/enviroment/sytex_colors.dart';
import 'package:sytex_coding_challenge/features/form_module/components/input_chip/cubit/input_chip_cubit.dart';
import 'package:sytex_coding_challenge/features/form_module/components/input_chip/presentation/input_chip_component.dart';
import 'package:sytex_coding_challenge/helpers/abstractions/event_bus.dart';
import 'package:sytex_coding_challenge/ioc/ioc_manager.dart';

class PageOptionInput extends StatelessWidget {
  final Content _questionContent;
  final ServiceBus _serviceBus;
  final int _pageIndex;
  const PageOptionInput(
      {super.key, required Content questionContent, required ServiceBus serviceBus, required int pageIndex})
      : _questionContent = questionContent,
        _serviceBus = serviceBus,
        _pageIndex = pageIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _questionContent.label!,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 32,
              color: SytexColors.textTitleColor,
            ),
          ),
          InputChipComponent(
            pageIndex: _pageIndex,
            serviceBus: _serviceBus,
            cubit: IocManager.instance!.resolve<InputChipCubit>(),
            questionContent: _questionContent,
          )
        ],
      ),
    );
  }
}
