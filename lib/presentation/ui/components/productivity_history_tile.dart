import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductivityHistoryTile extends StatelessWidget {
  final String date;
  final String productivityScore;
  final String title;
  final String description;
  final String comment;
  final String colorHex;
  final String emoji;

  const ProductivityHistoryTile(
      {super.key,
      required this.date,
      required this.productivityScore,
      required this.title,
      required this.description,
      required this.comment,
      required this.colorHex,
      required this.emoji});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 640));
    return InkWell(
      onTap: (() {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text(title),
                  content: Text(description),
                ));
      }),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              emoji,
              style: TextStyle(fontSize: 20.sp),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        date,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text(
                        productivityScore,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: Color(int.parse(colorHex))),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      Text(
                        comment,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            ?.copyWith(color: Color(int.parse(colorHex))),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 1,
                    color: const Color(0xffD0D0D0),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
