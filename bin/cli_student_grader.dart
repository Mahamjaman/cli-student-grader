import 'package:cli_student_grader/cli_student_grader.dart'
    as cli_student_grader;

import 'dart:io';

//  const
const String appTitle = "Student Grader v1.0";

//  final, Set
final Set<String> availableSubjects = {"Math", "English", "Science", "History"};

void main() {
  // var , List, Map
  var students = <Map<String, dynamic>>[];
  var isRunning = true;

  // do-while loop
  do {
    //Multi-line strings,String interpolation
    print('''
\n===== $appTitle =====
1. Add Student
2. Record Score
3. Add Bonus Points
4. Add Comment
5. View All Students
6. View Report Card
7. Class Summary
8. Exit
''');

    stdout.write("Choose an option: ");
    var choice = stdin.readLineSync();

    // switch (Menu routing)
    switch (choice) {
      case '1':
        addStudent(students);
        break;
      case '2':
        recordScore(students);
        break;
      case '3':
        addBonusPoints(students);
        break;
      case '4':
        addComment(students);
        break;
      case '5':
        viewAllStudents(students);
        break;
      case '6':
        viewReportCard(students);
        break;
      case '7':
        classSummary(students);
        break;
      case '8':
        isRunning = false;
        print("Exiting $appTitle. Goodbye!");
        break;
      default:
        print("Invalid choice. Try again.");
    }
  } while (isRunning);
}

// We will create empty functions for now so the code runs.
void addStudent(List<Map<String, dynamic>> students) {
  stdout.write("Enter student's name: ");
  var name = stdin.readLineSync() ?? "Unknown";

  // CONCEPT 4: int? / String? (Implicitly declared via nullable values in dynamic map)
  var newStudent = <String, dynamic>{
    "name": name,
    "scores": <int>[],
    "subjects": {...availableSubjects}, // CONCEPT 24: Spread operator
    "bonus": null,
    "comment": null,
  };

  students.add(newStudent);
  print("✅ Student '$name' added successfully!");
}

void recordScore(List<Map<String, dynamic>> students) {}
void addBonusPoints(List<Map<String, dynamic>> students) {}
void addComment(List<Map<String, dynamic>> students) {}
void viewAllStudents(List<Map<String, dynamic>> students) {}
void viewReportCard(List<Map<String, dynamic>> students) {}
void classSummary(List<Map<String, dynamic>> students) {}
