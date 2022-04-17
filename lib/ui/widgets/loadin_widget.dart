import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LoadingWidget extends StatelessWidget {
  final String title;
  double? titleFontSize;
  final String? message;
  final String? imagePath;
  bool? isSvg = false;
  MaterialColor? progressColor ;
  bool? withCard = false;
  double? cardElevation = 0;

  LoadingWidget(
      {Key? key,
      required this.title,
      this.message,
      this.imagePath,
      this.progressColor,
      this.isSvg,
      this.withCard,
      this.cardElevation,this.titleFontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (withCard != null && withCard!) {
      return Container(
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            elevation: cardElevation ?? 1,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: loadingWidget(),
            ),
          ),
        ),
      );
    }
    return loadingWidget();
  }

  Widget loadingWidget() {
    return Column(
      children: [
        if (imagePath != null) ...[
          if(isSvg!=null && isSvg!)...[
            const Icon(Icons.verified_user)
          ]else ...[
            const Icon(Icons.image)
          ],
          const SizedBox(height: 15),
        ],
        Text(
          title,
          style:  TextStyle(fontWeight: FontWeight.bold,fontSize: titleFontSize),
        ),
        const SizedBox(height: 15),
        if (message != null) ...[
          Text(
            message!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
        ],
        CircularProgressIndicator(color: progressColor)
      ],
    );
  }
}
