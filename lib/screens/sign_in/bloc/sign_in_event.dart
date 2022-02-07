abstract class SignInEvent {}

class SignIntextChangedEvent extends SignInEvent {
  final String emailValue;
  final String passwordValue;
  SignIntextChangedEvent(this.emailValue, this.passwordValue);
}

class SignInSubmittedEvent extends SignInEvent {
  final String email;
  final String password;
  SignInSubmittedEvent(this.email, this.password);
}
