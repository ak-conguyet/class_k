abstract class Login_Event{}

class Login_request extends Login_Event{
  final String email;
  final String password;
  Login_request(this.email, this.password);
}