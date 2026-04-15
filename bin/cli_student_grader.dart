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

  // int? / String?
  var newStudent = <String, dynamic>{
    "name": name,
    "scores": <int>[],
    "subjects": {...availableSubjects}, // Spread operator
    "bonus": null,
    "comment": null,
  };

  students.add(newStudent);
  print("✅ Student '$name' added successfully!");
}

// Helper function to easily select a student
Map<String, dynamic>? selectStudent(List<Map<String, dynamic>> students) {
  if (students.isEmpty) {
    print("No students available. Add a student first.");
    return null;
  }

  // for loop (indexed)
  for (int i = 0; i < students.length; i++) {
    print("${i + 1}. ${students[i]["name"]}");
  }

  stdout.write("Select a student number: ");
  var index = int.tryParse(stdin.readLineSync() ?? "") ?? -1;

  if (index >= 1 && index <= students.length) {
    return students[index - 1];
  }

  print("Invalid selection.");
  return null;
}

void recordScore(List<Map<String, dynamic>> students) {
  var student = selectStudent(students);
  if (student == null) return;

  print("Available subjects: ${student["subjects"]}");

  int score = -1;
  // while loop, Relational operators
  while (score < 0 || score > 100) {
    stdout.write("Enter score (0-100): ");
    score = int.tryParse(stdin.readLineSync() ?? "-1") ?? -1;
    if (score < 0 || score > 100) {
      print("❌ Invalid score. Must be between 0 and 100.");
    }
  }

  (student["scores"] as List<int>).add(score);
  print("✅ Score recorded for ${student["name"]}.");
}

void addBonusPoints(List<Map<String, dynamic>> students) {
  var student = selectStudent(students);
  if (student == null) return;

  stdout.write("Enter bonus points (1-10): ");
  var bonus = int.tryParse(stdin.readLineSync() ?? "");

  if (bonus != null && bonus >= 1 && bonus <= 10) {
    if (student["bonus"] == null) {
      //??= (null-aware assign)
      student["bonus"] ??= bonus;
      print("✅ Bonus added!");
    } else {
      print("⚠️ Bonus was already set to ${student["bonus"]}.");
    }
  } else {
    print("❌ Invalid bonus amount.");
  }
}

void addComment(List<Map<String, dynamic>> students) {
  var student = selectStudent(students);
  if (student == null) return;

  stdout.write("Enter teacher comment: ");
  student["comment"] = stdin.readLineSync();
  print("✅ Comment recorded.");
}

void viewAllStudents(List<Map<String, dynamic>> students) {}
void viewReportCard(List<Map<String, dynamic>> students) {}
void classSummary(List<Map<String, dynamic>> students) {}
