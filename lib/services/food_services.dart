import 'package:dio/dio.dart';
import 'package:intro_to_rest_api_2/models/food_model.dart';

Future<List<FoodModel>> getAllFoods() async {
  Dio dio = Dio();
  List<FoodModel> foods = [];
  try {
    Response response =
        await dio.get('https://674f5d7bbb559617b26ef69a.mockapi.io/food');
    if (response.statusCode == 200) {
      for (var i = 0; i < response.data.length; i++) {
        FoodModel food = FoodModel.fromMap(response.data[i]);
        foods.add(food);
      }
      return foods;
    } else {
      return [
        FoodModel(
            price: '-4',
            name: 'Exception',
            about: 'check internet connection',
            id: '-6',
            image:
                'https://www.foodiesfeed.com/wp-content/uploads/2023/06/burger-with-melted-cheese.jpg'),
      ];
    }
  } catch (e) {
    print(e);
    return [
      FoodModel(
          price: '-4',
          name: 'Exception',
          about: 'check internet connection',
          id: '-6',
          image:
              'https://www.foodiesfeed.com/wp-content/uploads/2023/06/burger-with-melted-cheese.jpg')
    ];
  }
}

Future<bool> creatOneFood({required FoodModel newFood}) async {
  Dio dio = Dio();
  Response response = await dio.post(
      'https://674f5d7bbb559617b26ef69a.mockapi.io/food',
      data: newFood.tomap());
  if (response.statusCode == 201) {
    return true;
  } else {
    return false;
  }
}

deleteOneFood() async {
  Dio dio = Dio();
  await dio.delete('https://674f5d7bbb559617b26ef69a.mockapi.io/food/8');
}

updateOneFoodName({required FoodModel newFood}) {
  Dio dio = Dio();
  dio.put('https://674f5d7bbb559617b26ef69a.mockapi.io/food/3',
      data: newFood.toMapUpdate());
}
