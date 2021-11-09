import 'package:flutter/material.dart';

import '../components/components.dart';

mixin LoadingManager {
  void handleLoading(BuildContext context, Stream<bool> stream) {
    stream.listen((isLoading) {
      //se o isloading for true vai mostrar a tela e o teste passa
      if (isLoading) {
        showLoading(context);
      } else {
        hideLoading(context);
      }
    });
  }
}
