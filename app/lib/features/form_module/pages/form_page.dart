import 'package:flutter/material.dart';
import 'package:sytex_coding_challenge/core/enviroment/sytex_colors.dart';
import 'package:sytex_coding_challenge/features/form_module/components/form_container/cubit/form_container_cubit.dart';
import 'package:sytex_coding_challenge/features/form_module/components/form_container/presentation/form_container_component.dart';
import 'package:sytex_coding_challenge/helpers/abstractions/event_bus.dart';
import 'package:sytex_coding_challenge/ioc/ioc_manager.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SytexColors.scaffoldBackgroundColor,
      body: FormContainerComponent(
        formContainerCubit: IocManager.instance!.resolve<FormContainerCubit>(),
        serviceBus: IocManager.instance!.resolve<ServiceBus>(),
      ),
    );
  }
}
