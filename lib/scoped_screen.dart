import 'package:flutter/widgets.dart';
import 'package:octopus/octopus.dart';

/// {@template scoped_screen}
/// ScopedScreen widget.
/// {@endtemplate}
class ScopedScreen extends StatelessWidget {
  /// {@macro scoped_screen}
  const ScopedScreen({
    super.key, // ignore: unused_element
  });

  @override
  Widget build(BuildContext context) => const Scope(
        child: BucketNavigator(
          bucket: 'scoped-bucket',
        ),
      );
}

/// {@template scoped_screen}
/// Scope widget.
/// {@endtemplate}
class Scope extends StatefulWidget {
  /// {@macro scoped_screen}
  const Scope({
    required this.child,
    super.key, // ignore: unused_element
  });

  /// The widget below this widget in the tree.
  final Widget child;

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  static ScopeController? maybeOf(BuildContext context) =>
      context.findAncestorStateOfType<_ScopeState>();

  @override
  State<Scope> createState() => _ScopeState();
}

/// State for widget Scope.
class _ScopeState extends State<Scope> with ScopeController {
  late final TextEditingController _textController;

  @override
  void initState() {
    _textController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => InheritedScope(
        controller: this,
        child: widget.child,
      );

  @override
  TextEditingController get textController => _textController;
}

mixin ScopeController on State<Scope> {
  TextEditingController get textController;
}

/// {@template scoped_screen}
/// ScopeExample widget.
/// {@endtemplate}
class InheritedScope extends InheritedWidget {
  /// {@macro scoped_screen}
  const InheritedScope({
    required super.child,
    super.key, // ignore: unused_element
    required this.controller,
  });

  final ScopeController controller;

  @override
  bool updateShouldNotify(covariant InheritedScope oldWidget) =>
      controller != oldWidget.controller;
}
