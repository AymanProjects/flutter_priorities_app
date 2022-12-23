import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final priorityViewScrollContoller = Provider.autoDispose(
  (ref) {
    final controller = ScrollController();
    ref.onDispose(() => controller.dispose());
    return controller;
  },
);
