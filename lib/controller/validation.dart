class Validation {
  bool isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  dynamic isValidPass(String pass) {
    if (pass.length < 6) {
      return "required atleast 6 charactors";
    }
    else if(!pass.contains(RegExp(r'[A-Z]'), 0)){
      return "Capital letter required";
    }
    else if(!pass.contains(RegExp(r'[0-9]'), 0)){
      return "Number required";
    }else{
      return null;
    }
    
  }
}
