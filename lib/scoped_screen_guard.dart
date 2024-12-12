import 'dart:async';

import 'package:octopus/octopus.dart';
import 'package:octopus_experiments/routes.dart';

class ScopedScreenGuard extends OctopusGuard {
  String get screenName => Routes.scoped.name;

  String get bucketName => 'scoped-bucket';

  final Set<String> allowedScreens;

  ScopedScreenGuard({
    super.refresh,
    required this.allowedScreens,
  });

  @override
  FutureOr<OctopusState> call(
    List<OctopusHistoryEntry> history,
    OctopusState$Mutable state,
    Map<String, Object?> context,
  ) {
    final screenWithBucket = state.findByName(Routes.scoped.name);
    if (screenWithBucket == null) return state;

    final scopedBucket = screenWithBucket.putIfAbsent(
      bucketName,
      () => OctopusNode.mutable(bucketName),
    );

    // remove not allowed screens
    scopedBucket.children.removeWhere(
      (node) => !allowedScreens.contains(
        node.name,
      ),
    );

    if (!scopedBucket.hasChildren) {
      scopedBucket.add(OctopusNode.mutable(Routes.firstScreen.name));
    }

    print(state);
    return state;
  }
}
