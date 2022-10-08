import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../core/const.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "RETROFLUX",
          style: Theme.of(context).textTheme.headline1,
        ),
        InkWell(
          onTap: () => exit(0),
          child: Text(
            "EXIT",
            style: Theme.of(context)
                .textTheme
                .headline1
                ?.copyWith(color: CustomColors.red),
          ),
        )
      ],
    );
  }
}
