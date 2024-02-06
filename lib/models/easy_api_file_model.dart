// class HouseNoClass {
//   String? housename;
//   String? Streetno;
//   HouseNoClass({this.Streetno, this.housename});
//   factory HouseNoClass.fromjson(Map<String, dynamic> Json) {
//     return HouseNoClass(
//       Streetno: Json['Streetno'],
//       housename: Json['housename'],
//     );
//   }
// }

class Student {
  int? age;
  String? name;
  String? Address;

  Student({
    this.age,
    this.name,
    this.Address,
  });
  factory Student.fromjson(Map<String, dynamic> parsedJson) {
    return Student(
      age: parsedJson['age'],
      Address: parsedJson['Address'],
      name: parsedJson['name'],
    );
  }
}
