import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation_bloc/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:form_validation_bloc/screens/sign_in/bloc/sign_in_event.dart';
import 'package:form_validation_bloc/screens/sign_in/bloc/sign_in_state.dart';

class SignInPage extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In with Email"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(
                    state.errorMessage,
                    style: TextStyle(color: Colors.red),
                  );
                } else {
                  return Container();
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "Email Address",
              ),
              onChanged: (value) {
                BlocProvider.of<SignInBloc>(context).add(SignIntextChangedEvent(
                    _emailController.text, _passwordController.text));
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: "password",
              ),
              onChanged: (value) {
                BlocProvider.of<SignInBloc>(context).add(SignIntextChangedEvent(
                    _emailController.text, _passwordController.text));
              },
            ),
            SizedBox(
              height: 20,
            ),
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInloadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return CupertinoButton(
                  color:
                      (state is SignInValidState) ? Colors.blue : Colors.grey,
                  onPressed: () {
                    if (state is SignInValidState) {
                      BlocProvider.of<SignInBloc>(context).add(
                          SignInSubmittedEvent(
                              _emailController.text, _passwordController.text));
                    }
                  },
                  child: Text("Sign in"),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
