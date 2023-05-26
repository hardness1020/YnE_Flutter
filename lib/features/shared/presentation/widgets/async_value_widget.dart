import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yne_flutter/app_config.dart';
import 'package:yne_flutter/features/shared/presentation/widgets/error_message_widget.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.data,
    this.loading = const Center(child: CircularProgressIndicator()),
  });
  final AsyncValue<T> value;
  final Widget Function(T) data;
  final Widget loading;

  @override
  Widget build(BuildContext context) {
    log.d(value);
    return value.when(
      skipLoadingOnRefresh: false,
      data: data,
      error: (e, st) => Center(child: ErrorMessageWidget(e.toString())),
      loading: () => loading,
    );
  }
}
