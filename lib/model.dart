// Predict userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

import 'dart:convert';

class Predict {
  double MDVPFo;
  double MDVPFhi;
  double MDVPFlo;
  double MDVPJitter;
  double MDVPJitterAbs;
  double MDVPRAP;
  double MDVPPPQ;
  double JitterDDP;
  double MDVPShimmer;
  double MDVPShimmerdB;
  double ShimmerAPQ3;
  double ShimmerAPQ5;
  double MDVPAPQ;
  double ShimmerDDA;
  double NHR;
  double HNR;
  double RPDE;
  double DFA;
  double spread1;
  double spread2;
  double D2;
  double PPE;
  Predict({
    required this.MDVPFo,
    required this.MDVPFhi,
    required this.MDVPFlo,
    required this.MDVPJitter,
    required this.MDVPJitterAbs,
    required this.MDVPRAP,
    required this.MDVPPPQ,
    required this.JitterDDP,
    required this.MDVPShimmer,
    required this.MDVPShimmerdB,
    required this.ShimmerAPQ3,
    required this.ShimmerAPQ5,
    required this.MDVPAPQ,
    required this.ShimmerDDA,
    required this.NHR,
    required this.HNR,
    required this.RPDE,
    required this.DFA,
    required this.spread1,
    required this.spread2,
    required this.D2,
    required this.PPE,
  });

  factory Predict.fromJson(Map<String, dynamic> json) => Predict(
        MDVPFo: json["MDVPFo"],
        MDVPFhi: json["MDVPFhi"],
        MDVPFlo: json["MDVPFlo"],
        MDVPJitter: json["MDVPJitter"],
        MDVPJitterAbs: json["MDVPJitterAbs"],
        MDVPRAP: json["MDVPRAP"],
        MDVPPPQ: json["MDVPPPQ"],
        JitterDDP: json["JitterDDP"],
        MDVPShimmer: json["MDVPShimmer"],
        MDVPShimmerdB: json["MDVPShimmerdB"],
        ShimmerAPQ3: json["ShimmerAPQ3"],
        ShimmerAPQ5: json["ShimmerAPQ5"],
        MDVPAPQ: json["MDVPAPQ"],
        ShimmerDDA: json["ShimmerDDA"],
        NHR: json["NHR"],
        HNR: json["HNR"],
        RPDE: json["RPDE"],
        DFA: json["DFA"],
        spread1: json["spread1"],
        spread2: json["spread2"],
        D2: json["D2"],
        PPE: json["PPE"],
      );

  Map<String, dynamic> toJson() => {
        "MDVPFo": MDVPFo,
        "MDVPFhi": MDVPFhi,
        "MDVPFlo": MDVPFlo,
        "MDVPJitter": MDVPJitter,
        "MDVPJitterAbs": MDVPJitterAbs,
        "MDVPRAP": MDVPRAP,
        "MDVPPPQ": MDVPPPQ,
        "JitterDDP": JitterDDP,
        "MDVPShimmer": MDVPShimmer,
        "MDVPShimmerdB": MDVPShimmerdB,
        "ShimmerAPQ3": ShimmerAPQ3,
        "ShimmerAPQ5": ShimmerAPQ5,
        "MDVPAPQ": MDVPAPQ,
        "ShimmerDDA": ShimmerDDA,
        "NHR": NHR,
        "HNR": HNR,
        "RPDE": RPDE,
        "DFA": DFA,
        "spread1": spread1,
        "spread2": spread2,
        "D2": D2,
        "PPE": PPE,
      };
}

ResultModel resultModelString(String str) =>
    ResultModel.fromJson(json.decode(str));

class ResultModel {
  String prediction;

  ResultModel({required this.prediction});

  factory ResultModel.fromJson(Map<String, dynamic> json) =>
      ResultModel(prediction: json["prediction"]);

  set result(String value) {}

  String get result {
    String? pal;
    if (prediction == "[1]") {
      pal = "Tested Positive";
    } else {
      pal = "Tested Negative";
    }
    return pal;
  }
}
