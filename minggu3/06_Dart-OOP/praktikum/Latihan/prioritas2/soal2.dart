class Course {
  String title;
  String description;

  Course(this.title, this.description);
}

class Student {
  String name;
  String className;
  List<Course> courses = [];
  List<Course> hapusCourses = [];

  Student(this.name, this.className);

  void TambahCourse(Course course) {
    courses.add(course);
    print("Course '${course.title}' berhasil ditambahkan.");
  }

  void HapusCourse(Course course) {
    if (courses.contains(course)) {
      courses.remove(course);
      hapusCourses.add(course);
      print("Course '${course.title}' berhasil dihapus.\n");
    } else {
      print("Course '${course.title}' tidak ditemukan dalam daftar course.");
    }
  }

  void StudentInfo() {
    print("Student Info:");
    print("Nama: $name");
    print("Kelas: $className");
    print("\nCourse yang berhasil ditambahkan:");
    if (courses.isEmpty) {
      print(" ");
    } else {
      for (var course in courses) {
        print(" - ${course.title}: ${course.description}");
      }
    }
  }

  void DeletedCourses() {
    print("Course yang telah dihapus:");
    if (hapusCourses.isEmpty) {
      print(" ");
    } else {
      for (var course in hapusCourses) {
        print(" - ${course.title}: ${course.description}");
      }
    }
  }

  void TampilkanInfromasi() {
    StudentInfo();
    DeletedCourses();
    print(
        "\nMaka jumlah Course yang diambil dan course yang diambil: ${courses.length}");
  }
}

void main() {
  Student student = Student("Suzuki", "IX-B");

  Course C1 = Course("Matematika", "Pelajaran tentang Probabilitas");
  Course C2 =
      Course("Bahasa Inggris", "Pelajaran tentang bahasa Present Tense");

  student.TambahCourse(C1);
  student.TambahCourse(C2);
  student.HapusCourse(C2);
  student.TampilkanInfromasi();
}
