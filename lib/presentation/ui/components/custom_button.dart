import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retroflux/data/models/productivity_log_model.dart';
import 'package:retroflux/presentation/bloc/retroflux_bloc.dart';
import 'package:retroflux/presentation/ui/views/log_view.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final String productivityScore;
  final String title;
  final String description;
  const CustomButton(
      {super.key,
      required this.buttonText,
      required this.productivityScore,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (buttonText == "Save") {
          Navigator.pop(context);
          context.read<RetrofluxBloc>().add(SaveLog(ProductivityLogModel(
              DateTime.now().toString(),
              productivityScore,
              title,
              description,
              "",
              "",
              "")));
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LogView()),
          );
        }
      },
      child: Container(
        height: 50,
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Center(
          child: Text(
            buttonText,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ),
    );
  }
}
