import 'doctor.dart';

class Course {
  late final String courseName;
  late final int courseId;
  late final int levelNumber;
  late final List<Doctor> doctors;
  Course(this.courseName, this.courseId, this.levelNumber, this.doctors);

  static List<Course> details = [
    // level 1
    Course(
      'اصول الاقتصاد2 ',
      1,
      1,
      [
        Doctor('محمود الجبالي', 'assets/images/amr_gbaly.jpg'),
        Doctor('احمد موسى', 'assets/images/ahmed_mousa.jpg'),
      ],
    ),
    Course(
      'نطوير اقتصادي',
      2,
      1,
      [
        Doctor('عمرو الجبالي'),
        Doctor('احمد موسى'),
      ],
    ),
    Course(
      'السلوك التنظيمي',
      3,
      1,
      [
        Doctor('اسلام الحديدي '),
      ],
    ),
    Course(
      'الادارة العامة',
      4,
      1,
      [
        Doctor('اسلام الحديدي '),
      ],
    ),
    Course(
      'اصول المحاسبة 2',
      5,
      1,
      [
        Doctor('محمود عزمي'),
        Doctor('اشرف الصباحي'),
      ],
    ),
    Course(
      'مدخل القانون',
      6,
      1,
      [
        Doctor('حسام الطوخي'),
        Doctor('حاتم الشهاوي'),
      ],
    ),
    // level 2
    Course(
      'ادارة الانتاج',
      7,
      2,
      [
        Doctor('اسلام الحديدي'),
        Doctor('محمود عبد العزيز'),
      ],
    ),
    Course(
      '2 محاسبة الشركات ',
      8,
      2,
      [
        Doctor('محمود عزمي'),
        Doctor('اشرف الصباحي'),
      ],
    ),
    Course(
      'ادارة الافراد',
      9,
      2,
      [
        Doctor('اسلام الحديدي '),
      ],
    ),
    Course(
      'مبادئ الاحصاء',
      10,
      2,
      [
        Doctor('هيثم بركات'),
      ],
    ),
    Course(
      'النقود والبنوك 2',
      11,
      2,
      [
        Doctor('عمرو الجبالي'),
        Doctor('احمد موسى'),
      ],
    ),
    Course(
      'الحاسب الآلي',
      12,
      2,
      [
        Doctor('محمود هلال'),
      ],
    ),
    Course(
      'القانون التجاري',
      13,
      2,
      [
        Doctor('حسام الطوخي'),
        Doctor('حاتم الشهاوي'),
      ],
    ),
    // level 3
    Course(
      'تنمية وتخطيط اقتصادي',
      14,
      3,
      [
        Doctor('عمرو الجبالي'),
        Doctor('احمد موسى'),
      ],
    ),
    Course(
      'اصول التكاليف 2',
      15,
      3,
      [
        Doctor('اشرف الصباحي'),
        Doctor('محمد عبد الحميد'),
      ],
    ),
    Course(
      'ادارة منشات مالية',
      16,
      3,
      [
        Doctor('اسلام الحديدي'),
      ],
    ),
    Course(
      'محاسبة حكومية 2',
      17,
      3,
      [
        Doctor('محمود عزمي'),
      ],
    ),
    Course(
      'التامين ورياضته',
      18,
      3,
      [
        Doctor('هيثم بركات'),
      ],
    ),
    Course(
      'اصول التكاليف 2',
      19,
      3,
      [
        Doctor('محمود هلال'),
        Doctor('شادي منصور'),
        Doctor('مها الذكي'),
      ],
    ),
    // level 4
    Course(
      'محاسبة ادارية',
      20,
      4,
      [
        Doctor('محمود عزمي'),
      ],
    ),
    Course(
      'ضريبة وزكاة 2',
      21,
      4,
      [
        Doctor('عبد السميع عنان'),
      ],
    ),
    Course(
      'نظم محاسبية',
      23,
      4,
      [
        Doctor('محمد جمال بسيوني'),
      ],
    ),
    Course(
      'قضايا اقتصادية',
      24,
      4,
      [
        Doctor('احمد موسى'),
        Doctor('شريف حجازي'),
      ],
    ),
    Course(
      'نظم التكاليف 2',
      25,
      4,
      [
        Doctor('اشرف الصباحي'),
        Doctor('شيماء حافظ'),
      ],
    ),
    Course(
      'استراتيجات اعمال',
      26,
      4,
      [
        Doctor('اسامة بيومي'),
        Doctor('احمد خشبة'),
      ],
    ),
    Course(
      'محاسبة ادارية',
      27,
      4,
      [
        Doctor('محمود عزمي'),
      ],
    ),
    Course(
      'ادارة الاعلان',
      28,
      4,
      [
        Doctor('اسامة البيومي'),
        Doctor('احمد خشبة'),
      ],
    ),
    Course(
      'قضايا اقتصادية معاصرة',
      29,
      4,
      [
        Doctor('احمد موسى'),
        Doctor('شريف حجازي'),
      ],
    ),
    Course(
      'نظرية التنظيم',
      30,
      4,
      [
        Doctor('احمد خشبة'),
        Doctor('اسامة البيومي'),
      ],
    ),
  ];
  static List<Course>? getCourseById(int id) {
    final founded = details.where((element) {
      return element.levelNumber == id;
    }).toList();
    return founded;
  }

