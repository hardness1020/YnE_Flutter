import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:yne_flutter/constants/app_sizes.dart';
import 'package:yne_flutter/features/shared/presentation/widgets/primary_button.dart';
import 'package:yne_flutter/features/shared/presentation/widgets/responsive_center.dart';
import 'package:yne_flutter/routing/app_router.dart';


class RequestSentPage extends StatelessWidget {
  const RequestSentPage({
    super.key,
    required this.title,
    required this.mainText,
    this.notificationText = '',
  });
  final String title;
  final String mainText;
  final String notificationText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ResponsiveCenter(
        maxContentWidth: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(Sizes.p48),
              child: Column(
                children: [
                  Image.asset("assets/images/logo.png"),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.p24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    mainText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: Sizes.p20,
                    ),
                  ),
                  if (notificationText != '') ...[
                    Padding(
                      padding: const EdgeInsets.only(top: Sizes.p16),
                      child: Text(
                        notificationText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: Sizes.p16,
                        ),
                      ),
                    ),
                  ]
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Sizes.p16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryButton(
                    text: '返回登入',
                    onPressed: () => context.goNamed(AppRoute.signIn.name),
                    color: Theme.of(context).shadowColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
