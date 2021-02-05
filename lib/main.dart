import 'package:flutter/material.dart';
import 'package:temel_widget/models/student.dart';
import 'package:temel_widget/screens/student_add.dart';
import 'package:temel_widget/screens/student_edit.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String message = "STUDENT TRACKING AUTOMATION";

  Student selectedStudent = Student.withId(0, "", "", 0);

  List<Student> students = [
    Student.withId(1,"Kevin", "Scoff", 25),
    Student.withId(2,"John", "Walker", 65),
    Student.withId(3,"Richard", "Smith", 45),
    Student.withId(4, "Drew", "Bell", 48),
    Student.withId(4, "David", "Byer", 84),
    Student.withId(4, "Olivia", "Perry", 75),
    Student.withId(4, "William", "Jones", 66),
    Student.withId(4, "Emma", "Aiden", 53),
    Student.withId(4, "Alen", "Lee", 34),
    Student.withId(4, "Harry", "Brown", 71),
    Student.withId(4, "Marvin", "King", 68),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(message),
      ),
      body: buildBody(context),
    );
  }

  void refleshState()
  {
    setState((){});
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("Process Result"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {

    return Column(
      children: [
        Expanded(

            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("lib/img/profile.jpg"),
                    ),
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastName),
                    subtitle: Text("Exam Grade: " +
                        students[index].grade.toString() +
                        " [" +
                        students[index].getStatus +
                        "]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                        selectedStudent = students[index];
                      });

                      print(selectedStudent.firstName);
                    },
                  );
                })),
        Text("Selected Student: " + selectedStudent.firstName + " " + selectedStudent.lastName),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: RaisedButton(
                color: Colors.greenAccent,
                child: Row(
                  children: [
                    Icon(Icons.add), //ikon ekler
                    SizedBox(width: 5.0,), //ikon ile yazı arasında boşluk bırakır.

                    Text("New Student"),
                  ],
                ),
                onPressed: (){
                  //Diğer sayfaya yönlendirme komutudur.
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(refleshState,students)));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.black12,
                child: Row(
                  children: [
                    Icon(Icons.update),
                    SizedBox(width: 5.0, ),
                    Text("Update"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentEdit(refleshState,selectedStudent)));

                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.amberAccent,
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(width: 5.0,),
                    Text("Delete"),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                  });

                  var mesaj = "Deleted: " + selectedStudent.firstName;
                  mesajGoster(context, mesaj);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
