import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:puvoms/constants/material_constant.dart';

// WIDGET
class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

// STATE
class _LoginViewState extends State<LoginView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: Polish -> texts, textfields & button styles

    // Set to true for layout debugging
    debugPaintSizeEnabled = false;

    return Scaffold(
      // resizeToAvoidBottomInset: false, // Ignore screen resize on keyboard popup
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ctUpper(),
            ctLower()
          ]
        )
      )
    );
  }

  // UPPER-PAGE Container
  Widget ctUpper() {
    return Expanded(
      flex: 4,
      child: Padding(
          padding: EdgeInsets.fromLTRB(context.mainWP, context.mainHP, context.mainWP, context.mainHP),
          child: Column(
            children: [
              icLogo(),
              const SizedBox(height: 20),
              lbWelcome()
            ]
          )
      )
    );
  }

  // LOWER-PAGE Container
  Widget ctLower(){
    return Expanded(
        flex: 6,
        child: Padding(
            padding: EdgeInsets.fromLTRB(context.mainWP, context.mainHP, context.mainWP, context.mainHP),
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      lbUsername(),
                      tfUsername(),
                      lbPassword(),
                      tfPassword(),
                      const SizedBox(height: 30),
                      btLogin(),
                      btGuest()
                    ]
                )
            )
        )
    );
  }

  // APPLICATION Logo
  Widget icLogo(){
    return const Expanded(
      flex: 4,
      child: Image(
        image: AssetImage('lib/assets/puvoms_logo.png'),
        fit: BoxFit.contain
      )
    );
  }

  // WELCOME Label
  Widget lbWelcome(){
    return Expanded(
      flex: 1,
        child: Column(
            children: const[
              Expanded(
                child: FittedBox(
                  child: Text("Welcome back!")
                )
              ),
              Expanded(
                child: FittedBox(
                  child: Text("Please login to continue.")
                )
              )
            ]
        )
    );
  }

  // USERNAME Label
  Widget lbUsername(){
    return const FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Text.rich(
                TextSpan(
                    style: TextStyle(fontSize: 20),
                    children: [
                      WidgetSpan(child: Icon(Icons.person)),
                      TextSpan(text: " Username")
                    ]
                )
            )
        )
    );
  }

  // PASSWORD Label
  Widget lbPassword(){
    return const FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.topLeft,
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Text.rich(
                TextSpan(
                    style: TextStyle(fontSize: 20),
                    children: [
                      WidgetSpan(child: Icon(Icons.key)),
                      TextSpan(text: " Password")
                    ]
                )
            )
        )
    );
  }

  // USERNAME TextField
  Widget tfUsername(){
    return const SizedBox(
        child: TextField(
          decoration: InputDecoration(
            hintText: "Enter your username",
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.arrow_right_alt),
          )
        )
    );
  }

  // PASSWORD TextField
  Widget tfPassword(){
    return const SizedBox(
        child: TextField(
          decoration: InputDecoration(
            hintText: "Enter your password",
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.arrow_right_alt)
          )
        )
    );
  }

  // LOGIN Button
  Widget btLogin(){
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(18))
          )
        ),
        onPressed: () {
          // TODO: implement "btLogin" action
        },
        child: const Text(
            "Login",
            style: TextStyle(fontSize: 20)
        )
    );
  }

  // GUEST Button
  Widget btGuest(){
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(18))
          )
        ),
        onPressed: () {
          // TODO: implement "btGuest" action
        },
        child: const Text(
            "Continue as Guest",
            style: TextStyle(fontSize: 20)
        )
    );
  }

}
