import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:retroflux/presentation/bloc/retroflux_bloc.dart';
import 'package:retroflux/presentation/ui/components/graph_hud.dart';
import 'package:retroflux/presentation/ui/components/navbar.dart';
import 'package:retroflux/presentation/ui/components/productivity_history_tile.dart';

import '../components/custom_button.dart';

class HomepageView extends StatefulWidget {
  const HomepageView({super.key});

  @override
  State<HomepageView> createState() => _HomepageViewState();
}

class _HomepageViewState extends State<HomepageView> {
  @override
  void initState() {
    context.read<RetrofluxBloc>().add(LoadHomepageView());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 640));
    return Scaffold(
      body: BlocBuilder<RetrofluxBloc, RetrofluxState>(
        builder: (context, state) {
          if (state is RetrofluxLoaded) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const Navbar(),
                            const SizedBox(
                              height: 24,
                            ),
                            GraphHUD(
                              logs: state.productivityLogs,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Row(
                              children: [
                                Text(
                                  "The history of you",
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 2,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Expanded(
                                child: ListView.builder(
                              itemCount: state.productivityLogs.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ProductivityHistoryTile(
                                  date: state.productivityLogs[index].date,
                                  productivityScore: state
                                      .productivityLogs[index]
                                      .productivityScore,
                                  title: state.productivityLogs[index].title,
                                  description:
                                      state.productivityLogs[index].description,
                                  comment:
                                      state.productivityLogs[index].comment,
                                  colorHex:
                                      state.productivityLogs[index].colorHex,
                                  emoji: state.productivityLogs[index].emoji,
                                );
                              },
                            ))
                          ],
                        ),
                      ),
                      const CustomButton(
                          buttonText: "Log your productivity",
                          productivityScore: "",
                          title: "",
                          description: "")
                    ]),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
