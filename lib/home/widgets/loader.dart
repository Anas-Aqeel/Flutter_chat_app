import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:hexcolor/hexcolor.dart';


class MyLoader extends StatefulWidget {
  const MyLoader({Key? key}) : super(key: key);

  @override
  State<MyLoader> createState() => _MyLoaderState();
}

class _MyLoaderState extends State<MyLoader>{


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Shimmer.fromColors(
              baseColor: HexColor('#0a0a0a'),
              highlightColor: HexColor('#001433'),
              child: Icon(
              Icons.textsms,
              size: 70,
            )
            ),
          SizedBox(height: 10,),
          DefaultTextStyle(
            style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.w800),
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText('Loading'),
              ],
              isRepeatingAnimation: true,
              
            ),
          )
        
        ],
      ),
    );
  }
}
