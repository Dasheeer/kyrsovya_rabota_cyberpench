// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:app/module/date_base.dart';
int selectIndex = -1;

class Forums {
  int id;
  String name;
  String discription1;
  String discription2;
  String discription3;
  String discription4;
  String discription5;
  List<String> forumPhoto;

  Forums(this.id,  this.name, this.discription1,  this.discription2,  this.discription3,  this.discription4,  this.discription5,
      this.forumPhoto);
}

List<Forums> catalofFO = [
  Forums( 1,
    "Что такое кибербезопасность?",
    "Что такое кибербезопасность?",
    "✅Развитие цифровых технологий привело к появлению большого количества цифровых угроз в интернете. ",
            "Например, кража персональных данных пользователей или атаки хакеров на информационные системы компании с целью вывести их из строя. ",
            "В ответ на угрозы появилась область знаний, которая занимается разработкой и внедрением технологий защиты информационных систем от них, — кибербезопасность. Специалисты по кибербезопасности изучают преступления и угрозы в цифровой среде и разрабатывают способы противостоять им. "
                ,"Например, ищут уязвимости в корпоративных системах и совершенствуют протоколы шифрования персональных данных пользователей.",
    [
      "lib/assets/image/лого/кибербезбез.png"
    ],
  ),
  Forums( 2,
    "Цели кибербезопасности",
    "Обеспечить безопасность сетей, устройств и ПО!",
        "✅К объектам защиты от киберугроз в глобальных сетях относятся, например, программное обеспечение и базы данных компаний, сайты и приложения, смартфоны, компьютеры, IoT-устройства вроде «умных часов» и ПО для управления ими. ",
            "Взломав их, злоумышленники могут вывести системы из строя или украсть данные.",
     "Защитить информацию!",
        "✅Данные при хранении и передаче в интернете должны быть защищены от несанкционированного доступа. Например, данные, которые пользователь вводит при регистрации на сайте, не должны стать доступны киберпреступникам. Любые изменения данных должны быть санкционированы их владельцем.",
    [
      "lib/assets/image/лого/цели111.png"
    ],
  ),
  Forums( 3,
    "Виды угроз",
    "Угрозы кибербезопасности — это действия злоумышленников, которые они совершают с помощью интернета и программных средств.",
        " Перечислим основные виды:",
        "❌ Вредоносное ПО: Программы, которые могут вывести из строя систему пользователя, повредить или украсть данные. Киберпреступники создают ПО и распространяют в виде файлов.",
        "❌ Фишинг: Пользователь получает электронное письмо от интернет-магазина. Переходит по ссылке из письма на сайт, оформляет заказ и вводит данные карты. Данные карты получают злоумышленники, потому что сайт ненастоящий, скопирован с реального.",
        "❌ «Отказ в обслуживании»: К этому относятся DoS и DDoS-атаки. Преступники отправляют много запросов к системе. Если количество запросов превысит её пропускную способность, она перестанет работать.",
    [
      "lib/assets/image/лого/угрозы111.png",
    ],
  ),
  Forums( 4,
"Как действует вредоносное ПО?",
"Вирусы проникают в системы устройств и распространяются по ним, копируя свой программный код."
    ,"Они потребляют ресурсы системы и нарушают её целостность, что приводит к ошибкам (удаление файлов, нарушение хранения данных). Вирусы могут использовать систему для DDos-атак или майнинга — создания структур, которые обеспечивают работу криптовалютных платформ.",
"●	Троянцы, или троянские программы, собирают данные или повреждают их.",
"●	Шпионские программы отслеживают действия пользователя, чтобы использовать эти данные в своих целях. Например, перехватив данные карты и пароли от аккаунтов, преступники могут украсть деньги со счетов.",
"●	Программы-вымогатели зашифровывают данные на устройстве пользователя, а преступники требуют выкуп за их расшифровку. ",
[    "lib/assets/image/лого/по111.png",
],
),
  Forums( 5,

    "Как защититься от кибератак?",
    "Пользователи могут защитить свои персональные данные от киберугроз в сети интернет, если будут соблюдать правила кибербезопасности. ",
        "Перечислим основные:",
        "●	Использовать разные и сложные пароли для аккаунтов и устройств. Сложными считаются пароли, которые состоят из букв, цифр и знаков препинания. Их тяжело угадать, а подбирать — долго."
        ,
        "●	Включить двухфакторную аутентификацию для доступа к аккаунтам. ",
    "●	Использовать лицензионные антивирусные программы и регулярно запускать сканироваие устройства.",
    [    "lib/assets/image/лого/защита111.png",
      ],
  ),
  Forums( 6,
    "Ошибки?",
    "Системы могут подвергаться киберугрозам не только из-за внутренних уязвимостей, но и из-за человеческих ошибок. "
        ,"Например, если сотрудник компании подключится к корпоративному ПО через общедоступную Wi-Fi сеть, его логин и пароль могут перехватить злоумышленники. "
        ,"Или если он зайдёт в личную почту с рабочего компьютера и перейдёт по подозрительной ссылке в письме, то подвергнет систему угрозе вирусной атаки. "
        ,"Чтобы снизить риски нарушений кибербезопасности со стороны сотрудников, нужно обучать их её основам: "
        ,"рассказывать о возможных угрозах, последствиях и способах их избежать.",
    [
      "lib/assets/image/лого/ошибки111.png",
    ],
  ),
  Forums( 7,
    "Чем занимаются наши специалисты?",
    "●Разработкой и тестированием IT-продуктов: наш специалист анализирует возможные риски и собирает требования для разработчиков — что нужно предусмотреть в продукте, чтобы он был безопасным.",
       "●Построением архитектуры данных: архитектура данных — это система хранения, сбора и использования данных в компании. Специалист по кибербезопасности следит, чтобы она отвечала принципам конфиденциальности, целостности и доступности.",
        "●Управлением рисками: наш специалист по кибербезопасности анализирует и оценивает потенциальные риски — ситуации, которые могут возникнуть и привести к негативным последствиям. "
            ,"Разрабатывает меры их предотвращения и реагирования, если риски всё-таки наступили. "
            ,"",
    [
      "lib/assets/image/лого/специалисты111.png",

    ],
  ),
];



