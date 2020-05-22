import 'package:cultive_em_casa_app/pages/login/registerPage.dart';
import 'package:cultive_em_casa_app/pages/navigation/navigationPage.dart';
import 'package:cultive_em_casa_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:cultive_em_casa_app/models/user.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return LoginPage();
    }else {
      return NavPage();
    }
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _hideSenha = true;

  final AuthService _auth = AuthService();
  TextEditingController usuarioText = TextEditingController();
  TextEditingController senhaText = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F3F9),
      bottomNavigationBar: Container(
        color: Color(0xFFF1F3F9),
        padding: EdgeInsets.only(bottom: 15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Ainda não tem uma conta? ",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child: Text("Cadastre-se agora",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff79e7a5),
                    decoration: TextDecoration.underline,
                  )),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Image.asset('images/logo_cultive.png'),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Entre na sua",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.black54,
                            fontFamily: 'OpenSans'),
                      ),
                      Text(" conta",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              fontFamily: 'OpenSans',
                              color: Color(0xff79e7a5)))
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 40),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 45,
                        padding: EdgeInsets.only(left: 16, right: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          validator: (val) =>
                              val.isEmpty ? 'Insira um email' : null,
                          controller: usuarioText,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.email,
                                color: Color(0xff79e7a5),
                              ),
                              hintText: 'Email'),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 45,
                        margin: EdgeInsets.only(top: 32),
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          validator: (val) =>
                              val.length < 6 ? 'Senha com 6 digitos' : null,
                          controller: senhaText,
                          obscureText: _hideSenha,
                          decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: EdgeInsetsDirectional.zero,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _hideSenha = !_hideSenha;
                                  });
                                },
                                child: Icon(
                                  _hideSenha
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.lock,
                              color: Color(0xff79e7a5),
                            ),
                            hintText: 'Senha',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.07,
                          MediaQuery.of(context).size.height * 0.02,
                          MediaQuery.of(context).size.width * 0.07,
                          MediaQuery.of(context).size.height * 0.02,
                        ),
                        //width: MediaQuery.of(context).size.width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'Esqueceu a senha?',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xff79e7a5),
                                  decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
                      ),
                      RaisedButton(
                        padding: EdgeInsets.all(0.0),
                        shape: UnderlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(style: BorderStyle.none)),
                        color: Color(0xFFF1F3F9),
                        elevation: 0.0,
                        onPressed: () async {
                          http.Response resp = await http.get('http://10.0.2.2:3333').catchError((e){
                            print(e.toString());
                          });

                          print(resp.body);
                          // if (_formKey.currentState.validate()) {
                          //   print('valido');
                          //   dynamic result =
                          //       await _auth.signInWithEmailAndPassword(
                          //           usuarioText.text, senhaText.text);
                          //   if (result == null) {
                          //     setState(() =>
                          //         error = 'Dados incorretos');
                          //   } else {}
                          // }
                        },
                        textColor: Colors.white,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xff24c4b7),
                                Color(0xff24c4b7),
                                Color(0xff79e7a5)
                              ],
                            ),
                          ),
                          padding: const EdgeInsets.all(12.0),
                          child: Center(
                            child: const Text('ENTRAR',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
