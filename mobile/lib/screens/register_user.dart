import 'package:cultive/models/user.dart';
import 'package:cultive/screens/navigation.dart';
import 'package:cultive/services/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class RegisterUser extends StatefulWidget {
  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  bool passwordVisibility = true;
  bool passwordConfirmVisibility = true;

  TextEditingController nome = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  String _messageImage = "Toque para adicionar sua foto";
  String get messageImage => _messageImage;

  PickedFile _image;
  final picker = ImagePicker();

  getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _messageImage = "Imagem adicionada!";
      _image = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(CupertinoIcons.back, color: Color(0xff66C48B)),
              Text('Login',
                  style: TextStyle(
                    color: Color(0xff737373),
                    fontSize: 14,
                  ))
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Builder(
          builder: (context) => SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Cadastre-se",
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 22,
                              color: Color(0xff272727))),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              GestureDetector(
                                  onTap: getImage,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        height: 60,
                                        width: 60,
                                        child: Icon(
                                          Feather.user,
                                          color: Color(0xff2E965B),
                                          size: 32,
                                        ),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(80)),
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                  color: Colors.grey.shade300,
                                                  offset: Offset(0, 4),
                                                  blurRadius: 4)
                                            ]),
                                      ),
                                      Text(
                                        messageImage,
                                        style: TextStyle(
                                            color: Color(0xff2E965B),
                                            fontSize: 10),
                                      )
                                    ],
                                  )),
                              TextField(
                                controller: nome,
                                decoration: InputDecoration(
                                    labelText: 'Nome',
                                    prefixIcon: Icon(
                                      Feather.user,
                                      color: Color(0xff2E965B),
                                    )),
                              ),
                              TextField(
                                controller: username,
                                decoration: InputDecoration(
                                    labelText: 'Username',
                                    prefixIcon: Icon(
                                      Feather.user,
                                      color: Color(0xff2E965B),
                                    )),
                              ),
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
                                    prefixIcon: Icon(Feather.lock,
                                        color: Color(0xff2E965B)),
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
                              TextField(
                                controller: confirmPassword,
                                obscureText: passwordConfirmVisibility,
                                decoration: InputDecoration(
                                    labelText: 'Confirmar Senha',
                                    prefixIcon: Icon(Feather.lock,
                                        color: Color(0xff2E965B)),
                                    suffixIcon: IconButton(
                                        icon: Icon((passwordConfirmVisibility)
                                            ? Feather.eye_off
                                            : Feather.eye),
                                        color: Color(0xffcccccc),
                                        onPressed: () => {
                                              setState(() {
                                                passwordConfirmVisibility =
                                                    !passwordConfirmVisibility;
                                              })
                                            })),
                              ),
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(top: 20),
                                child: RaisedButton(
                                  onPressed: () => {cadastrarUser(context)},
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(19)),
                                  child: Text(
                                    'CADASTRAR',
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
                      )
                    ],
                  ),
                ),
              )),
    );
  }

  cadastrarUser(BuildContext context) async {
    if (nome.text == null ||
        username.text == null ||
        email.text == null ||
        password.text == null ||
        _image == null) {
      _showSnackBar(context, "Prencha todos os campos");
      return;
    }
    if (password.text != confirmPassword.text) {
      _showSnackBar(context, "Senhas não batem");
      return;
    }

    final _service = UserService();
    await _service
        .login(
          file: _image,
          nome: nome.text,
          username: username.text,
          email: email.text,
          password: password.text,
        )
        .then((user) {
              return user != null
                  ? _storeUserAndNavigate(user, context)
                  : _showSnackBar(
                      context, 'Problema inesperado, tente mais tarde!');
            });
  }

  _storeUserAndNavigate(User user, BuildContext context) {
    Provider.of<User>(context, listen: false).setUser(user);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => NavigationScreen()),
        (_) => false);
  }

  _showSnackBar(BuildContext context, String text) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: Colors.red.shade400,
      ),
    );
  }
}
