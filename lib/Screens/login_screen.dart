//para agregar la librería básica solo se debe escribir "importM"
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveler_app/Providers/usuario_provider.dart';
import 'package:traveler_app/Widgets/input_decoration.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    //"Scaffold" crea una pantalla simple para comenzar a trabajar
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        // "Stack" hace que puedan unirse varias capas de widgets (que se puedan montar distintas vistas)
        child: Stack(
          children: [
            //Widget que da el color o formas de fondo
            cajapurpura(),
            //Widget que ubica el icono en la pantalla
            iconopersona(),
            //Widget que realiza el ingreso de datos para el login
            loginform(context),
          ],
        ),
      ),
    );
  }

  Container cajapurpura() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(63, 63, 156, 1),
            Color.fromRGBO(90, 70, 178, 1),
          ],
        ),
      ),
      width: double.infinity,
      height: double.infinity,
    );
  }

  SingleChildScrollView loginform(BuildContext context) {
    final usuarioProvider = Provider.of<usuario_provider>(context);
    TextEditingController txtCorreo = TextEditingController();
    TextEditingController txtPassword = TextEditingController();
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 250),
          Container(
            padding: EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            //height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 1,
                  offset: Offset(5, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(height: 10),
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 30),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        controller: txtCorreo,
                        decoration: InputDecorations.inputDecoration(
                          hintext: 'ejemplo@gmail.com',
                          labeltext: 'Email',
                          icono: Icon(Icons.alternate_email_rounded),
                        ),
                        validator: (value) {
                          String pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regExp = RegExp(pattern);
                          return regExp.hasMatch(value ?? '')
                              ? null
                              : 'Ingrese un email válido';
                        },
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        autocorrect: false,
                        obscureText: true,
                        controller: txtPassword,
                        decoration: InputDecorations.inputDecoration(
                          hintext: '********',
                          labeltext: 'Password',
                          icono: Icon(Icons.lock_rounded),
                        ),
                        validator: (value) {
                          return (value != null && value.length >= 8)
                              ? null
                              : 'La contraseña debe tener más de 8 caracteres';
                        },
                      ),
                      const SizedBox(height: 30),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        disabledColor: Colors.grey,
                        color: Colors.deepPurple,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 80,
                            vertical: 15,
                          ),
                          child: Text(
                            'Ingresar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        onPressed: () {
                          var usuarios = usuarioProvider.usuarios;
                          if (usuarios
                                  .where((e) => e.email == txtCorreo.text)
                                  .isNotEmpty &&
                              usuarios
                                  .where((e) => e.password == txtPassword.text)
                                  .isNotEmpty) {
                            Navigator.pushReplacementNamed(context, 'home');
                          } else {
                            showDialog(
                              useSafeArea: true,
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Usuario no existe'),
                                  content: Text(
                                    'Por favor, ingrese un usuario válido',
                                  ),
                                  actions: [
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                  shape: RoundedRectangleBorder(),
                                );
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          const Text(
            'Crear una cuenta nueva',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  SafeArea iconopersona() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 100),
        width: double.infinity,
        child: Icon(Icons.person_pin, color: Colors.white, size: 100),
      ),
    );
  }
}
