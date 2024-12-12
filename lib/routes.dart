import 'package:flutter/widgets.dart';
import 'package:octopus/octopus.dart';
import 'first_screen.dart';

import 'home_screen.dart';
import 'scoped_screen.dart';
import 'second_screen.dart';

enum Routes with OctopusRoute {
  home('home', title: 'Home'),
  scoped('scoped', title: 'Scoped'),
  firstScreen('first-screen', title: 'First Screen'),
  secondScreen('second-screen', title: 'Second Screen'),
  ;

  const Routes(this.name, {this.title});

  @override
  final String name;

  @override
  final String? title;

  @override
  Widget builder(BuildContext context, OctopusState state, OctopusNode node) =>
      switch (this) {
        Routes.home => const HomeScreen(),
        Routes.scoped => const ScopedScreen(),
        Routes.firstScreen => const FirstScreen(),
        Routes.secondScreen => const SecondScreen(),
      };
}
