

void main() {
  var grades = {
    'Буденокв': {'Математика': 5, 'Физика': 4, 'Программирование': 5, 'История': 5},
    'Ващенко': {'Математика': 3, 'Физика': 3, 'Программирование': 4, 'История': 2},
    'Братухин': {'Математика': 4, 'Физика': 5, 'Программирование': 4, 'История': 4},
    'Позняк': {'Математика': 2, 'Физика': 2, 'Программирование': 3, 'История': 3},
    'Матисов': {'Математика': 5, 'Физика': 5, 'Программирование': 5, 'История': 5},
  };

  print('\n1. КАТЕГОРИИ СТУДЕНТОВ:');
  
  List<String> otlichniki = [];
  List<String> horoshisti = [];
  List<String> ostalnie = [];

  for (var student in grades.keys) {
    var ocenki = grades[student]!.values;
    var summa = 0;
    for (var ocenka in ocenki) {
      summa += ocenka;
    }
    var sredniy = summa / ocenki.length;
    
    if (sredniy >= 4.5) {
      otlichniki.add(student);
    } else if (sredniy >= 3.5) {
      horoshisti.add(student);
    } else {
      ostalnie.add(student);
    }
  }

  print('Отличники: $otlichniki');
  print('Хорошисты: $horoshisti');
  print('Остальные: $ostalnie');

  print('\n2. СТАТИСТИКА ОЦЕНОК:');
  
  var count2 = 0, count3 = 0, count4 = 0, count5 = 0;
  
  for (var student in grades.values) {
    for (var ocenka in student.values) {
      if (ocenka == 2) count2++;
      if (ocenka == 3) count3++;
      if (ocenka == 4) count4++;
      if (ocenka == 5) count5++;
    }
  }
  
  print('Оценок 2: $count2');
  print('Оценок 3: $count3');
  print('Оценок 4: $count4');
  print('Оценок 5: $count5');

  print('\n3. КТО ПОЛУЧИЛ 5 ПО ПРЕДМЕТАМ:');
  
  List<String> predmeti = ['Математика', 'Физика', 'Программирование', 'История'];
  
  for (var predmet in predmeti) {
    List<String> studenti = [];
    for (var student in grades.keys) {
      if (grades[student]![predmet] == 5) {
        studenti.add(student);
      }
    }
    print('$predmet: $studenti');
  }

  print('\n4. ПРЕДМЕТЫ БЕЗ ДВОЕК:');
  
  List<String> bezDvoek = [];
  
  for (var predmet in predmeti) {
    var estDvoyka = false;
    for (var student in grades.values) {
      if (student[predmet] == 2) {
        estDvoyka = true;
        break;
      }
    }
    if (!estDvoyka) {
      bezDvoek.add(predmet);
    }
  }
  
  print(bezDvoek);

  print('\n5. ГДЕ БОЛЬШЕ ВСЕГО ДВОЕК:');
  
  Map<String, int> dvoiki = {};
  for (var predmet in predmeti) {
    dvoiki[predmet] = 0;
    for (var student in grades.values) {
      if (student[predmet] == 2) {
        dvoiki[predmet] = dvoiki[predmet]! + 1;
      }
    }
  }
  
  var maxDvoek = 0;
  var predmetMax = '';
  for (var predmet in predmeti) {
    if (dvoiki[predmet]! > maxDvoek) {
      maxDvoek = dvoiki[predmet]!;
      predmetMax = predmet;
    }
  }
  
  if (maxDvoek > 0) {
    print('$predmetMax ($maxDvoek двойки)');
  } else {
    print('Двоек нет');
  }

  print('\n6. У КОГО БОЛЬШЕ ВСЕГО ПЯТЁРОК:');
  
  Map<String, int> pyaterki = {};
  var maxPyaterok = 0;
  
  for (var student in grades.keys) {
    pyaterki[student] = 0;
    for (var ocenka in grades[student]!.values) {
      if (ocenka == 5) {
        pyaterki[student] = pyaterki[student]! + 1;
      }
    }
    if (pyaterki[student]! > maxPyaterok) {
      maxPyaterok = pyaterki[student]!;
    }
  }
  
  List<String> luchshie = [];
  for (var student in grades.keys) {
    if (pyaterki[student] == maxPyaterok && maxPyaterok > 0) {
      luchshie.add('$student (${pyaterki[student]})');
    }
  }
  
  if (luchshie.isNotEmpty) {
    print(luchshie.join(', '));
  }

  print('\n7. У КОГО ЕСТЬ ОЦЕНКИ НИЖЕ 4:');
  
  for (var student in grades.keys) {
    List<String> plohieOcenki = [];
    for (var predmet in grades[student]!.keys) {
      if (grades[student]![predmet]! < 4) {
        plohieOcenki.add('$predmet (${grades[student]![predmet]})');
      }
    }
    
    if (plohieOcenki.isEmpty) {
      print('$student: нет плохих оценок');
    } else {
      print('$student (${plohieOcenki.length}): ${plohieOcenki.join(", ")}');
    }
  }


  print('\n8. ВСЕ ПЯТЁРКИ (СТУДЕНТ - ПРЕДМЕТ):');
  
  List<String> vsePyaterki = [];
  
  for (var student in grades.keys) {
    for (var predmet in grades[student]!.keys) {
      if (grades[student]![predmet] == 5) {
        vsePyaterki.add('$student - $predmet');
      }
    }
  }
  
  if (vsePyaterki.isEmpty) {
    print('Нет пятерок');
  } else {
    for (var pyat in vsePyaterki) {
      print(pyat);
    }
  }
  

}