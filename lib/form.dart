import 'package:flutter/material.dart';
import 'package:parkinson/api.dart';
import 'package:parkinson/constant.dart';
import 'package:parkinson/img_ref.dart';
import 'package:parkinson/model.dart';
import 'package:parkinson/result.dart';

class Parkinson extends StatefulWidget {
  const Parkinson({super.key});

  @override
  State<Parkinson> createState() => _ParkinsonState();
}

class _ParkinsonState extends State<Parkinson> {
  final _mdvpFoController = TextEditingController();
  final _mdvpFhiController = TextEditingController();
  final _mdvpFloController = TextEditingController();
  final _mdvpJitterController = TextEditingController();
  final _mdvpJitterAbsController = TextEditingController();
  final _mdvpRAPController = TextEditingController();
  final _mdvpPPQController = TextEditingController();
  //
  final _jitterDDPController = TextEditingController();
  final _mdvpShimmerController = TextEditingController();
  // final _mdvpFoController = TextEditingController();
  final _mdvpShimmerdBController = TextEditingController();
  final _shimmerAPQ3Controller = TextEditingController();
  final _shimmerAPQ5Controller = TextEditingController();
  final _mdvpAPQController = TextEditingController();
  final _shimmerDDAController = TextEditingController();
  final _NHRController = TextEditingController();
  final _HNRController = TextEditingController();
  final _RPDEController = TextEditingController();
  final _DFAController = TextEditingController();
  final _Spread1Controller = TextEditingController();
  final _Spread2Controller = TextEditingController();
  final _D2Controller = TextEditingController();
  final _PPEController = TextEditingController();

  int _currentStep = 0;

