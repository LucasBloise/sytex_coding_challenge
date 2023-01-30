// Mocks generated by Mockito 5.3.2 from annotations
// in sytex_coding_challenge/test/feature/form_feature/components/form_cubit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:sytex_coding_challenge/features/form_module/use_cases/answer_question_use_case/input_output/answer_question_input.dart'
    as _i8;
import 'package:sytex_coding_challenge/features/form_module/use_cases/answer_question_use_case/input_output/answer_question_output.dart'
    as _i3;
import 'package:sytex_coding_challenge/features/form_module/use_cases/answer_question_use_case/interactor/answer_question_use_case.dart'
    as _i7;
import 'package:sytex_coding_challenge/features/form_module/use_cases/get_form_questions_use_case/input_output/get_form_questions_output.dart'
    as _i2;
import 'package:sytex_coding_challenge/features/form_module/use_cases/get_form_questions_use_case/interactor/get_form_questions_use_case.dart'
    as _i6;
import 'package:sytex_coding_challenge/helpers/abstractions/connection_helper.dart'
    as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeGetFormQuestionsOutput_0 extends _i1.SmartFake
    implements _i2.GetFormQuestionsOutput {
  _FakeGetFormQuestionsOutput_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAnswerQuestionOutput_1 extends _i1.SmartFake
    implements _i3.AnswerQuestionOutput {
  _FakeAnswerQuestionOutput_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ConnectionHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockConnectionHelper extends _i1.Mock implements _i4.ConnectionHelper {
  @override
  _i5.Future<bool> isConnected() => (super.noSuchMethod(
        Invocation.method(
          #isConnected,
          [],
        ),
        returnValue: _i5.Future<bool>.value(false),
        returnValueForMissingStub: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}

/// A class which mocks [GetFormQuestionsUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetFormQuestionsUseCase extends _i1.Mock
    implements _i6.GetFormQuestionsUseCase {
  @override
  _i5.Future<_i2.GetFormQuestionsOutput> execute() => (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue: _i5.Future<_i2.GetFormQuestionsOutput>.value(
            _FakeGetFormQuestionsOutput_0(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
        returnValueForMissingStub: _i5.Future<_i2.GetFormQuestionsOutput>.value(
            _FakeGetFormQuestionsOutput_0(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i5.Future<_i2.GetFormQuestionsOutput>);
}

/// A class which mocks [AnswerQuestionUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockAnswerQuestionUseCase extends _i1.Mock
    implements _i7.AnswerQuestionUseCase {
  @override
  _i5.Future<_i3.AnswerQuestionOutput> execute(
          _i8.AnswerQuestionInput? input) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [input],
        ),
        returnValue: _i5.Future<_i3.AnswerQuestionOutput>.value(
            _FakeAnswerQuestionOutput_1(
          this,
          Invocation.method(
            #execute,
            [input],
          ),
        )),
        returnValueForMissingStub: _i5.Future<_i3.AnswerQuestionOutput>.value(
            _FakeAnswerQuestionOutput_1(
          this,
          Invocation.method(
            #execute,
            [input],
          ),
        )),
      ) as _i5.Future<_i3.AnswerQuestionOutput>);
}
