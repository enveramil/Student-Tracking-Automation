import 'package:flutter/material.dart';
import 'package:temel_widget/models/student.dart';
import 'package:temel_widget/validation/student_validator.dart';

class StudentAdd extends StatefulWidget{
  Function() state;
  List<Student> students;
  StudentAdd(this.state,List<Student> students){
    this.students = students;
  }
  @override
  State<StatefulWidget> createState() {
    return  _StudentAddState(state,students);
  }

}

class _StudentAddState extends State with StudentValidationMixin{
  Function() refleshState;
  List<Student> students;
  var student = Student.withoutInfo();
  var formKey = GlobalKey<FormState>(); // formlar arası erişimi sağlar.
  _StudentAddState(reflesh,List<Student> students){
    this.students = students;
    refleshState = reflesh;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Student"),
      ),
      body: SingleChildScrollView( //Overflow By Pixel Error Solution
        child: Container(
          //margin container ile element arasındaki uzaklığa denir.
          margin: EdgeInsets.all(20.0), //bu widget tüm köşelerden boşluk bırakmaya yarar.
          child: Form(
            key: formKey,
            child: Column(
              children: [
                buildFirstNameField(),
                buildLastNameField(),
                buildGradeField(),
                buildSubmitButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Student Name", hintText: "Steven"),
      validator: validateFirstName ,//Alana girilecek verinin formatının uygunluğudur.
      onSaved: (String value){
        student.firstName = value;
      }
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Student Surname", hintText: "Ruby"),
      validator: validateLastName ,//Alana girilecek verinin formatının uygunluğudur.
      onSaved: (String value){
        student.lastName = value;
      }
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Student Grade", hintText: "55"),
      validator: validateGrade ,//Alana girilecek verinin formatının uygunluğudur.
      onSaved: (String grade){
        student.grade = int.parse(grade);
      }
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      child: Text('Yep!'),
      onPressed: (){
        if(formKey.currentState.validate()){
          formKey.currentState.save();
          students.add(student);
          saveStudent();
          refleshState();
          Navigator.pop(context); // kaydet butonuna basıldıktan sonra ana menüye atar.
        }

      },

    );

  }

  void saveStudent() {

    print(student.firstName);
    print(student.lastName);
    print(student.grade);
  }
}