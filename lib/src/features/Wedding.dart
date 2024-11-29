import 'package:assignment/src/commons/widgets/imageview.dart';
import 'package:flutter/material.dart';

class WeddingPage extends StatefulWidget {
  const WeddingPage({Key? key}) : super(key: key);

  @override
  _WeddingPageState createState() => _WeddingPageState();
}

class _WeddingPageState extends State<WeddingPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late String selectedCategory = "ALL"; // Track selected category

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Wedding',
          style: TextStyle(
            color: Colors.white,
            shadows: [
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 3.0,
                color: Colors.black,
              ),
            ],
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {},
          ),
        ],
        flexibleSpace: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              height: 250, // Image height
              child: Image.asset(
                "assets/images/Wedding.png", // Background image
                fit: BoxFit.cover,
              ),
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black38, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              child: ElevatedButton(
                onPressed: () {
                  _tabController.animateTo(0);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _tabController.index == 0 ? Colors.purple : Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                child: const Text(
                  'Bulk Food Delivery',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Tab(
              child: ElevatedButton(
                onPressed: () {
                  _tabController.animateTo(1);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _tabController.index == 1 ? Colors.purple : Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                child: const Text(
                  'Catering Service',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Category Row to filter content
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedCategory = "ALL";
                    });
                  },
                  child: Text(
                    'All (8)',
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Breakfast',
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                  'Lunch & Dinner',
                  style: const TextStyle(color: Colors.grey),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedCategory = "Snacks"; // Update selected category
                    });
                  },
                  child: Text(
                    'snack',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          // Dynamic content based on selected category
          Expanded(
            child: selectedCategory == "ALL"
                ? ListView.builder(
                    itemCount: 2, // Change item count based on selected tab
                    itemBuilder: (context, index) {
                      return MenuItemCard(
                        imagePath:
                            'assets/images/food.png', // Placeholder image
                        title: 'South Breakfast',
                        subtitle: 'Min 10 - Max 120',
                        price: '₹299',
                        categories: '12 Categories & 40 Items',
                      );
                    },
                  )
                : Center(
                    child: Text(
                        'Hello World')), // Show "Hello World" when Snacks is clicked
          ),
          // Bottom View Cart Section
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Colors.grey, width: 0.5),
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.shade200,
                  child: Text(
                    '3',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  '3 Platters',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6318AF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      const Text(
                        'View Cart    ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_upward_outlined,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuItemCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String price;
  final String categories;

  const MenuItemCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
      "3 Live Counter",
      "3 Live Counter",
      "3 Live Counter",
      "4 main",
      "4 main",
      "4 main",
      "3 Desserts",
      "3 Desserts",
      "3 Desserts",
      "3 Desserts",
      "3 Desserts",
      "3 Desserts",
      "3 Desserts",
      "3 Desserts",
      "3 Desserts",
    ];

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(
                  imagePath,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                child: Container(
                  width: 100,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xFF9765CA),
                      Color(0xFF7D3EBC),
                      Color(0xFF7D3EBC),
                      Color(0xFF6318AF)
                    ]),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  child: Center(
                    child: const Text(
                      'Popular',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  height: 1,
                  decoration: BoxDecoration(color: Colors.grey),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.person, size: 16, color: Colors.grey),
                        const SizedBox(width: 5),
                        Text(
                          subtitle,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Starts at ',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '$price ',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  categories,
                  style:
                      const TextStyle(color: Color(0xFF6318AF), fontSize: 20),
                ),
                const SizedBox(height: 10),
                // Use LayoutBuilder for responsive grid layout
                LayoutBuilder(
                  builder: (context, constraints) {
                    double width = constraints.maxWidth;
                    int crossAxisCount;

                    // Dynamically adjust the number of columns based on screen width
                    if (width >= 200) {
                      crossAxisCount = 3; // 3 columns for large screens
                    } else if (width >= 100) {
                      crossAxisCount = 2; // 2 columns for medium screens
                    } else {
                      crossAxisCount = 1; // 1 column for small screens
                    }

                    return GridView.builder(
                      shrinkWrap:
                          true, // Makes the GridView take only the required space
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0,
                          childAspectRatio:
                              200 / 40 // Adjust based on your design
                          ),
                      itemCount: imagePaths.length,
                      itemBuilder: (context, index) {
                        return Text(
                          imagePaths[index],
                          style: TextStyle(color: Colors.grey),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
