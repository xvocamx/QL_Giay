class Validation {
  String? emailValidator(String? text) {
    if(text == null || text.trim().isEmpty){
      return 'Please enter Email';
    }
    return null;
  }
  String? nameValidator(String? text) {
    if(text == null || text.trim().isEmpty){
      return 'Please enter Name';
    }
    return null;
  }
  String? addressValidator(String? text) {
    if(text == null || text.trim().isEmpty){
      return 'Please enter Address';
    }
    return null;
  }
  String? phoneValidator(String? text) {
    if(text == null || text.trim().isEmpty){
      return 'Please enter Phone number';
    }
    return null;
  }
  String? passswordValidator(String? text) {
    if(text == null || text.trim().isEmpty){
      return 'Please enter Password';
    }
    return null;
  }
  String? confirmPasswordValidator(String? text,String password) {
    if(text == null || text.trim().isEmpty){
      return 'Please enter Password';
    }
    if(password != text) {
      return "Password don't match";
    }
    return null;
  }
}