import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_state_app_using_bloc/ui/switch_screen.dart';

import 'bloc/switch_bloc.dart';

void main() {
  runApp(const MultipleStateAppUsingBloc());
}

class MultipleStateAppUsingBloc extends StatelessWidget {
  const MultipleStateAppUsingBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SwitchBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Multiple State App Using Bloc',
        home: SwitchScreen(),
      ),
    );
  }
}
