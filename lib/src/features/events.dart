import 'package:assignment/src/commons/widgets/imageview.dart';
import 'package:assignment/src/features/Wedding.dart';
import 'package:flutter/material.dart';

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
      "assets/images/House Party.png",
      "assets/images/Farmhouse Party.png",
      "assets/images/Kitty Party.png",
      "assets/images/Birthday Party.png",
      "assets/images/Pooja.png",
      "assets/images/Cocktail Party.png",
      "assets/images/Office Party.png",
      "assets/images/Get together.png",
      "assets/images/House Warming.png",
      "assets/images/Haldi.png",
      "assets/images/Wedding.png",
      "assets/images/Reception.png",
      "assets/images/Engagement.png",
      "assets/images/Workshop.png"
    ];

    final Set<int> clickableIndices = {0, 4, 6, 10};

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text('Events'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width ~/ 140,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 120 / 140,
            ),
            itemCount: imagePaths.length,
            itemBuilder: (context, index) {
              if (clickableIndices.contains(index)) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WeddingPage()));
                  },
                  child: ReusableContainer(
                    height: 109,
                    width: 133.47,
                    imagePath: imagePaths[index],
                    border: true,
                  ),
                );
              } else {
                return ReusableContainer(
                  height: 109,
                  width: 133.47,
                  imagePath: imagePaths[index],
                  border: false,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
