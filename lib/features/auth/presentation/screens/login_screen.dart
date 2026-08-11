import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pulse_flutter/core/routes/route_constants.dart';
import 'package:pulse_flutter/core/utils/validators.dart';
import 'package:pulse_flutter/core/constants/app_sizes.dart';
import 'package:pulse_flutter/core/constants/app_strings.dart';
import 'package:pulse_flutter/features/auth/presentation/providers/auth_notifier.dart';
import 'package:pulse_flutter/features/auth/presentation/widgets/auth_header.dart';
import 'package:pulse_flutter/features/chat/presentation/providers/socket_provider.dart';
import 'package:pulse_flutter/shared/widgets/custom_button.dart';
import 'package:pulse_flutter/shared/widgets/custom_snackbar.dart';
import 'package:pulse_flutter/shared/widgets/custom_text_field.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) {
        ref.read(loginNotifierProvider.notifier).resetState();
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(loginNotifierProvider);

    ref.listen(loginNotifierProvider, (previous, next) {
      if (next.isSuccess) {
        CustomSnackbar.showSuccess(context, 'Logged in successfully');
        ref.read(socketServiceProvider).connect();
        ref.read(loginNotifierProvider.notifier).resetState();
        context.go(RouteConstants.home);
      } else if (next.errorMessage != null) {
        CustomSnackbar.showError(context, next.errorMessage!);
        ref.read(loginNotifierProvider.notifier).resetState();
      }
    });

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.md),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSizes.xxl),

                const AuthHeader(
                  title: AppStrings.welcomeBack,
                  subtitle: AppStrings.signInToContinue,
                ),

                const SizedBox(height: AppSizes.xl),

                CustomTextField(
                  controller: _emailController,
                  hintText: AppStrings.emailHint,
                  keyboardType: TextInputType.emailAddress,
                  focusNode: _emailFocusNode,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_passwordFocusNode);
                  },
                  validator: Validators.validateEmail,
                ),

                const SizedBox(height: AppSizes.md),

                CustomTextField(
                  controller: _passwordController,
                  hintText: AppStrings.passwordHint,
                  obscureText: _obscurePassword,
                  focusNode: _passwordFocusNode,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).unfocus();
                  },
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                  validator: Validators.validatePassword,
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(AppStrings.forgotPassword),
                  ),
                ),

                const SizedBox(height: AppSizes.lg),

                CustomButton(
                  text: AppStrings.login,
                  isLoading: authState.isLoading,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ref
                          .read(loginNotifierProvider.notifier)
                          .login(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                          );
                    }
                  },
                ),

                const SizedBox(height: AppSizes.lg),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(AppStrings.dontHaveAccount),
                    TextButton(
                      onPressed: () {
                        context.push(RouteConstants.signup);
                      },
                      child: const Text(AppStrings.signUp),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
