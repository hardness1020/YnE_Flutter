import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yne_flutter/app_config.dart';


extension AsyncValueUI on AsyncValue {
  void showAlertDialogOnError(BuildContext context) {
    if (!isRefreshing && hasError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: _CustomSnackBarContent(errorText: error.toString()),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );
    }
  }
}

class _CustomSnackBarContent extends StatelessWidget {
  const _CustomSnackBarContent({
    Key? key,
    required this.errorText,
  }) : super(key: key);

  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(16.0.hcd),
          height: 72.0.hcd,
          decoration: BoxDecoration(
            color: const Color(0xFFC72C41),
            borderRadius: BorderRadius.circular(20.0.hcd),
          ),
          child: Row(
            children: [
              SizedBox(width: 40.0.hcd),
              Expanded(
                  child: Text(
                errorText,
                style: TextStyle(color: Colors.white, fontSize: 14.0.hcd),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )),
            ],
          ),
        ),
        // add image here
      ],
    );
  }
}
