import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pulse_flutter/core/constants/app_sizes.dart';
import 'package:pulse_flutter/core/constants/app_strings.dart';
import 'package:pulse_flutter/core/utils/validators.dart';
import 'package:pulse_flutter/features/auth/presentation/widgets/auth_header.dart';
import 'package:pulse_flutter/shared/widgets/custom_button.dart';
import 'package:pulse_flutter/shared/widgets/custom_text_field.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _fullNameFocusNode = FocusNode();
  final _usernameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  bool isLoading = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    _fullNameFocusNode.dispose();
    _usernameFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  title: AppStrings.createAccount,
                  subtitle: AppStrings.letsGetStarted,
                ),
                const SizedBox(height: AppSizes.xl),
                CustomTextField(
                  controller: _fullNameController,
                  hintText: AppStrings.fullNameHint,
                  focusNode: _fullNameFocusNode,
                  textInputAction: TextInputAction.next,
                  validator: Validators.validateName,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_usernameFocusNode);
                  },
                ),
                const SizedBox(height: AppSizes.md),
                CustomTextField(
                  controller: _emailController,
                  hintText: AppStrings.emailHint,
                  keyboardType: TextInputType.emailAddress,
                  focusNode: _emailFocusNode,
                  textInputAction: TextInputAction.next,
                  validator: Validators.validateEmail,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_phoneFocusNode);
                  },
                ),
                const SizedBox(height: AppSizes.md),
                CustomTextField(
                  controller: _phoneController,
                  hintText: AppStrings.phoneHint,
                  keyboardType: TextInputType.phone,
                  focusNode: _phoneFocusNode,
                  textInputAction: TextInputAction.next,
                  validator: Validators.validatePhone,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_passwordFocusNode);
                  },
                ),
                const SizedBox(height: AppSizes.md),
                CustomTextField(
                  controller: _passwordController,
                  hintText: AppStrings.passwordHint,
                  obscureText: _obscurePassword,
                  focusNode: _passwordFocusNode,
                  textInputAction: TextInputAction.next,
                  validator: Validators.validatePassword,
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
                  onFieldSubmitted: (_) {
                    FocusScope.of(
                      context,
                    ).requestFocus(_confirmPasswordFocusNode);
                  },
                ),
                const SizedBox(height: AppSizes.md),
                CustomTextField(
                  controller: _confirmPasswordController,
                  hintText: AppStrings.confirmPasswordHint,
                  obscureText: _obscureConfirmPassword,
                  focusNode: _confirmPasswordFocusNode,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    return Validators.validateConfirmPassword(
                      value,
                      _passwordController.text,
                    );
                  },
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).unfocus();
                  },
                ),
                const SizedBox(height: AppSizes.lg),
                CustomButton(
                  text: AppStrings.signUp,
                  isLoading: isLoading,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // TODO: Call signup API
                    }
                  },
                ),
                const SizedBox(height: AppSizes.md),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(AppStrings.alreadyHaveAccount),
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: const Text(AppStrings.login),
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
