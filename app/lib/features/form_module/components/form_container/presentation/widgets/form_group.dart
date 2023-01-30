
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:sytex_coding_challenge/core/entities/form_questions_entity.dart';
import 'package:sytex_coding_challenge/core/enviroment/sytex_colors.dart';

class PageFormGroup extends StatelessWidget {
  const PageFormGroup({
    super.key,
    required Content groupContent,
  }) : _groupContent = groupContent;

  final Content _groupContent;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Lets go with ${_groupContent.name!}',
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
              isRepeatingAnimation: false,
              pause: const Duration(milliseconds: 200),
            ),
          ),
        ),
      ),
    );
  }
}
