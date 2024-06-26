// To parse this JSON data, do
//
//     final hadesModel = hadesModelFromMap(jsonString);

class Azkar {
  Azkar({
    required this.repeat,
    required this.zkr,
    required this.bless,
  });

  int repeat;
  String zkr;
  String bless;

  factory Azkar.fromMap(Map<String, dynamic> json) => Azkar(
        repeat: json["repeat"],
        zkr: json["zekr"],
        bless: json["bless"],
      );

  Map<String, dynamic> toMap() => {
        "repeat": repeat,
        "zekr": zkr,
        "bless": bless,
      };
}
