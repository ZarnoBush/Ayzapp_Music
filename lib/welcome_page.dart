import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.maxFinite,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/img_welcome.jpg'), fit: BoxFit.cover, colorFilter: ColorFilter.srgbToLinearGamma())),
          child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextHolder(
                          text: 'AyZapp Music\nDance The World',
                          textStyle: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 25)),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex:1,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.maxFinite,
                          height: 40,
                          child: ElevatedButton(onPressed: () => Get.toNamed('/play'),
                          style: const ButtonStyle(shape: WidgetStatePropertyAll(ContinuousRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))))),
                           child: TextHolder(text: 'Google', textStyle: TextStyle(color: Color.fromARGB(255, 255, 0, 98), fontSize: 16, fontWeight: FontWeight.w600))),
                        ),
                      )
                    ],
                  ))
            ],
          )),
    );
  }
}

class TextHolder extends StatelessWidget {
  TextHolder({super.key, required this.text, required this.textStyle});

  String text;
  TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
    );
  }
}
