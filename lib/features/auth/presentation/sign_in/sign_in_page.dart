import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:yne_flutter/app_config.dart';
import 'package:yne_flutter/constants/app_sizes.dart';
import 'package:yne_flutter/features/auth/presentation/sign_in/sign_in_controller.dart';
import 'package:yne_flutter/features/auth/presentation/sign_in/sign_in_state.dart';
import 'package:yne_flutter/features/shared/presentation/widgets/async_value_ui.dart';
import 'package:yne_flutter/features/shared/presentation/widgets/custom_input.dart';
import 'package:yne_flutter/features/shared/presentation/widgets/dividing_line.dart';
import 'package:yne_flutter/features/shared/presentation/widgets/primary_button.dart';
import 'package:yne_flutter/features/shared/presentation/widgets/string_validators.dart';
import 'package:yne_flutter/routing/app_router.dart';


class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _submitted = false;

  String get email => _emailController.text;
  String get password => _passwordController.text;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit(SignInState state) async {
    setState(() => _submitted = true);
    if (_formKey.currentState!.validate()) {
      final controller = ref.read(signInControllerProvider.notifier);
      final success = await controller.submit(email, password);
      if (success && mounted) {
        context.goNamed(AppRoute.navigation.name);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(
        signInControllerProvider.select((state) => state.value), (_, state) {
      state.showAlertDialogOnError(context);
    });
    final state = ref.watch(signInControllerProvider);
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
              minWidth: constraints.maxWidth,
            ),
            child: IntrinsicHeight(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(0, Sizes.p64, 0, Sizes.p48),
                      child: Image.asset(
                        "assets/images/logo.png",
                        width: MediaQuery.of(context).size.width * 0.7,
                      ),
                    ),
                    Column(
                      children: [
                        CustomInput(
                          text: '電子郵件'.hcd,
                          icon: Icons.person,
                          controller: _emailController,
                          state: state.value,
                          validator: (email) => !_submitted
                              ? null
                              : state.emailErrorText(email ?? ''),
                          inputFormatters: <TextInputFormatter>[
                            ValidatorInputFormatter(
                                editingValidator: EmailEditingRegexValidator()),
                          ],
                        ),
                        gapH16,
                        CustomInput(
                          text: '密碼'.hcd,
                          icon: Icons.lock,
                          controller: _passwordController,
                          state: state.value,
                          validator: (password) => !_submitted
                              ? null
                              : state.passwordErrorText(password ?? ''),
                          hide: true,
                          inputAction: TextInputAction.done,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0,
                              MediaQuery.of(context).size.width * 0.05, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () => context.pushNamed(
                                    AppRoute.passwordForgetfulness.name),
                                child: Text(
                                  '忘記密碼'.hcd,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        PrimaryButton(
                          text: '登入'.hcd,
                          isLoading: state.isLoading,
                          onPressed:
                              state.isLoading ? null : () => _submit(state),
                        ),
                        TextButton(
                          onPressed: () =>
                              context.pushNamed(AppRoute.signUp.name),
                          child: Text(
                            '申請帳號'.hcd,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        const DividingLine(),
                        Padding(
                          padding: const EdgeInsets.all(Sizes.p16),
                          child: Image.asset(
                            "assets/images/google_icon.png",
                            height: 40,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
