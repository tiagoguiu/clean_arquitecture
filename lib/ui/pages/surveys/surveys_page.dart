import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/components.dart';
import '../../helpers/helpers.dart';
import '../pages.dart';
import 'components/components.dart';

class SurveysPage extends StatefulWidget {
  final SurveysPresenter presenter;

  const SurveysPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<SurveysPage> createState() => _SurveysPageState();
}

class _SurveysPageState extends State<SurveysPage> with RouteAware {
  @override
  void initState() {
    /*widget.presenter.isLoadingStream.listen((isLoading) {
      //se o isloading for true vai mostrar a tela e o teste passa
      if (isLoading == true && mounted == true) {
        showLoading(context);
      } else {
        hideLoading(context);
      }
    });*/

    widget.presenter.navigateToStream.listen((page) {
      if (page.isNotEmpty == true) {
        Get.toNamed(page);
      }
    });
    widget.presenter.isSessionExpiredStream.listen((isExpired) {
      if (isExpired == true) {
        Get.offAllNamed('/login');
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.find<RouteObserver>().subscribe(this, ModalRoute.of(context)!);
    return Scaffold(
      appBar: AppBar(
        title: Text(R.strings.surveys),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) {
          widget.presenter.loadData();
          return StreamBuilder<UiError>(
            stream: widget.presenter.surveysErrorStream,
            initialData: UiError.no_error,
            builder: (context, error) {
              if (error.hasData && error.data == UiError.no_error) {
                return StreamBuilder<List<SurveyViewModel>>(
                  stream: widget.presenter.surveyStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: CarouselSlider(
                          items: snapshot.data
                              ?.map((viewModel) => SurveyItem(
                                    viewModel: viewModel,
                                    presenter: widget.presenter,
                                  ))
                              .toList(),
                          options: CarouselOptions(
                            enlargeCenterPage: true, //destaque no item selecionado
                            aspectRatio: 1,
                            //enableInfiniteScroll: false,
                          ),
                        ),
                      );
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
            },
          );
        },
      ),
    );
  }

  @override
  void didPopNext() {
    widget.presenter.loadData();
  }
  @override
  void dispose() {
    Get.find<RouteObserver>().unsubscribe(this);
    super.dispose();
  }
}