  static List<Course> getCourses() {
    return [
      // level 1
      Course(
        'اصول الاقتصاد2 ',
        1,
        1,
        [
          Doctor('عمرو الجبالي'),
          Doctor('احمد موسى'),
        ],
      ),
      Course(
        'نطوير اقتصادي',
        2,
        1,
        [
          Doctor('عمرو الجبالي'),
          Doctor('احمد موسى'),
        ],
      ),
      Course(
        'السلوك التنظيمي',
        3,
        1,
        [
          Doctor('اسلام الحديدي '),
        ],
      ),
      Course(
        'الادارة العامة',
        4,
        1,
        [
          Doctor('اسلام الحديدي '),
        ],
      ),
      Course(
        'اصول المحاسبة 2',
        5,
        1,
        [
          Doctor('محمود عزمي'),
          Doctor('اشرف الصباحي'),
        ],
      ),
      Course(
        'مدخل القانون',
        6,
        1,
        [
          Doctor('حسام الطوخي'),
          Doctor('حاتم الشهاوي'),
        ],
      ),
      // level 2
      Course(
        'ادارة الانتاج',
        7,
        2,
        [
          Doctor('اسلام الحديدي'),
          Doctor('محمود عبد العزيز'),
        ],
      ),
      Course(
        '2محاسبة الشركات 2',
        8,
        2,
        [
          Doctor('محمود عزمي'),
          Doctor('اشرف الصباحي'),
        ],
      ),
      Course(
        'ادارة الافراد',
        9,
        2,
        [
          Doctor('اسلام الحديدي '),
        ],
      ),
      Course(
        'مبادئ الاحصاء',
        10,
        2,
        [
          Doctor('هيثم بركات'),
        ],
      ),
      Course(
        'النقود والبنوك 2',
        11,
        2,
        [
          Doctor('عمرو الجبالي'),
          Doctor('احمد موسى'),
        ],
      ),
      Course(
        'الحاسب الآلي',
        12,
        2,
        [
          Doctor('محمود هلال'),
        ],
      ),
      Course(
        'القانون التجاري',
        13,
        2,
        [
          Doctor('حسام الطوخي'),
          Doctor('حاتم الشهاوي'),
        ],
      ),
      Course(
        'تنمية وتخطيط اقتصادي',
        14,
        3,
        [
          Doctor('عمرو الجبالي'),
          Doctor('احمد موسى'),
        ],
      ),
      Course(
        'اصول التكاليف 2',
        15,
        3,
        [
          Doctor('اشرف الصباحي'),
          Doctor('محمد عبد الحميد'),
        ],
      ),
      Course(
        'ادارة منشات مالية',
        16,
        3,
        [
          Doctor('اسلام الحديدي'),
        ],
      ),
      Course(
        'محاسبة حكومية 2',
        17,
        3,
        [
          Doctor('محمود عزمي'),
        ],
      ),
      Course(
        'االتامين ورياضته',
        18,
        3,
        [
          Doctor('هيثم بركات'),
        ],
      ),
      Course(
        'اصول التكاليف 2',
        19,
        3,
        [
          Doctor('محمود هلال'),
          Doctor('شادي منصور'),
          Doctor('مها الذكي'),
        ],
      ),
      Course(
        'محاسبة ادارية',
        20,
        4,
        [
          Doctor('محمود عزمي'),
        ],
      ),
      Course(
        'ضريبة وزكاة 2',
        21,
        4,
        [
          Doctor('عبد السميع عنان'),
        ],
      ),
      Course(
        'نظم محاسبية',
        23,
        4,
        [
          Doctor('محمد جمال بسيوني'),
        ],
      ),
      Course(
        'قضايا اقتصادية',
        24,
        4,
        [
          Doctor('احمد موسى'),
          Doctor('شريف حجازي'),
        ],
      ),
      Course(
        'نظم التكاليف 2',
        25,
        4,
        [
          Doctor('اشرف الصباحي'),
          Doctor('شيماء حافظ'),
        ],
      ),
      Course(
        'استراتيجات اعمال',
        26,
        4,
        [
          Doctor('اسامة بيومي'),
          Doctor('احمد خشبة'),
        ],
      ),
      Course(
        'محاسبة ادارية',
        27,
        4,
        [
          Doctor('محمود عزمي'),
        ],
      ),
      Course(
        'ادارة الاعلان',
        28,
        4,
        [
          Doctor('اسامة البيومي'),
          Doctor('احمد خشبة'),
        ],
      ),
      Course(
        'قضايا اقتصادية معاصرة',
        29,
        4,
        [
          Doctor('احمد موسى'),
          Doctor('شريف حجازي'),
        ],
      ),
      Course(
        'نظرية التنظيم',
        30,
        4,
        [
          Doctor('احمد خشبة'),
          Doctor('اسامة البيومي'),
        ],
      ),
    ];
  }
}
