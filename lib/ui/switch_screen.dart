import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/switch_bloc.dart';
import '../bloc/switch_event.dart';
import '../bloc/switch_state.dart';

class SwitchScreen extends StatelessWidget {
  const SwitchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Build 1123');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Multiple State App using Bloc'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Notifications'),
                BlocBuilder<SwitchBloc, SwitchStates>(
                    buildWhen: (previous, current) =>
                        previous.isSwitch != current.isSwitch,
                    builder: (context, state) {
                      print('Builder');

                      return Switch(
                          value: state.isSwitch,
                          onChanged: (newValue) {
                            context
                                .read<SwitchBloc>()
                                .add(EnableOrDisableNotification());
                          });
                    })
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<SwitchBloc, SwitchStates>(
                buildWhen: (previous, current) =>
                    previous.slider != current.slider,
                builder: (context, state) {
                  return Container(
                    height: 200,
                    color: Colors.red.withOpacity(state.slider),
                  );
                }),
            const SizedBox(
              height: 50,
            ),
            BlocBuilder<SwitchBloc, SwitchStates>(
                buildWhen: (previous, current) =>
                    previous.slider != current.slider,
                builder: (context, state) {
                  print('Slider ');

                  return Slider(
                      value: state.slider,
                      onChanged: (value) {
                        context
                            .read<SwitchBloc>()
                            .add(SliderEvent(slider: value));
                      });
                })
          ],
        ),
      ),
    );
  }
}
