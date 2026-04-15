import 'package:cli_student_grader/cli_student_grader.dart'
    as cli_student_grader;

import 'dart:io';

// CONCEPT 3: const
const String appTitle = "Student Grader v1.0";

// CONCEPT 2: final | CONCEPT 20: Set
final Set<String> availableSubjects = {"Math", "English", "Science", "History"};

void main() {
  // CONCEPT 1: var | CONCEPT 19: List | CONCEPT 21: Map
  var students = <Map<String, dynamic>>[];
  var isRunning = true;

  // CONCEPT 18: do-while loop
  do {
    // CONCEPT 12: Multi-line strings | CONCEPT 11: String interpolation
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

    // CONCEPT 14: switch (Menu routing)
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
void addStudent(List<Map<String, dynamic>> students) {}
void recordScore(List<Map<String, dynamic>> students) {}
void addBonusPoints(List<Map<String, dynamic>> students) {}
void addComment(List<Map<String, dynamic>> students) {}
void viewAllStudents(List<Map<String, dynamic>> students) {}
void viewReportCard(List<Map<String, dynamic>> students) {}
void classSummary(List<Map<String, dynamic>> students) {}
