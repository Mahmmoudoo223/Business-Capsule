class EnrolledCourses{
  static List<String> _list = [];

  static List<String> get list {
    return _list;
  }

  static set list(List<String> value) {
    _list = value;
  }

  static void addCourse(String item) {
    if(!_list.contains(item)){
      _list.add(item);
    }
  }

  static void removeCourse(String item) {
    _list.remove(item);
  }
  static List<String> copyOflist() {
    return List<String>.from(_list);
  }
}