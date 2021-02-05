import 'package:flutter/material.dart';
import 'package:temel_widget/models/student.dart';
import 'package:temel_widget/validation/student_validator.dart';

class StudentEdit extends StatefulWidget{
  Function() state;
  Student selectedStudent;
  StudentEdit(this.state,Student selectedStudent){
    this.selectedStudent = selectedStudent;
  }
  @override
  State<StatefulWidget> createState() {
    return  _StudentEditState(state,selectedStudent);
  }

}

class _StudentEditState extends State with StudentValidationMixin{
  Function() refleshState;
  Student selectedStudent;
  var formKey = GlobalKey<FormState>(); // formlar arası erişimi sağlar.
  _StudentEditState(reflesh,Student selectedStudent){
    this.selectedStudent = selectedStudent;
    refleshState = reflesh;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Update Student"),
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
      initialValue: selectedStudent.firstName,
        decoration: InputDecoration(labelText: "Student Name", hintText: "Steven"),
        validator: validateFirstName ,//Alana girilecek verinin formatının uygunluğudur.
        onSaved: (String value){
          selectedStudent.firstName = value;
        }
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      initialValue: selectedStudent.lastName,
        decoration: InputDecoration(labelText: "Student Surname", hintText: "Ruby"),
        validator: validateLastName ,//Alana girilecek verinin formatının uygunluğudur.
        onSaved: (String value){
          selectedStudent.lastName = value;
        }
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      initialValue: selectedStudent.grade.toString(),
        decoration: InputDecoration(labelText: "Student Grade", hintText: "55"),
        validator: validateGrade ,//Alana girilecek verinin formatının uygunluğudur.
        onSaved: (String grade){
          selectedStudent.grade = int.parse(grade);
        }
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      child: Text('Yep!'),
      onPressed: (){
        if(formKey.currentState.validate()){
          formKey.currentState.save();
          saveStudent();
          refleshState();
          Navigator.pop(context); // kaydet butonuna basıldıktan sonra ana menüye atar.
        }

      },

    );

  }

  void saveStudent() {

    print(selectedStudent.firstName);
    print(selectedStudent.lastName);
    print(selectedStudent.grade);
  }
}