import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:octopus_experiments/scoped_screen.dart';

/// {@template second_screen}
/// SecondScreen widget.
/// {@endtemplate}
class SecondScreen extends StatefulWidget {
  /// {@macro second_screen}
  const SecondScreen({
    super.key, // ignore: unused_element
  });

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  @internal
  static _SecondScreenState? maybeOf(BuildContext context) =>
      context.findAncestorStateOfType<_SecondScreenState>();

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

/// State for widget SecondScreen.
class _SecondScreenState extends State<SecondScreen> {
  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    // Initial state initialization
  }

  @override
  void didUpdateWidget(covariant SecondScreen oldWidget) {
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
          title: const Text('Second Screen'),
        ),
        body: SafeArea(
          child: Center(
            child: Builder(
              builder: (context) {
                final controller = Scope.maybeOf(context);

                if (controller == null) {
                  return const Text('No controller found');
                }

                return TextField(
                  controller: controller.textController,
                );
              },
            ),
          ),
        ),
      );
}
