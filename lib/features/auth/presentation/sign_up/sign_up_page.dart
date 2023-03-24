import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yne_flutter/app_config.dart';
import 'package:yne_flutter/constants/app_sizes.dart';
import 'package:yne_flutter/features/auth/presentation/request_sent/request_sent_page.dart';
import 'package:yne_flutter/features/auth/presentation/sign_up/sign_up_controller.dart';
import 'package:yne_flutter/features/auth/presentation/sign_up/sign_up_state.dart';
import 'package:yne_flutter/features/shared/presentation/widgets/async_value_ui.dart';
import 'package:yne_flutter/features/shared/presentation/widgets/custom_input.dart';
import 'package:yne_flutter/features/shared/presentation/widgets/primary_button.dart';
import 'package:yne_flutter/features/shared/presentation/widgets/string_validators.dart';


class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nicknameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  var _submitted = false;
  var _success = false;

  String get nickname => _nicknameController.text;
  String get email => _emailController.text;
  String get password => _passwordController.text;
  String get confirmPassword => _confirmPasswordController.text;

  @override
  void dispose() {
    _nicknameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _submit(SignUpState state) async {
    setState(() => _submitted = true);
    if (_formKey.currentState!.validate()) {
      final controller = ref.read(signUpControllerProvider.notifier);
      _success = await controller.submit(nickname, email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(
      signUpControllerProvider.select((state) => state.value),
      (_, state) => state.showAlertDialogOnError(context),
    );
    final state = ref.watch(signUpControllerProvider);
    return _success
        ? RequestSentPage(
            title: '建立帳號'.hcd,
            mainText: '驗證郵件已寄至你的信箱 $email ，請你查收並點擊郵件中的連結以確認你的電子郵件地址。'.hcd,
            notificationText: '請注意：在驗證你的信箱前，你仍可以自由地登入，但無法使用忘記密碼功能。'.hcd,
          )
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
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
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                "assets/images/logo.png",
                                width: MediaQuery.of(context).size.width * 0.7,
                              ),
                              const Text(
                                '建立帳號',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Sizes.p24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              CustomInput(
                                text: '暱稱'.hcd,
                                icon: Icons.person,
                                controller: _nicknameController,
                                state: state.value,
                                validator: (nickname) => !_submitted
                                    ? null
                                    : state.nicknameErrorText(nickname ?? ''),
                              ),
                              gapH16,
                              CustomInput(
                                text: '電子郵件'.hcd,
                                icon: Icons.email_outlined,
                                controller: _emailController,
                                state: state.value,
                                validator: (email) => !_submitted
                                    ? null
                                    : state.emailErrorText(email ?? ''),
                                inputFormatters: <TextInputFormatter>[
                                  ValidatorInputFormatter(
                                      editingValidator:
                                          EmailEditingRegexValidator()),
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
                              ),
                              gapH16,
                              CustomInput(
                                text: '確認密碼'.hcd,
                                icon: Icons.lock,
                                controller: _confirmPasswordController,
                                state: state.value,
                                validator: (confirmPassword) => !_submitted
                                    ? null
                                    : state.confirmPasswordErrorText(
                                        password, confirmPassword ?? ''),
                                hide: true,
                                inputAction: TextInputAction.done,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(Sizes.p16),
                            child: PrimaryButton(
                              text: '申請',
                              isLoading: state.isLoading,
                              onPressed:
                                  state.isLoading ? null : () => _submit(state),
                            ),
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
