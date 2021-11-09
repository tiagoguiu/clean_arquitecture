import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../ui/pages/pages.dart';
import 'surveys_result_presenter_factory.dart';

Widget makeSurveyResultPage() {
  return SurveyResultPage(
    presenter: makeGetxSurveyResultPresenter(Get.parameters['survey_id']!),
  );
}
//COMPOSIÇÃO PARA USAR GETX SÓMENTE TROCAR GETX POR STREAMS
