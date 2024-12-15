import 'package:flutter/material.dart';
import 'package:intro_to_rest_api_2/models/food_model.dart';
import 'package:intro_to_rest_api_2/services/food_services.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: FloatingActionButton(
                  backgroundColor: Colors.red,
                  child: const Text('Delete'),
                  onPressed: () {
                    setState(() {
                      deleteOneFood();
                    });
                  }),
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  updateOneFoodName(
                      newFood: FoodModel(
                          id: '-99',
                          name: 'Burger Update',
                          about: 'nothing ',
                          price: '666666',
                          image: 'none'));
                });
              },
              child: const Text('Update'),
            ),
            FloatingActionButton(
                child: const Text('Create'),
                onPressed: () {
                  setState(() {
                    creatOneFood(
                        newFood: FoodModel(
                            id: '-6',
                            name: 'Burger',
                            about: 'Yummy',
                            price: '50',
                            image:
                                'https://www.foodiesfeed.com/wp-content/uploads/2023/06/burger-with-melted-cheese.jpg'));
                  });
                }),
          ],
        ),
      ),
      body: FutureBuilder(
        future: getAllFoods(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<FoodModel> foods = snapshot.data!;
            return GridView.builder(
                itemCount: foods.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: const Alignment(0.8, -0.8),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    foods[index].image,
                                  ))),
                          width: 200,
                          height: 100,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.orange),
                            child: Text(
                              foods[index].price,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(foods[index].name),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(foods[index].about),
                        )
                      ],
                    ),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
