import 'package:flutter/material.dart';
import 'food_detail.dart';

class Food {
  String name;
  String imageUrl;
  int servings;
  List<Ingredient> ingredients;

  Food(
    this.name,
    this.imageUrl,
    this.servings,
    this.ingredients,
  );

  static List<Food> samples = [
    Food(
      'Rawon',
      'assets/rawon.jpeg',
      4,
      [
        Ingredient(500, 'gram', 'daging sapi'),
        Ingredient(3, 'buah', 'kluwek'),
        Ingredient(2, 'batang', 'sereh'),
        Ingredient(5, 'lembar', 'daun jeruk purut'),
      ],
    ),
    Food(
      'Rujak Cingur',
      'assets/rujak_cingur.jpeg',
      5,
      [
        Ingredient(1, 'buah', 'cingur sapi'),
        Ingredient(1, 'buah', 'mangga muda'),
        Ingredient(1, 'buah', 'mentimun'),
        Ingredient(100, 'gram', 'tauge'),
      ],
    ),
    Food(
      'Lontong Balap',
      'assets/lontong_balap.jpeg',
      3,
      [
        Ingredient(1, 'porsi', 'lontong'),
        Ingredient(1, 'porsi', 'tauge'),
        Ingredient(1, 'porsi', 'tahu goreng'),
        Ingredient(1, 'porsi', 'lentho goreng'),
      ],
    ),
    Food(
      'Soto Ayam',
      'assets/soto.jpeg',
      6,
      [
        Ingredient(1, 'ekor', 'ayam'),
        Ingredient(2, 'batang', 'sereh'),
        Ingredient(3, 'lembar', 'daun jeruk purut'),
        Ingredient(3, 'siung', 'bawang putih'),
        Ingredient(2, 'buah', 'tomat'),
        Ingredient(1, 'butir', 'telur'),
        Ingredient(2, 'sendok makan', 'bawang goreng'),
        Ingredient(2, 'sendok teh', 'seledri'),
      ],
    ),
    Food(
      'Tahu Tek',
      'assets/tahu_tek.jpeg',
      3,
      [
        Ingredient(2, 'buah', 'tahu goreng'),
        Ingredient(100, 'gram', 'tauge'),
        Ingredient(2, 'buah', 'mentimun'),
        Ingredient(2, 'sendok makan', 'saus kacang'),
      ],
    ),
    Food(
      'Pecel Madiun',
      'assets/pecel.jpeg',
      4,
      [
        Ingredient(1, 'ikat', 'kangkung'),
        Ingredient(1, 'ikat', 'genjer'),
        Ingredient(1, 'ikat', 'kol'),
        Ingredient(2, 'sendok makan', 'saus kacang'),
      ],
    ),
    Food(
      'Sate Madura',
      'assets/sate.jpeg',
      6,
      [
        Ingredient(500, 'gram', 'daging ayam'),
        Ingredient(2, 'sendok makan', 'kecap manis'),
        Ingredient(1, 'sendok makan', 'air asam jawa'),
        Ingredient(1, 'sendok teh', 'ketumbar'),
      ],
    ),
    Food(
      'Bakso Malang',
      'assets/bakso.jpeg',
      4,
      [
        Ingredient(250, 'gram', 'bakso sapi'),
        Ingredient(1, 'porsi', 'bihun'),
        Ingredient(2, 'sendok makan', 'bawang goreng'),
        Ingredient(2, 'batang', 'daun seledri'),
      ],
    ),
    Food(
      'Kupang',
      'assets/kupang.jpeg',
      3,
      [
        Ingredient(200, 'gram', 'kupang segar'),
        Ingredient(1, 'batang', 'serai'),
        Ingredient(3, 'lembar', 'daun jeruk purut'),
        Ingredient(2, 'buah', 'cabai merah besar'),
      ],
    ),
    Food(
      'Tahu Campur',
      'assets/tahu_campur.jpeg',
      4,
      [
        Ingredient(2, 'buah', 'tahu goreng'),
        Ingredient(1, 'ikat', 'tauge'),
        Ingredient(1, 'buah', 'mentimun'),
        Ingredient(2, 'sendok makan', 'bumbu kacang'),
      ],
    ),
     Food(
        'Bubur Sumsum',
        'assets/bubur.jpeg',
        5,
        [
            Ingredient(200, 'gram', 'tepung beras'),
            Ingredient(150, 'gram', 'gula pasir'),
            Ingredient(800, 'ml', 'santan dari 1 butir kelapa'),
            Ingredient(1/2, 'sendok buah', 'Garam'),
        ],
    ),
    Food(
        'Klepon',
        'assets/klepon.jpeg',
        4,
        [
            Ingredient(200, 'gram', 'tepung ketan'),
            Ingredient(100, 'gram', 'gula merah'),
        ],
    ),
  ];
}

class Ingredient {
  double quantity;
  String measure;
  String name;

  Ingredient(
    this.quantity,
    this.measure,
    this.name,
  );
}

class FoodList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Food.samples.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return FoodDetail(food: Food.samples[index]);
                },
              ),
            );
          },
          child: buildFoodCard(Food.samples[index]),
        );
      },
    );
  }

  Widget buildFoodCard(Food food) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              food.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              food.name,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}