  StepperType stepperType = StepperType.vertical;

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  @override
  void dispose() {
    _mdvpFoController.dispose();
    _mdvpFhiController.dispose();
    _mdvpFloController.dispose();
    _mdvpJitterController.dispose();
    _mdvpJitterAbsController.dispose();
    _mdvpRAPController.dispose();
    _mdvpPPQController.dispose();
    _jitterDDPController.dispose();
    _mdvpShimmerController.dispose();
    _mdvpShimmerdBController.dispose();
    _shimmerAPQ3Controller.dispose();
    _shimmerAPQ5Controller.dispose();
    _mdvpAPQController.dispose();
    _shimmerDDAController.dispose();
    _NHRController.dispose();
    _HNRController.dispose();
    _RPDEController.dispose();
    _DFAController.dispose();
    _Spread1Controller.dispose();
    _Spread2Controller.dispose();
    _D2Controller.dispose();
    _PPEController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Parkinsons Detection"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  children: [
                    Stepper(
                        type: stepperType,
                        physics: const ScrollPhysics(),
                        currentStep: _currentStep,
                        onStepTapped: (step) => tapped(step),
                        onStepContinue: continued,
                        onStepCancel: cancel,
                        steps: <Step>[
                          Step(
                            title: const Text('Step 1'),
                            content: Column(
                              children: <Widget>[
                                SizedBox(height: height(context) * 0.02),
                                TextFormField(
                                  controller: _mdvpFoController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    label: Text("MDVP:Fo"),
                                    suffixIcon: Text("Hz"),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: height(context) * 0.02),
                                TextFormField(
                                  controller: _mdvpFhiController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    label: Text("MDVP:Fhi"),
                                    suffixIcon: Text("Hz"),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: height(context) * 0.02),
                                TextFormField(
                                  controller: _mdvpFloController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    label: Text("MDVP:Flo"),
                                    suffixIcon: Text("Hz"),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: height(context) * 0.02),
                                TextFormField(
                                  controller: _mdvpJitterController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    label: Text("MDVP:Jitter"),
                                    suffixIcon: Text("%"),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: height(context) * 0.02),
                                TextFormField(
                                  controller: _mdvpJitterAbsController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    label: Text("MDVP:Jitter"),
                                    suffixIcon: Text("Abs"),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: height(context) * 0.02),
                                TextFormField(
                                  controller: _mdvpRAPController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    label: Text("MDVP:RAP"),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: height(context) * 0.02),
                                TextFormField(
                                  controller: _mdvpPPQController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    label: Text("MDVP:PPQ"),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ],
                            ),
                            isActive: _currentStep >= 0,
                            state: _currentStep >= 0
                                ? StepState.complete
                                : StepState.disabled,
                          ),
                          Step(
                            title: const Text('Step 2'),
                            content: Column(
                              children: <Widget>[
                                SizedBox(height: height(context) * 0.02),
                                //
                                TextFormField(
                                  controller: _jitterDDPController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    label: Text("MDVP:DDP"),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                //
                                SizedBox(height: height(context) * 0.02),
                                TextFormField(
                                  controller: _mdvpShimmerController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    label: Text("MDVP:Shimmer"),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                // SizedBox(height: height(context) * 0.02),
                                // TextFormField(
                                //   controller: _mdvpShimmerController,
                                //   keyboardType: TextInputType.number,
                                //   decoration: const InputDecoration(
                                //     label: Text("MDVP:Fo"),
                                //     suffixIcon: Text("Hz"),
                                //     border: OutlineInputBorder(),
                                //   ),
                                // ),
                                SizedBox(height: height(context) * 0.02),
                                TextFormField(
                                  controller: _mdvpShimmerdBController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    label: Text("MDVP:Shimmer(dB)"),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: height(context) * 0.02),
                                TextFormField(
                                  controller: _shimmerAPQ3Controller,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    label: Text("Shimmer:APQ3"),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: height(context) * 0.02),
                                TextFormField(
                                  controller: _shimmerAPQ5Controller,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    label: Text("Shimmer:APQ5"),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: height(context) * 0.02),
                                TextFormField(
                                  controller: _mdvpAPQController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    label: Text("MDVP:ApQ"),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: height(context) * 0.02),
                                TextFormField(
                                  controller: _shimmerDDAController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    label: Text("Shimmer:DDA"),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ],
                            ),
                            isActive: _currentStep >= 0,
                            state: _currentStep >= 1
                                ? StepState.complete
                                : StepState.disabled,
                          ),
                          Step(
                            title: const Text('Step 3'),
                            content: Column(
                              children: <Widget>[
                                SizedBox(height: height(context) * 0.02),
                                TextFormField(
                                  controller: _NHRController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    label: Text("NHR"),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: height(context) * 0.02),
                                TextFormField(
                                  controller: _HNRController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    label: Text("HNR"),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: height(context) * 0.02),
                                TextFormField(
                                  controller: _RPDEController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    label: Text("RPDE"),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: height(context) * 0.02),
                                TextFormField(
                                  controller: _DFAController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    label: Text("DFA"),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: height(context) * 0.02),
                                TextFormField(
                                  controller: _Spread1Controller,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    label: Text("Spread1"),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: height(context) * 0.02),
                                TextFormField(
                                  controller: _Spread2Controller,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    label: Text("Spread2"),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: height(context) * 0.02),
                                TextFormField(
                                  controller: _D2Controller,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    label: Text("D2"),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: height(context) * 0.02),
                                TextFormField(
                                  controller: _PPEController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    label: Text("PPE"),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: height(context) * 0.05),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      Predict body = Predict(
                                        MDVPFo: double.parse(
                                            _mdvpFoController.text),
                                        MDVPFhi: double.parse(
                                            _mdvpFhiController.text),
                                        MDVPFlo: double.parse(
                                            _mdvpFloController.text),
                                        MDVPJitter: double.parse(
                                            _mdvpJitterController.text),
                                        MDVPJitterAbs: double.parse(
                                            _mdvpJitterAbsController.text),
                                        MDVPRAP: double.parse(
                                            _mdvpRAPController.text),
                                        MDVPPPQ: double.parse(
                                            _mdvpPPQController.text),
                                        JitterDDP: double.parse(
                                            _jitterDDPController.text),
                                        MDVPShimmer: double.parse(
                                            _mdvpShimmerController.text),
                                        MDVPShimmerdB: double.parse(
                                            _mdvpShimmerdBController.text),
                                        ShimmerAPQ3: double.parse(
                                            _shimmerAPQ3Controller.text),
                                        ShimmerAPQ5: double.parse(
                                            _shimmerAPQ5Controller.text),
                                        MDVPAPQ: double.parse(
                                            _mdvpAPQController.text),
                                        ShimmerDDA: double.parse(
                                            _shimmerDDAController.text),
                                        NHR: double.parse(_NHRController.text),
                                        HNR: double.parse(_HNRController.text),
                                        RPDE:
                                            double.parse(_RPDEController.text),
                                        DFA: double.parse(_DFAController.text),
                                        spread1: double.parse(
                                            _Spread1Controller.text),
                                        spread2: double.parse(
                                            _Spread2Controller.text),
                                        D2: double.parse(_D2Controller.text),
                                        PPE: double.parse(_PPEController.text),
                                      );
                                      showDialog(
                                          context: context,
                                          builder: (_) => AlertDialog(
                                                content:
                                                    Image.asset(splashIcon),
                                              ));
                                      const Duration(seconds: 8);
                                      await postFunc(body.toJson()).then(
                                        (value) => Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (_) =>
                                                MyResult(resVal: value),
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Text("Predict"),
                                  ),
                                ),
                              ],
                            ),
                            isActive: _currentStep >= 0,
                            state: _currentStep >= 2
                                ? StepState.complete
                                : StepState.disabled,
                          ),
                        ]),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
