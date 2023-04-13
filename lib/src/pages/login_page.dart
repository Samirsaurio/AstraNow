import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:astranow/auth.dart';

class LoginPage extends StatefulWidget {

  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try{
      await Auth().signInWithEmailAndPassword(
      email: _controllerEmail.text,
      password: _controllerPassword.text);
    } on FirebaseAuthException catch (e){
      setState((){
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try{
      await Auth().createUserWithEmailAndPassword(email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e){
      setState((){
        errorMessage = e.message;
      });
    }
  }
  String _correo = "";
  String _passw = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            height: size.height,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset('images/mancha1.png'),
                  width: size.width * 0.3,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset('images/mancha2.png'),
                  width: size.width * 0.3,
                ),
                Column(children: <Widget>[
                  SizedBox(
                    height: size.height * 0.2,
                  ),
                  Center(child: _logo(size.height * 0.07)),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  _entryField('email', _controllerEmail, size),
                  _entryField('password', _controllerPassword, size),

                  _submitButton(size),
                  _errorMessage(),
                  _loginOrRegisterButton(),
                ]),
              ],
            )));
  }

  Widget _entryField(String title, TextEditingController controller, Size size){ //generado

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      width: size.width * 0.8,
      height: 50.0,
      decoration: BoxDecoration(
        color: Color(int.parse('#055681'.replaceAll('#', '0xff'))),
        borderRadius: BorderRadius.circular(19,)
      ),
      child: TextField(
        obscureText: title == 'password' ? true : false,
        controller: controller,
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
          hintText: title == 'password' ? 'Contraseña' : 'Usuario',
          icon: Icon(
            title == 'password' ? Icons.lock : Icons.person,
            color: Colors.blue,
          ),
          border: InputBorder.none,
        ),
    ),
    );
  }

  Widget _errorMessage(){ //generado
    return Text(errorMessage == ''? '': 'Humm ? $errorMessage');
  }

  Widget _submitButton(Size size){ //generado
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      width: size.width * 0.8,
      height: 50.0,
      decoration: BoxDecoration(
        color: Color(int.parse('#2C296C'.replaceAll('#', '0xff'))),
        borderRadius: BorderRadius.circular(19,)
      ),
      child: ElevatedButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color(int.parse('#2C296C'.replaceAll('#', '0xff'))))),
        onPressed: isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,

    child: Text(isLogin ? 'Login' : 'Register',)));
  }

  Widget _loginOrRegisterButton(){
    return TextButton(
      child: Text(isLogin ? 'Register istead' : 'Login instead'),
      onPressed: () {
        setState((){
          isLogin = !isLogin;
        });
      },
    );
  }

  Widget _logo(double _height) {
    return Image.asset(
      'images/astranowlogo.png',
      height: _height,
    );
  }

  Widget _forgotPassword() {
    return const SizedBox(
      height: 30,
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          '¿Olvidaste tu contraseña?',
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _textTest() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(fontSize: 10),
      decoration: const InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        suffixIcon: Icon(Icons.alternate_email),
      ),
      onChanged: (value) {
        setState(() {
          _correo = value;
        });
      },
    );
  }

  Widget _passwordText() {
    return Container(
      child: TextFormField(
        autocorrect: false,
        enableSuggestions: false,
        keyboardType: TextInputType.visiblePassword,
        style: const TextStyle(fontSize: 10),
        obscureText: true,
        decoration: const InputDecoration(
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          labelText: 'Contraseña',
          suffixIcon: Icon(Icons.lock),
        ),
        onChanged: (value2) {
          setState(() {
            _passw = value2;
          });
        },
      ),
    );
  }

  Widget _logButton(){
    return TextButton(
      onPressed: (){_nextPage(_correo, _passw);},
      child: Text("Entrar"));
  }

  _nextPage(String emailsito, String passwordsita)
  {

    if (emailsito.toString() == "samirxd2000@hotmail.com" && passwordsita.toString() == "1005")
    {
      Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
    }
    else {
      _alert();
    }
  }

  _alert()
  {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context)
      {
        return AlertDialog(
          title: Text("Ups!"),
          content: Text("Contraseña o correo incorrectos"),
          actions: <Widget>[
            TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text("Ok"))
          ],
        );

      },
    );
  }
}
