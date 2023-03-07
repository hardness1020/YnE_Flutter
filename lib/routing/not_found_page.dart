import 'package:flutter/material.dart';
import 'package:yne_flutter/app_config.dart';
import 'package:yne_flutter/features/shared/presentation/widgets/empty_placeholder_widget.dart';

/// Simple not found screen used for 404 errors (page not found on web)
class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: EmptyPlaceholderWidget(
        message: '404 - Page not found!'.hcd,
      ),
    );
  }
}
