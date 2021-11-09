import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_presenter.dart';

class SplashPage extends StatefulWidget {
  final SplashPresenter presenter;

  SplashPage({required this.presenter});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    widget.presenter.navigateToStream.listen((page) {
      if (page.isNotEmpty == true) {
        Get.offAllNamed(page);
      }
    });

    widget.presenter.checkAccount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('4 DEV'),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
