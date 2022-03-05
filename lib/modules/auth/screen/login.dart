import 'package:blog_minimal/modules/auth/components/auth_button.dart';
import 'package:blog_minimal/modules/home/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:slack_login_button/slack_login_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
    //   setState(() {
    //     _currentUser = account;
    //   });
    //   if (_currentUser != null) {
    //     _handleGetContact(_currentUser!);
    //   }
    // });
    // _googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    // final ImageProvider _imageProvider;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff009ffd),
              Color(0xff2a2a72),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      focusColor: Colors.white,
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text("Sign in"),
            ),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'By clicking Log in, you agree with our Terms. Learn how we process your data in our Privacy Policy and Cookies Policy.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //Botão google

                  // const AuthButton(
                  //   texto: 'LOG IN WITH GOOGLE',
                  //   imagem: AssetImage('assets/images/google.png'),
                  //   cor: Colors.black87,
                  // ),

                  SignInButton(
                    Buttons.Google,
                    text: "Sign up with Google",
                    onPressed: () {},
                  ),

                  //Espaçador
                  const SizedBox(
                    height: 15,
                  ),

                  SlackLoginButton(
                    "4737242421.3190915713221",
                    "50ee0c3f00a2997ab87d8b075c0f5535",
                    ["openid", "profile", "email"],
                    (token) {
                      // token.print(token?.accessToken);
                    },
                  ),

                  //Espaçador
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // //Botão número
                  // const AuthButton(
                  //   texto: 'LOG IN WITH YOUR PHONE',
                  //   imagem: AssetImage('assets/images/chats.png'),
                  //   cor: Colors.black87,
                  // ),
                  // Espaçador
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Trouble logging in?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),

            // Stack(
            //   children: [
            //     Center(
            //       child: Stack(
            //         alignment: Alignment.bottomCenter,
            //         children: [
            //           //Gradiente

            //           // Positioned(
            //           //   top: 10,
            //           //   child: Text(
            //           //     "Login",
            //           //     style: TextStyle(
            //           //       color: Colors.white,
            //           //       fontSize: 16,
            //           //       fontWeight: FontWeight.w400,
            //           //     ),
            //           //   ),
            //           // ),

            //           // Container(
            //           //   // margin: const EdgeInsets.all(10),
            //           //   // padding: const EdgeInsets.all(10),
            //           //   width: MediaQuery.of(context).size.width,
            //           //   // height: 1024,
            //           //   height: MediaQuery.of(context).size.height,

            //           // ),

            //           // Padding(
            //           //   padding: const EdgeInsets.only(bottom: 620),
            //           //   child: Image.asset(
            //           //     'assets/images/tinder_logo.png',
            //           //     fit: BoxFit.cover,
            //           //     alignment: Alignment.topCenter,
            //           //     color: Colors.white,
            //           //     scale: 1.3,
            //           //   ),
            //           // ),

            //         //   Padding(
            //         //     padding: const EdgeInsets.all(25.0),
            //         //     child: Column(
            //         //       mainAxisAlignment: MainAxisAlignment.center,
            //         //       children: [
            //         //         const Text(
            //         //           'By clicking Log in, you agree with our Terms. Learn how we process your data in our Privacy Policy and Cookies Policy.',
            //         //           style: TextStyle(
            //         //             color: Colors.white,
            //         //             fontSize: 16,
            //         //             fontWeight: FontWeight.w400,
            //         //           ),
            //         //           textAlign: TextAlign.center,
            //         //         ),
            //         //         const SizedBox(
            //         //           height: 20,
            //         //         ),
            //         //         //Botão google

            //         //         // const AuthButton(
            //         //         //   texto: 'LOG IN WITH GOOGLE',
            //         //         //   imagem: AssetImage('assets/images/google.png'),
            //         //         //   cor: Colors.black87,
            //         //         // ),

            //         //         SignInButton(
            //         //           Buttons.Google,
            //         //           text: "Sign up with Google",
            //         //           onPressed: () {},
            //         //         ),

            //         //         //Espaçador
            //         //         const SizedBox(
            //         //           height: 15,
            //         //         ),
            //         //         SlackLoginButton(
            //         //           "clientId",
            //         //           "clientSecret",
            //         //           ["scope"],
            //         //           (token) {
            //         //             print(token?.accessToken);
            //         //           },
            //         //         ),
            //         //         //Espaçador
            //         //         // const SizedBox(
            //         //         //   height: 15,
            //         //         // ),
            //         //         // //Botão número
            //         //         // const AuthButton(
            //         //         //   texto: 'LOG IN WITH YOUR PHONE',
            //         //         //   imagem: AssetImage('assets/images/chats.png'),
            //         //         //   cor: Colors.black87,
            //         //         // ),
            //         //         // Espaçador
            //         //         const SizedBox(
            //         //           height: 30,
            //         //         ),
            //         //         const Text(
            //         //           'Trouble logging in?',
            //         //           style: TextStyle(
            //         //             color: Colors.white,
            //         //             fontSize: 18,
            //         //             fontWeight: FontWeight.w700,
            //         //           ),
            //         //         ),
            //         //         const SizedBox(
            //         //           height: 10,
            //         //         ),
            //         //       ],
            //         //     ),
            //         //   ),
            //         // ],
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

class SlackButton extends StatelessWidget {
  const SlackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.button,
      color: Colors.white,
      child: InkWell(
        // onTap: () => onTap(context),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              const Radius.circular(
                4,
              ),
            ),
            border: Border.all(
              width: 1,
              color: Colors.white54,
            ),
          ),
          child: Container(
            padding: EdgeInsets.only(
              right: 16,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(
                  'packages/slack_login_button/assets/images/slack_logo.png',
                  width: 44,
                  height: 44,
                ),
                Text('Sign in with '),
                Text(
                  'Slack',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
