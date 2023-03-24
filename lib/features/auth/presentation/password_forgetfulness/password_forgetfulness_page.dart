import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yne_flutter/app_config.dart';
import 'package:yne_flutter/constants/app_sizes.dart';
import 'package:yne_flutter/features/auth/presentation/password_forgetfulness/password_forgetfulness_controller.dart';
import 'package:yne_flutter/features/auth/presentation/password_forgetfulness/password_forgetfulness_state.dart';
import 'package:yne_flutter/features/auth/presentation/request_sent/request_sent_page.dart';
import 'package:yne_flutter/features/shared/presentation/widgets/async_value_ui.dart';
import 'package:yne_flutter/features/shared/presentation/widgets/custom_input.dart';
import 'package:yne_flutter/features/shared/presentation/widgets/primary_button.dart';
import 'package:yne_flutter/features/shared/presentation/widgets/string_validators.dart';


class PasswordForgetfulnessPage extends ConsumerStatefulWidget {
  const PasswordForgetfulnessPage({Key? key}) : super(key: key);

  @override
  ConsumerState<PasswordForgetfulnessPage> createState() =>
      _PasswordForgetfulnessPageSatae();
}

class _PasswordForgetfulnessPageSatae
    extends ConsumerState<PasswordForgetfulnessPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  var _submitted = false;
  var _success = false;

  String get email => _emailController.text;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _submit(PasswordForgetfulnessState state) async {
    setState(() => _submitted = true);
    if (_formKey.currentState!.validate()) {
      final controller =
          ref.read(passwordForgetfulnessControllerProvider.notifier);
      _success = await controller.submit(email);
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(
      passwordForgetfulnessControllerProvider.select((state) => state.value),
      (_, state) => state.showAlertDialogOnError(context),
    );
    final state = ref.watch(passwordForgetfulnessControllerProvider);
    return _success
        ? RequestSentPage(
            title: '忘記密碼'.hcd,
            mainText: '請至您的『信箱』重新設定密碼'.hcd,
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
                              Padding(
                                padding: const EdgeInsets.all(Sizes.p48),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/logo.png",
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                    ),
                                    const Text(
                                      '忘記密碼',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 29, 23, 23),
                                        fontSize: Sizes.p24,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: const Text(
                                  '請輸入你的帳號或電子郵件地址，我們將寄送你的臨時密碼至你的信箱。',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Sizes.p16,
                                  ),
                                ),
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
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(Sizes.p16),
                            child: PrimaryButton(
                              text: '確認',
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
