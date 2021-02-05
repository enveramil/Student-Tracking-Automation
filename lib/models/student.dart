class Student{
  int id;
  String firstName;
  String lastName;
  int grade;
  String _status;

  Student.withId(int id,String firstName, String lastName, int grade){
    this.id = id;
    this.firstName =firstName;
    this.lastName = lastName;
    this.grade = grade;

}
  Student(String firstName, String lastName, int grade){

    this.firstName =firstName;
    this.lastName = lastName;
    this.grade = grade;

  }

  Student.withoutInfo(){ // herhangi bir bilgi gerekmeden girilen constructordır.

  }
  String get getFirstName{
    return "OGR - " + this.firstName;
  }

  void set setFirstName(String value){
    this.firstName = value;
  }

  String get getStatus{
    String message = "";
    if (this.grade >= 50) {
      message = "Pass";
    } else if (this.grade >= 40) {
      message = "Integration";
    } else {
      message = "Fail";
    }
    return message;
  }
}