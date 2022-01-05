import 'package:qldungcuthethao/helpers/sql_helper.dart';

class Data {
  int id;
  String name;
  String brand;
  String weight;
  String category;
  String description;
  String img;
  Data();

  Data.fromMap(Map map){
    id = map[idColumn];
    name = map[nameColumn];
    brand = map[brandColumn];
    weight = map[weightColumn];
    category = map[categoryColumn];
    description = map[descriptionColumn];
    img = map[imgColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      nameColumn: name,
      brandColumn: brand,
      weightColumn: weight,
      categoryColumn: category,
      descriptionColumn: description,
      imgColumn: img,
    };

    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }
  @override
  String toString(){
    return "Data(id: $id, name: $name, brand: $brand, weight: $weight, category: $category, description: $description, img: $img)";
  }
}

