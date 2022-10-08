import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/productivity_log_model.dart';

abstract class LocalDataSource {
  void saveData(ProductivityLogModel log);
  List<ProductivityLogModel> retrieveData();
  List<dynamic> getProductivityScoreDetails(String productivityScore);
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferencesInstance;

  LocalDataSourceImpl({required this.sharedPreferencesInstance});

  @override
  List<ProductivityLogModel> retrieveData() {
    String? data = sharedPreferencesInstance.getString('data');

    if (data != null) {
      List<Map<String, dynamic>> decodedJson =
          List<Map<String, dynamic>>.from(json.decode(data));
      return ProductivityLogModel.fromJson(decodedJson);
    } else {
      var dummyJson = [
        {
          "date": DateTime.now().subtract(const Duration(days: 7)).toString(),
          "productivityScore": "84",
          "title": "A smooth day",
          "description":
              "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available."
        },
        {
          "date": DateTime.now().subtract(const Duration(days: 6)).toString(),
          "productivityScore": "45",
          "title": "Barely good",
          "description":
              "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available."
        },
        {
          "date": DateTime.now().subtract(const Duration(days: 5)).toString(),
          "productivityScore": "85",
          "title": "Productive AF",
          "description":
              "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available."
        },
        {
          "date": DateTime.now().subtract(const Duration(days: 4)).toString(),
          "productivityScore": "34",
          "title": "Monday blues",
          "description":
              "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available."
        },
        {
          "date": DateTime.now().subtract(const Duration(days: 3)).toString(),
          "productivityScore": "94",
          "title": "Best day ever",
          "description":
              "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available."
        },
        {
          "date": DateTime.now().subtract(const Duration(days: 2)).toString(),
          "productivityScore": "71",
          "title": "Average kind of day",
          "description":
              "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available."
        },
        {
          "date": DateTime.now().subtract(const Duration(days: 1)).toString(),
          "productivityScore": "68",
          "title": "A meh kind of day",
          "description":
              "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available."
        },
        {
          "date": DateTime.now().subtract(const Duration(days: 0)).toString(),
          "productivityScore": "100",
          "title": "The best day of my life",
          "description":
              "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available."
        },
      ];

      for (var i in (dummyJson)) {
        saveData(ProductivityLogModel(i["date"]!, i["productivityScore"]!,
            i["title"]!, i["description"]!, "", "", ""));
      }
      return [];
    }
  }

  @override
  void saveData(ProductivityLogModel rawLog) async {
    var scoreDetails = getProductivityScoreDetails(rawLog.productivityScore);

    ProductivityLogModel log = ProductivityLogModel(
        rawLog.date,
        rawLog.productivityScore,
        rawLog.title,
        rawLog.description,
        scoreDetails[1],
        scoreDetails[2],
        scoreDetails[0]);

    String? data = sharedPreferencesInstance.getString('data');
    List<Map<String, dynamic>> listOfLogs = [];
    if (data != null) {
      listOfLogs = List<Map<String, dynamic>>.from(json.decode(data));
    }
    listOfLogs.insert(0, ProductivityLogModel.toJson(log));

    await sharedPreferencesInstance.setString("data", json.encode(listOfLogs));
  }

  @override
  List<dynamic> getProductivityScoreDetails(String productivityScore) {
    var productivityScoreParsed = double.parse(productivityScore);
    final _random = Random();
    String emoji = "";
    String remark = "";

    var wordsL1 = [
      "underperformance",
      "unsatisfactory",
      "poor",
      "mediocre",
      "abysmal",
      "subpar",
      "bummer",
      "disappointing",
      "regrettable",
      "underachievement"
    ];
    var wordsL2 = [
      "decent",
      "good",
      "modest",
      "proper",
      "respectable",
      "feat",
      "nice",
      "reasonable",
      "respect"
    ];
    var wordsL3 = [
      "great",
      "proud",
      "showpiece",
      "highlight",
      "achievement",
      "exemplary"
    ];
    var wordsL4 = ["excellent", "perfect", "polished", "exceptional", "best"];

    var emojiL1 = [
      "\uD83D\uDE1E",
      "\uD83D\uDE27",
      "\uD83D\uDE3F",
      "\uD83D\uDE2E\u200D\uD83D\uDCA8",
      "\uD83E\uDD7A",
      "\uD83D\uDE2D",
      "\uD83D\uDE41"
    ];
    var emojiL2 = [
      "\uD83D\uDE0A",
      "\uD83D\uDE38",
      "\uD83D\uDE42",
      "\uD83D\uDE43"
    ];
    var emojiL3 = [
      "\uD83E\uDD17",
      "\uD83E\uDD29",
      "\uD83D\uDE0C",
      "\uD83D\uDE07",
      "\uD83E\uDD2D",
      "\uD83D\uDE0E",
      "\uD83D\uDE80"
    ];
    var emojiL4 = [
      "\uD83E\uDD70",
      "\uD83C\uDF0B",
      "\uD83D\uDD25",
      "\uD83E\uDD95",
      "\uD83C\uDF86",
      "❤️\u200D\uD83D\uDD25",
      "✨"
    ];

    if (productivityScoreParsed < 40) {
      remark = wordsL1[_random.nextInt(wordsL1.length)];
      emoji = emojiL1[_random.nextInt(emojiL1.length)];
    } else if (productivityScoreParsed < 60) {
      remark = wordsL2[_random.nextInt(wordsL2.length)];
      emoji = emojiL2[_random.nextInt(emojiL2.length)];
    } else if (productivityScoreParsed < 80) {
      remark = wordsL3[_random.nextInt(wordsL3.length)];
      emoji = emojiL3[_random.nextInt(emojiL3.length)];
    } else if (productivityScoreParsed < 100) {
      remark = wordsL4[_random.nextInt(wordsL4.length)];
      emoji = emojiL4[_random.nextInt(emojiL4.length)];
    } else {
      remark = "perfect";
      emoji = "🏆";
    }

    var hslColor = HSLColor.fromColor(const Color(0XFFA00000));
    var newHSV =
        min(max(hslColor.lightness + productivityScoreParsed, 0.0), 360.0);
    var newColor = hslColor.withHue(newHSV).toColor();
    var newHex = '0x${newColor.value.toRadixString(16)}';
    return [emoji, remark, newHex];
  }
}
