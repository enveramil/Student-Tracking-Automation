class StudentValidationMixin{

  String validateFirstName(String value){

    if(value.length<=2){
      return "The name must have at least three characters.";
    }

  }
  String validateLastName(String value){

    if(value.length<=2){
      return "The surname must have at least three characters.";
    }

  }
  String validateGrade(String grade){
    var value = int.parse(grade);
    if(value<0 || value>100){
      return "Grade must be between 0-100.";
    }

  }
}