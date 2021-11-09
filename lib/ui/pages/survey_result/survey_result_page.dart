import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/components.dart';
import '../../helpers/helpers.dart';
import '../pages.dart';
import 'components/components.dart';

class SurveyResultPage extends StatefulWidget {
  final SurveyResultPresenter presenter;

  const SurveyResultPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<SurveyResultPage> createState() => _SurveyResultPageState();
}

class _SurveyResultPageState extends State<SurveyResultPage> {
  @override
  void initState() {
    
    /*widget.presenter.isLoadingStream.listen((isLoading) {
      if (isLoading == true && mounted == true) {
        showLoading(context);
      } else {
        hideLoading(context);
      }
    });*/
      widget.presenter.isSessionExpiredStream.listen((isExpired) {
      if (isExpired == true) {
        Get.offAllNamed('/login');
      }
    });
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(R.strings.surveys),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) {
          widget.presenter.loadData();
          return StreamBuilder<UiError>(
              stream: widget.presenter.surveyResultErrorStream,
              initialData: UiError.no_error,
              builder: (context, error) {
                if (error.hasData && error.data == UiError.no_error) {
                  return StreamBuilder<SurveyResultViewModel>(
                    stream: widget.presenter.surveyResultStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SurveyResult(viweModel: snapshot.data!,onSave: widget.presenter.save);
                      }
                      return const SizedBox();
                    },
                  );
                } else if (error.hasData && error.data != UiError.no_error) {
                  return ReloadScreen(
                    error: error.data!.description,
                    reload: widget.presenter.loadData,
                  );
                } else {
                  return const SizedBox();
                }
              });
        },
      ),
    );
  }
}
