import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parent/core/constants/colors.dart';
import 'package:parent/core/utils/logger.dart';
import 'package:parent/core/utils/validators.dart';
import 'package:parent/features/auth/controller/auth_cubit.dart';
import 'package:parent/features/home/pages/home_page.dart';
import 'package:parent/features/shared/widgets/custom_button.dart';
import 'package:parent/features/shared/widgets/custom_form_field.dart';
import 'package:parent/l10n/l10n.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _userEmailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _userEmailController.dispose();
    _passwordController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is LoginCompleted) {
                Navigator.of(context)
                    .pushReplacementNamed(HomePage.routeName);
              } else if (state is LoginError) {
                AppLog.showSnackBar(context, context.localizeError(state.message));
              }
              // TODO: handle all states
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 64),
                  _fieldTitle(context.l10n.email),
                  const SizedBox(height: 4),
                  CustomFormField(
                    enabled: state is! LoginLoading,
                    controller: _userEmailController,
                    label: 'Example@gmail.com',
                    keyboardType: TextInputType.emailAddress,
                    validate: FormsValidators.validateEmailField,
                  ),
                  const SizedBox(height: 24),
                  _fieldTitle(context.l10n.password),
                  const SizedBox(height: 4),
                  CustomFormField(
                    enabled: state is! LoginLoading,
                    controller: _passwordController,
                    textInputAction: TextInputAction.done,
                    isSecretValue: true,
                    label: '*********',
                    validate: FormsValidators.validatePasswordField,
                  ),
                  const SizedBox(height: 48),
                  CustomButton(
                      title: context.l10n.login,
                      enabled: state is! LoginLoading,
                      onPressed:  () {
                              bool isValidForm =
                                  _formKey.currentState?.validate() ?? false;
                              if (!isValidForm) return;
                              context.read<AuthCubit>().login(
                                    email: _userEmailController.text,
                                    password: _passwordController.text,
                                  );
                            }),
                  const SizedBox(height: 52),
                ],
              );
            },
          ),
        ));
  }

  Widget _fieldTitle(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.button?.copyWith(
            color: AppColors.darkGrey,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
