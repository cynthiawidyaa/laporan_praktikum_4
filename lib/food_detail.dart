import 'package:flutter/material.dart';
import 'food.dart';

class FoodDetail extends StatefulWidget {
  final Food food;

  const FoodDetail({Key? key, required this.food}) : super(key: key);

  @override
  _FoodDetailState createState() {
    return _FoodDetailState();
  }
}

class _FoodDetailState extends State<FoodDetail> {
  int _sliderVal = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.food.name),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.asset(
                widget.food.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '${widget.food.name}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: widget.food.ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  final ingredient = widget.food.ingredients[index];
                  return ListTile(
                    title: Text(
                      '${ingredient.quantity * _sliderVal} ${ingredient.measure} ${ingredient.name}',
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: Text(
                      '${ingredient.quantity * _sliderVal}',
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Slider(
                min: 1,
                max: 10,
                divisions: 10,
                label: '${_sliderVal * widget.food.servings} servings',
                value: _sliderVal.toDouble(),
                onChanged: (newValue) {
                  setState(() {
                    _sliderVal = newValue.round();
                  });
                },
                activeColor: const Color.fromARGB(255, 76, 137, 175),
                inactiveColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
