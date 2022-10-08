import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_colored_slider/gradient_colored_slider.dart';
import 'package:retroflux/core/const.dart';
import 'package:retroflux/presentation/bloc/retroflux_bloc.dart';
import 'package:retroflux/presentation/ui/components/custom_button.dart';
import 'package:retroflux/presentation/ui/components/navbar.dart';

class LogView extends StatefulWidget {
  const LogView({super.key});

  @override
  State<LogView> createState() => _LogViewState();
}

class _LogViewState extends State<LogView> {
  var _currentSliderValue = 0.0;
  String _productivityScore = "0.0";
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<RetrofluxBloc, RetrofluxState>(
        builder: (context, state) {
          return SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Navbar(),
                    const SizedBox(
                      height: 52,
                    ),
                    Text(
                      "Chekin",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Container(
                      width: 200,
                      child: Text(
                        "Fill the below details to complete today’s check-in.",
                        style: Theme.of(context).textTheme.subtitle1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        hintText: "Describe you day in less than 50 letters",
                        hintStyle: Theme.of(context).textTheme.subtitle1,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2,
                              color: CustomColors.dimGrey), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2,
                              color: CustomColors.dimGrey), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Eg. a smooth trip",
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextField(
                      controller: _descriptionController,
                      maxLines: 8,
                      minLines: 8,
                      decoration: InputDecoration(
                        hintText: "Describe you day in details",
                        hintStyle: Theme.of(context).textTheme.subtitle1,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2,
                              color: CustomColors.dimGrey), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2,
                              color: CustomColors.dimGrey), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Eg. a short story perhaps?",
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    GradientColoredSlider(
                      barSpace: 0,
                      barWidth: 0.5,
                      value: _currentSliderValue,
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                          _productivityScore = (_currentSliderValue * 100)
                              .toString()
                              .substring(
                                  0,
                                  ((_currentSliderValue * 100)
                                              .toString()
                                              .length ==
                                          3)
                                      ? 3
                                      : 5);
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Not good",
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          Text(
                            _productivityScore,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                ?.copyWith(fontFamily: 'roboto-medium'),
                          ),
                          Text(
                            "Perfect",
                            style: Theme.of(context).textTheme.subtitle2,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                CustomButton(
                    buttonText: "Save",
                    productivityScore: _productivityScore,
                    title: _titleController.text,
                    description: _descriptionController.text)
              ],
            ),
          ));
        },
      ),
    );
  }
}
