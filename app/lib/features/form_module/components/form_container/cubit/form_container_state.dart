import 'package:equatable/equatable.dart';
import 'package:sytex_coding_challenge/core/entities/form_questions_entity.dart';

abstract class FormContainerState extends Equatable {
  @override
  List<Object> get props => [];
}

class Initial extends FormContainerState {}

class Loading extends FormContainerState {}

class Loaded extends FormContainerState {
  final FormQuestionsEntity formQuestionsEntity;

  Loaded(
    this.formQuestionsEntity,
  );

  @override
  List<Object> get props => [
        formQuestionsEntity,
      ];
}

class Error extends FormContainerState {
  final String error;

  Error(this.error);

  @override
  List<Object> get props => [error];
}

class ConnectionError extends FormContainerState {}
