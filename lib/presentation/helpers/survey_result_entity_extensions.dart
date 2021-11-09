import '../../domain/entities/entities.dart';
import '../../ui/pages/survey_result/components/components.dart';

extension SurveyResultEntityExtensions on SurveyResultEntity {
  SurveyResultViewModel toViewModel() => SurveyResultViewModel(
        surveyId: surveyId,
        question: question,
        answers: answers
            .map((answers) => answers.toViewModel())
            .toList(),
      );
}

extension SurveyAnswerEntityExtensions on SurveyAnswerEntity {
  SurveyAnswerViewModel toViewModel() => SurveyAnswerViewModel(
        image: image,
        answer: answer,
        isCurrentAnswer: isCurrentAnswer,
        percent: '$percent%',
      );
}
