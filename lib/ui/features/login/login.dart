import 'package:flutter/material.dart';

import '../../../core/constanst/images_constants.dart';
import '../../../core/constanst/ui_constans.dart';
import '../../../core/validators/text_validators.dart';
import '../../components/background/background.dart';
import '../../components/botton/botton_action.dart';
import '../../components/textfroms/text_forms.dart';
import '../../styles/palette.dart';
import '../home/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static const route = 'Login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _user = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Background(
        appBar: null,
        children: [
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(UIConstants.buttonHalfSize),
              margin: const EdgeInsets.all(UIConstants.margin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                    'Login',
                    style: Theme.of(context).textTheme.headline2?.copyWith(
                          color: Palette.darkGrey,
                          fontSize: 30,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: UIConstants.buttonHalfSize),
                  Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          CustomTextFormField(
                            text: 'Usuario',
                            controller: _user,
                            imageRoute: ImagesConstants.user,
                            validator: TextValidators.userValidator,
                            havePrefix: true,
                          ),
                          const SizedBox(height: UIConstants.buttonQuartSize),
                          CustomTextFormField(
                            text: 'Contraseña',
                            controller: _password,
                            imageRoute: ImagesConstants.password,
                            validator: TextValidators.passwordValidator,
                            obscureText: true,
                            havePrefix: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: UIConstants.buttonHalfSize),
                  CustomRaisedButton(
                    onPressed: () {
                      //TODO: FIREBASE
                      if (_formKey.currentState!.validate()) {
                       Navigator.pushReplacementNamed(
                        context,
                        Home.route,
                      );
                      }
                    },
                    text: 'Iniciar sesión',
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
