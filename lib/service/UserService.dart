class UserService{
  static bool _isLogged = false;

  static bool LogIn(String username, String password){
    if(username == "user" && password=="pass"){
      _isLogged = true;
    }else{
      _isLogged = false;
    }

    return _isLogged;
  }
}