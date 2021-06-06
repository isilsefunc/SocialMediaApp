import 'package:email_validator/email_validator.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_media_app/screens/authenticate/create-new-account.dart';
import 'package:social_media_app/services/auth.dart';
import 'package:social_media_app/utils/pallete.dart';
import 'package:social_media_app/utils/styles.dart';
import 'package:social_media_app/widgets/widgets.dart';
import 'package:social_media_app/screens/authenticate/components/guugleSignIn.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final AuthService _auth = AuthService();

  String mail;
  String pass;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    FirebaseAnalytics().logEvent(name: 'Sign_In',parameters:null);

    return Stack(
      children: [

        BackgroundImage(
          image: 'assets/images/login_bg.png',
        ),

        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Flexible(
                child: Center(
                  child: Text(
                    'Konnekt',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: size.height * 0.08,
                        width:  size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey[500].withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: TextFormField(
                            onSaved: (String value) {
                              mail = value;
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Icon(
                                  FontAwesomeIcons.user,
                                  size: 28,
                                  color: AppColors.kWhite,
                                ),
                              ),
                              hintText: 'Email',
                              hintStyle: AppStyles.kBodyText,
                            ),
                            style: AppStyles.kBodyText,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,

                            validator: (value) {
                              if(value.isEmpty) {
                                return 'Please enter your e-mail';
                              }
                              if(!EmailValidator.validate(value)) {
                                return 'The e-mail address is not valid';
                              }
                              return null;
                            },

                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey[500].withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Icon(
                                  FontAwesomeIcons.lock,
                                  size: 28,
                                  color: AppColors.kWhite,
                                ),
                              ),
                              hintText: 'Password',
                              hintStyle: AppStyles.kBodyText,
                            ),
                            obscureText: true,
                            style: AppStyles.kBodyText,
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if(value.isEmpty) {
                                return 'Please enter your password';
                              }
                              if(value.length < 8) {
                                return 'Password must be at least 8 characters';
                              }
                              return null;
                            },
                            onSaved: (String value) {
                              pass = value;
                            },

                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 35,
                    ),

                    Container(

                      height: size.height * 0.06,
                      width: size.width * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.kBlue,
                      ),
                      child: TextButton(
                        onPressed: () async {

                          if(_formKey.currentState.validate()) {
                            _formKey.currentState.save();

                            dynamic result = await _auth.signInWithEmailAndPassword(mail, pass);

                            if(result == null) {
                              print('Login failed');
                            }
                            else {
                              print('User logged in');
                              Navigator.pushNamed(context, "/home");
                            }

                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text('Logging in')));
                          }
                        },
                        child: Text(
                          'Sign in',
                          style: AppStyles.kBodyText.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    SignInButtonBuilder(
                      icon: Icons.email,
                      text: "Sign in with Google",
                      onPressed: signInWithGoogle,
                      backgroundColor: AppColors.kBlue,
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            child: Text(
                              'Don\'t have an account yet? Register now! -->',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.grey[800],
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        )
      ],
    );
  }
}
