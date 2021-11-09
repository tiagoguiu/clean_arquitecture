


import 'package:flutter/material.dart';

import '../../../../ui/pages/pages.dart';
import 'surveys_presenter_factory.dart';

Widget makeSurveysPage(){
  return SurveysPage(
    presenter: makeGetxSurveysPresenter(),
  );
}
//COMPOSIÇÃO PARA USAR GETX SÓMENTE TROCAR GETX POR STREAMS