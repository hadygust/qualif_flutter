import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qualif_flutter/app.dart';
import 'package:qualif_flutter/main.dart';

class LoginPage extends StatefulWidget {
  final Tinder tinder;
  const LoginPage({super.key, required this.tinder});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool aplhanum(String text){
    return text.contains(RegExp(r'[0-9]')) && text.contains(RegExp('^[a-zA-Z]+'));
  }
  
  void handleLogin(){
    String username = usernameController.text;
    String password = passwordController.text;

    if(username.length < 3){

      showDialog(
        context: context, 
        builder: (context){
        return AlertDialog(
            title: const Text("Error"),
            content: const Text("Username length must be at least 3 characters"),
            actions: [
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                child: const Text("OK")
            )],
          );
        }
        
      );

      return;
    }

    if(!aplhanum(password)){

      showDialog(
        context: context, 
        builder: (context){
        return AlertDialog(
            title: const Text("Error"),
            content: const Text("Password must be alphanumeric"),
            actions: [
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                child: const Text("OK")
            )],
          );
        }
        
      );

      return;
    }

    if(!password.contains(RegExp(r'^[a-zA-Z0-9]+$'))){

      showDialog(
        context: context, 
        builder: (context){
        return AlertDialog(
            title: const Text("Error"),
            content: const Text("Password must not contain special characters"),
            actions: [
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                child: const Text("OK")
            )],
          );
        }
        
      );

      return;
    }

    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return Application(username: username, tinder: widget.tinder,);
      }), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/background.png",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/brand_white.png",
                  alignment: Alignment.center,
                  width: size.width * 0.8,
                ),
                TextFieldContainer(size: size, child: Material(child: TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    hintText: "Username",
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none
                  ),
                ),)),
                TextFieldContainer(size: size, child: Material(child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: "Password",
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none
                  ),
                ),)),
                Container(
                  // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  height: 48,
                  decoration: BoxDecoration(
                    // border: Border.all(
                    //   width: 2,
                    //   color: Colors.white
                    // ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  width: size.width * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 250,90,101)),
                      ),
                      onPressed: handleLogin, 
                      child: const Text("Login", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.size, required this.child,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.8,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),

      ),
      child: child,
    );
  }
}