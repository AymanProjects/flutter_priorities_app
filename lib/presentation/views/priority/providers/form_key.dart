import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final priorityViewFormKey = AutoDisposeProvider(
  (ref) => GlobalKey<FormState>(),
);
