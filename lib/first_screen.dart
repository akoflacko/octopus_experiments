import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:octopus/octopus.dart';
import 'package:octopus_experiments/routes.dart';

import 'scoped_screen.dart';

/// {@template first_screen}
/// FirstScreen widget.
/// {@endtemplate}
class FirstScreen extends StatefulWidget {
  /// {@macro first_screen}
  const FirstScreen({
    super.key, // ignore: unused_element
  });

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  @internal
  static _FirstScreenState? maybeOf(BuildContext context) =>
      context.findAncestorStateOfType<_FirstScreenState>();

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

/// State for widget FirstScreen.
class _FirstScreenState extends State<FirstScreen> {
  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    // Initial state initialization
  }

  @override
  void didUpdateWidget(covariant FirstScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Widget configuration changed
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // The configuration of InheritedWidgets has changed
    // Also called after initState but before build
  }

  @override
  void dispose() {
    // Permanent removal of a tree stent
    super.dispose();
  }
  /* #endregion */

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('First Screen'),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Builder(
                  builder: (context) {
                    final controller = Scope.maybeOf(context);

                    if (controller == null) {
                      return const Text('Controller not found');
                    }

                    return TextField(
                      controller: controller.textController,
                    );
                  },
                ),
                ElevatedButton(
                  onPressed: () => context.octopus.setState(
                    (state) {
                      final bucket = state.findByName('scoped-bucket');
                      if (bucket == null) return state;

                      bucket.children.add(Routes.secondScreen.node());
                      return state;
                    },
                  ),
                  child: const Text(
                    'Add second screen',
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
