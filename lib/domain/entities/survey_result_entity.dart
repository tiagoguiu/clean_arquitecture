
import 'package:curso_manguinho/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

class SurveyResultEntity extends Equatable {
  final String surveyId;
  final String question;
  final List<SurveyAnswerEntity> answers;

  @override
  List get props => [surveyId, question, answers];

  SurveyResultEntity({
    required this.surveyId,
    required this.question,
    required this.answers,
  });

}
