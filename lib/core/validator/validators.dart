class Validators{

  Validators._();

  static String? validateEmail(String? val){
    final RegExp emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (val == null){
      return 'Email field is required';
    }else if (val.trim().isEmpty){
      return 'Email field is required';
    }else if (emailRegex.hasMatch(val) == false){
      return 'Email format is not valid';
    }else{
      return null;
    }
  }

  static String? validatePassword(String? val) {
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (val == null){
      return 'Password field is required';
    }else if (val.trim().isEmpty){
      return 'Password field is required';
    } else {
      if (regex.hasMatch(val) == false) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }

  static String? validateConfirmPassword(String? val,String password) {
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (val == null){
      return 'Confirm Password field is required';
    }else if (val.trim().isEmpty){
      return 'Confirm Password field is required';
    } else if (regex.hasMatch(val) == false) {
      return 'Enter valid password';
    }else if (val != password) {
      return 'Confirm password is not match password';
    }else {
      return null;
    }
  }

  static String? validateUsername(String? val) {
    RegExp regex =
    RegExp(r'^[a-zA-Z0-9,.-]+$');
    if (val == null){
      return 'Username field is required';
    }else if (val.trim().isEmpty){
      return 'Username field is required';
    } else if (regex.hasMatch(val) == false) {
      return 'Enter valid Username';
    }else {
      return null;
    }
  }

  static String? validateFullName(String? val) {
    if (val == null){
      return 'FullName field is required';
    }else if (val.trim().isEmpty){
      return 'FullName field is required';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? val) {
    if (val == null){
      return 'Phone number field is required';
    }else if (val.trim().isEmpty){
      return 'Phone number is required';
    }else if (val.length < 11){
      return 'Phone number is not valid';
    } else {
      return null;
    }
  }

}