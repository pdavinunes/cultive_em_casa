import 'package:cultive_em_casa_app/services/auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usuarioText = TextEditingController();
  TextEditingController senhaText = TextEditingController();
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close),
        ),
        backgroundColor: Color(0xff75E8A3),
        title: Text(
          'Cadastro',
        ),
      ),
      backgroundColor: Color(0xffF1F5F9),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Divider(
                  color: Colors.transparent,
                  height: 30,
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    child: TextFormField(
                      validator: (val) => val.isEmpty ? 'Insira um email' : null,
                      controller: usuarioText,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.email,
                            color: Colors.greenAccent,
                          ),
                          hintText: 'Email'),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: TextFormField(
                      validator: (val) => val.length < 6 ? 'Senha com 6 digitos' : null,
                      controller: senhaText,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.lock,
                            color: Colors.greenAccent,
                          ),
                          hintText: 'Senha'),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.transparent,
                  height: 50,
                ),
                RaisedButton(
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      dynamic result = await _auth.registerWithEmailAndPassword(
                                                    usuarioText.text, 
                                                    senhaText.text);
                      if(result == null) {
                        setState(() => error = 'Por favor, digite um email valido');
                      }
                    }
                  },
                  color: Color(0xff6ACC91),
                  child: Text(
                    'CADASTRAR',
                    style: TextStyle(color: Colors.white),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                ),
                SizedBox(height: 12.0,),
                Text(error,
                 style: TextStyle(color: Colors.red, fontSize: 14),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
