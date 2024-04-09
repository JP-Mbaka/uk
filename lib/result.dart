import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parkinson/constant.dart';
import 'package:parkinson/form.dart';
import 'package:parkinson/img_ref.dart';

// ignore: must_be_immutable
class MyResult extends StatelessWidget {
  String? resVal;

  MyResult({super.key, this.resVal});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SvgPicture.asset(
              resVal == "Tested Positive" ? positiveIcon : negativeIcon,
              height: height(context) * 0.35,
              width: width(context) * 0.25,
            ),
            const Spacer(),
            Center(
              child: Text(resVal ?? "No Prediction", style: Theme.of(context).textTheme.headlineMedium?.copyWith(),),
            ),
            const Spacer(),
            TextButton.icon(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => const Parkinson(),
                    ),
                  );
                },
                icon: const Icon(Icons.batch_prediction),
                label: const Text("Try again"))
          ],
        ),
      ),
    );
  }
}
