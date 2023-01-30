import 'package:flutter/material.dart';
import 'package:sytex_coding_challenge/core/entities/form_questions_entity.dart';
import 'package:sytex_coding_challenge/core/enviroment/sytex_colors.dart';

class FormContainerHeader extends StatelessWidget {
  const FormContainerHeader({
    super.key,
    required FormQuestionsEntity formQuestionsEntity,
  }) : _formQuestionsEntity = formQuestionsEntity;

  final FormQuestionsEntity _formQuestionsEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _formQuestionsEntity.name,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 32,
            color: SytexColors.textTitleColor,
          ),
        ),
        Text(
          _formQuestionsEntity.description,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.black54,
            letterSpacing: 1.1,
            height: 1.4,
          ),
        )
      ],
    );
  }
}
