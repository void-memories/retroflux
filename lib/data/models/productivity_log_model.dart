import 'package:flutter/material.dart';

class ProductivityLogModel {
  final String date;
  final String productivityScore;
  final String title;
  final String description;
  final String comment;
  final String colorHex;
  final String emoji;

  ProductivityLogModel(this.date, this.productivityScore, this.title,
      this.description, this.comment, this.colorHex, this.emoji);

  static List<ProductivityLogModel> fromJson(
      List<Map<String, dynamic>> jsonLogList) {
    List<ProductivityLogModel> productivityLogModelList = [];
    List<String> monthName = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "Novemeber",
      "December"
    ];
    for (final log in jsonLogList) {
      DateTime logTime = DateTime.parse(log["date"]!);
      String date =
          "${monthName[logTime.month - 1]} ${logTime.day}th, ${logTime.year}";

      productivityLogModelList.add(ProductivityLogModel(
          date,
          log["productivityScore"]!,
          log["title"]!,
          log["description"]!,
          log["comment"]!,
          log["colorHex"]!,
          log["emoji"]!));
    }

    return productivityLogModelList;
  }

  static Map<String, dynamic> toJson(ProductivityLogModel log) {
    Map<String, dynamic> currentLog = {};

    currentLog["date"] = log.date;
    currentLog["productivityScore"] = log.productivityScore;
    currentLog["title"] = log.title;
    currentLog["description"] = log.description;
    currentLog["comment"] = log.comment;
    currentLog["colorHex"] = log.colorHex;
    currentLog["emoji"] = log.emoji;

    return currentLog;
  }
}
