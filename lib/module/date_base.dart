class Yslygi {
  int id;
  String name;
  double price;
  String complect;
  String compl;
  String discription;
  List<String> yslygiPhoto;


  Yslygi(this.id, this.name, this.price, this.complect, this.compl, this.discription,
      this.yslygiPhoto);
}

List<Yslygi> yslygi = [
  Yslygi(
    1,
    "Оценка уязвимостей",
    90000,
    "Цены: От 90.000 до 910.000 рублей ",
        "Цена изменяется в зависимости от размера и сложности системы.",
    "Анализ системы на наличие уязвимостей, тестирование на проникновение.",
    [
      "lib/assets/image/лого/кибербез.png",
    ]

  ),
  Yslygi(
    2,
    "Мониторинг безопасности",
      12400,
    "Цены: От 12.400 до 123.800 рублей.",
      "Цена изменяется в зависимости от объема работ",
    "Непрерывный мониторинг сетевого трафика и систем для выявления угроз.",
    [
      "lib/assets/image/лого/кибербез.png",    ]
  ),
  Yslygi(
    3,
    "Управление инцидентами",
    5000,
    "Цены: От 5.000 до 7.500 рублей.",
      "Цена изменяется в зависимости от объема работ",
    " Реакция на инциденты безопасности, расследование и восстановление.",
    [
      "lib/assets/image/лого/кибербез.png",    ]
  ),
  Yslygi(
    4,
    "Обучение сотрудников",
    1300,
    "Цены: От 1.300 до 12.300 рублей",
        "Цена изменяется за человека в зависимости от программы.",
    "Курсы по кибербезопасности для сотрудников, чтобы повысить осведомленность о рисках.",
    [
      "lib/assets/image/лого/кибербез.png",    ]
  ),
  Yslygi(
    5,
    "Консультация",
      13800,
    "Цены: От 13.800 до 27.700 рублей.",
      "Цена изменяется в зависимости от объема работ",
    "Оценка текущих мер безопасности и рекомендации по улучшению.",
    ["lib/assets/image/лого/кибербез.png",
   ]
  ),
  Yslygi(
    6,
    "Управление облаком",
      92000,
    "Цены: От 92.000 до 400.000 рублей.",
      "Цена изменяется в зависимости от объема работ",
    "Защита данных и приложений в облачных средах.",
    ["lib/assets/image/лого/кибербез.png",
      ]
  ),
  Yslygi(
    7,
    " Аудит безопасности",
      185000,
      "Цены: От 185.000 до 1.850.000 рублей.",
      "Цена изменяется в зависимости от объема работ",
    "Полный аудит существующих мер безопасности и рекомендаций по улучшению.",
    ["lib/assets/image/лого/кибербез.png",
      ]
  ),
];



