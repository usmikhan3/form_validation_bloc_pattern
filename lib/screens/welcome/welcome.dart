import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation_bloc/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:form_validation_bloc/screens/sign_in/sign_in.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Example",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              width: 300,
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => BlocProvider(
                              create: (context) => SignInBloc(),
                              child: SignInPage(),
                            )),
                  );
                },
                child: Text("Sign In"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
