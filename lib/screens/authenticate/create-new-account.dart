import 'dart:ui';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/screens/home.dart';
import 'package:email_validator/email_validator.dart';
import 'package:social_media_app/services/auth.dart';
import 'package:social_media_app/utils/pallete.dart';
import 'package:social_media_app/utils/styles.dart';
import 'package:social_media_app/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final AuthService _auth = AuthService();
  String _email, _password, _password2;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    FirebaseAnalytics().logEvent(name: 'Register',parameters:null);
    return Stack(
      children: [
        BackgroundImage(image: 'assets/images/register_bg.png'),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.1,
                ),
                Stack(
                  children: [
                    Center(
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: CircleAvatar(
                            radius: size.width * 0.14,
                            backgroundColor: Colors.grey[400].withOpacity(
                              0.4,
                            ),
                            child: Icon(
                              FontAwesomeIcons.user,
                              color: AppColors.kWhite,
                              size: size.width * 0.1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.08,
                      left: size.width * 0.56,
                      child: Container(
                        height: size.width * 0.1,
                        width: size.width * 0.1,
                        decoration: BoxDecoration(
                          color: AppColors.kBlue,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.kWhite, width: 2),
                        ),
                        child: Icon(
                          FontAwesomeIcons.arrowUp,
                          color: AppColors.kWhite,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.width * 0.1,
                ),
                Form(
                  key: _formKey,
                  child: Column(
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
                    onChanged: (value) {
                      setState(() {
                        _email = value.trim();
                      });
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
                    onChanged: (value) {
                      setState(() {
                        _password = value.trim();
                      });
                    },
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
                      _password = value;
                      if(value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if(value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      if(value != _password2) {
                        return 'Passwords don\'t match';
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
                              onChanged: (value) {
                                setState(() {
                                  _password2 = value.trim();
                                });
                              },
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
                                hintText: 'Password Confirm',
                                hintStyle: AppStyles.kBodyText,
                              ),
                              obscureText: true,
                              style: AppStyles.kBodyText,
                              textInputAction: TextInputAction.done,

                              validator: (value) {
                                _password2 = value;
                                if(value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if(value.length < 8) {
                                  return 'Password must be at least 8 characters';
                                }
                                if(value != _password) {
                                  return 'Passwords don\'t match';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 25,
                      ),
                      // ignore: deprecated_member_use

                      Container(
                      height: size.height * 0.08,
                      width: size.width * 0.5,
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.kBlue,
                      ),
                      child: TextButton(
                        onPressed: () async {

                          if(_formKey.currentState.validate()) {
                            _formKey.currentState.save();

                            dynamic result = await _auth.registerWithEmailAndPassword(_email, _password);
                            print(result);

                            if(result == null) {
                              print('Registration failed');
                            }
                            else {
                              print('User registered');
                              Navigator.pushNamed(context, "/home");
                            }

                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text('Logging in')));
                          }

                        },
                      child: Text(
                      'Sign up',
                      style: AppStyles.kBodyText.copyWith(fontWeight: FontWeight.bold),
                      ),
                      ),
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
