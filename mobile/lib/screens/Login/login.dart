import 'package:cultive/models/user.dart';
import 'package:cultive/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:cultive/screens/RegisterUser/registerUser.dart';
import 'package:cultive/screens/Navigation/navigation.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisibility = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Builder(
          builder: (context) => Container(
                color: Colors.white,
                width: width,
                height: height,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(
                      width * 0.12, height * 0.1, width * 0.12, height * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(child: Image.asset('lib/assets/images/logo.png')),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Text('Acesse sua conta:',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Color(0xff2E965B))),
                      TextField(
                        controller: email,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(
                              Feather.mail,
                              color: Color(0xff2E965B),
                            )),
                      ),
                      TextField(
                        controller: password,
                        obscureText: passwordVisibility,
                        decoration: InputDecoration(
                            labelText: 'Senha',
                            prefixIcon:
                                Icon(Feather.lock, color: Color(0xff2E965B)),
                            suffixIcon: IconButton(
                                icon: Icon((passwordVisibility)
                                    ? Feather.eye_off
                                    : Feather.eye),
                                color: Color(0xffcccccc),
                                onPressed: () => {
                                      setState(() {
                                        passwordVisibility =
                                            !passwordVisibility;
                                      })
                                    })),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: width,
                          padding: EdgeInsets.fromLTRB(
                              0, height * 0.02, 0, height * 0.05),
                          child: Text('Esqueceu a senha?',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 12,
                                  decoration: TextDecoration.underline,
                                  color: Color(0xff2E965B))),
                        ),
                      ),
                      Container(
                        width: width,
                        padding: EdgeInsets.only(bottom: height * 0.1),
                        child: RaisedButton(
                          onPressed: () async {
                            FocusScope.of(context).unfocus();
                            final auth = AuthService();
                            await auth
                                .login(
                                    username: email.text,
                                    password: password.text)
                                .then((user) => {
                                      user != null
                                          ? _storeUserAndNavigate(user, context)
                                          : _showSnackBar(context)
                                    });
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(19)),
                          child: Text(
                            'ACESSAR',
                            style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          color: Color(0xff2E965B),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.white,
        child: GestureDetector(
          onTap: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegisterUser()))
          },
          child: Center(
            child: Text.rich(
              TextSpan(
                text: 'Ainda não possui uma conta? ',
                style: TextStyle(fontSize: 12, color: Color(0xff2E965B)),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Cadastre-se',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      )),
                  // can add more TextSpans here...
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _storeUserAndNavigate(User user, BuildContext context) {
    Provider.of<User>(context, listen: false).setUser(user);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => NavigationScreen()),
        (_) => false);
  }

  _showSnackBar(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Usuário incorreto'),
        backgroundColor: Colors.red.shade400,
      ),
    );
  }
}
