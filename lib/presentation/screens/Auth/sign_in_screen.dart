import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:news_app/logic/bloc/news_bloc.dart';
import 'package:news_app/presentation/router/app_router.dart';
import 'package:news_app/presentation/screens/Widget/const_textfield.dart';
import 'package:news_app/presentation/screens/Widget/sign_in_option.dart';
import 'package:news_app/presentation/screens/card_widget/card.dart';
import 'package:news_app/utils/barrel.dart';
import 'package:news_app/utils/custom_box.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final bool _autoValidate = false;
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          autovalidateMode: _autoValidate
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.welcomeBack,
                  style: Const.extralarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ConstTextField(
                  hintText: Strings.signin,
                  controller: emailController,
                  obscureText: false,
                  onChanged: (value) {
                    setState(() {});
                  },
                  validator: (value) {
                    String pattern =
                        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                        r"{0,253}[a-zA-Z0-9])?)*$";
                    RegExp regex = RegExp(pattern);
                    if (value!.isEmpty) {
                      return "Email cannot be empty";
                    } else if (!regex.hasMatch(value)) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 7),
                ConstTextField(
                    hintText: Strings.password,
                    controller: passwordController,
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Password cannot be empty"),
                      MinLengthValidator(
                          errorText: "password must be at least 6 characters",
                          6),
                    ]),
                    obscureText: _passwordVisible ? false : true,
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        child: Icon(
                            _passwordVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off,
                            color: Colors.black)),
                    onChanged: (value) {
                      setState(() {});
                    }),
                const SizedBox(height: 16),
                CustomBox(
                  height: 48,
                  width: 351,
                  onTap: () {
                    final FormState? form = _formKey.currentState;
                    if (form!.validate()) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeWidget(),
                          ),
                          (route) => false);
                      BlocProvider.of<NewsBloc>(context)
                          .add(GetNews(category: "national"));
                    }
                  },
                  text: Strings.signin,
                  color: emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty
                      ? KColor.green
                      : KColor.listBackgroundColor,
                  style: Const.bold.copyWith(
                      color: emailController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty
                          ? Colors.white
                          : KColor.disableText),
                ),
                const SizedBox(height: 24),
                otherSignInOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
