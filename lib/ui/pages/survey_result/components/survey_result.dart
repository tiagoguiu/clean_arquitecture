import 'package:flutter/material.dart';

import 'components.dart';

class SurveyResult extends StatelessWidget {
  final SurveyResultViewModel viweModel;
  final void Function({required String answer}) onSave;
  const SurveyResult({
    Key? key,
    required this.viweModel,
    required this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index == 0) {
          return Container(
            padding: EdgeInsets.only(top: 40, bottom: 20, left: 20, right: 20),
            child: Text(
              viweModel.question,
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(color: Theme.of(context).disabledColor.withAlpha(90)),
          );
        }
        final answers = viweModel.answers[index-1];
        return GestureDetector(
          onTap: ()=> answers.isCurrentAnswer ? null : onSave(answer: answers.answer),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    answers.image != null
                        ? Image.network(
                            answers.image!,
                            width: 60,
                          )
                        : const SizedBox(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          answers.answer,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    Text(
                      answers.percent,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                    answers.isCurrentAnswer ? ActiveIcon() : DisabledIcon(),
                  ],
                ),
              ),
              Divider(
                height: 1,
              ),
            ],
          ),
        );
      },
      itemCount: viweModel.answers.length + 1,
    );
  }
}

class ActiveIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Icon(
        Icons.check_circle,
        color: Theme.of(context).highlightColor,
      ),
    );
  }
}

class DisabledIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Icon(
        Icons.check_circle,
        color: Theme.of(context).disabledColor,
      ),
    );
  }
}
