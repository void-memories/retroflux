import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:retroflux/data/models/productivity_log_model.dart';
import 'package:collection/collection.dart';

import '../../../core/const.dart';

class GraphHUD extends StatelessWidget {
  final List<ProductivityLogModel> logs;
  const GraphHUD({super.key, required this.logs});

  @override
  Widget build(BuildContext context) {
    var peaks = getPeakValues(logs);
    var avg = peaks.average.toString();
    ScreenUtil.init(context, designSize: const Size(360, 640));
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 100.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  height: peaks[0].h,
                  color: const Color(0xffE4E4E4),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: Container(
                  height: peaks[1].h,
                  color: const Color(0xffE4E4E4),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: Container(
                  height: peaks[2].h,
                  color: const Color(0xffE4E4E4),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: Container(
                  height: peaks[3].h,
                  color: const Color(0xffE4E4E4),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: Container(
                  height: peaks[4].h,
                  color: const Color(0xffE4E4E4),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: Container(
                  height: peaks[5].h,
                  color: const Color(0xffE4E4E4),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: Container(
                  height: peaks[6].h,
                  color: const Color(0xffE4E4E4),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: 48.sp,
                        color: CustomColors.gunMetal,
                        fontFamily: 'roboto-medium'),
                    children: <TextSpan>[
                      TextSpan(text: avg.substring(0, avg.indexOf('.') + 1)),
                      TextSpan(
                          text: (avg.length - avg.indexOf('.') + 1 > 3)
                              ? avg.substring(
                                  avg.indexOf('.') + 1, avg.indexOf('.') + 3)
                              : avg.substring(avg.indexOf('.') + 1, avg.length),
                          style: TextStyle(
                              fontFamily: 'roboto-light',
                              color: CustomColors.vividOrange,
                              fontSize: 32.sp)),
                    ],
                  ),
                ),
                Text(
                  "Last 7 day's performance",
                  style: Theme.of(context).textTheme.subtitle2,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

List<double> getPeakValues(List<ProductivityLogModel> logs) {
  List<double> peaks = [];
  for (int i = 0; i < 7; i++) {
    if (i + 1 > logs.length) {
      peaks.add(5.0);
    } else {
      peaks.add(double.parse(logs[i].productivityScore));
    }
  }

  return peaks.reversed.toList();
}
