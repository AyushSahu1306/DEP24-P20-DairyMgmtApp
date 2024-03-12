import 'package:farm_expense_mangement_app/screens/home/animallist.dart';
import 'package:flutter/material.dart';

import '../../models/cattle.dart';
import '../../models/user.dart';

final listCattle = [
  Cattle(
    rfid: "5515154",
    sex: "female",
    age: 10,
    breed: "cow",
    weight: 120,
    state: 'Dry'/*dateOfBirth: DateTime.parse('2020-12-01')*/
  ),
  Cattle(
    rfid: '12345',
    breed: 'cow',
    state: 'Dry'/* dateOfBirth: DateTime.parse('2020-05-05')*/
  )
];

final farmUser = FarmUser(
    ownerName: "sushil",
    farmName: "sushil dairy",
    location: "chandigarh",
    phoneNo: 8053004565);

void milkRecords(BuildContext context) //TODO: [FUNCTION FOR AVG. MILK COW CARD]
{
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const AvgMilkCowPage()));
}

void cattle(BuildContext context) //TODO: [FUNCTION FOR COW CARD]
{
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const AnimalList()));
}

void feed(BuildContext context) //TODO: [FUNCTION FOR TRANSACTIONS CARD]
{
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const DryCowsPage()));
}

void transactions(BuildContext context) //TODO: [FUNCTION FOR TRANSACTIONS CARD]
{
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const AvgMilkCowPage()));
}


class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  final Color myColor = const Color(0xFF39445A);

  @override
  Widget build(BuildContext context) {
    return  PreferredSize(
      preferredSize: const Size.fromHeight(240),
      child: Container(
        color: Colors.grey[300],
        child: AppBar(
          centerTitle: true,
          flexibleSpace: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(36),
              bottomRight: Radius.circular(36),
            ),
            child: Stack(
              children: [
                Image.asset(
                  'asset/bgscreen.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.8,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        myColor.withOpacity(0.3),
                        myColor.withOpacity(0.1),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 80,
                  ),
                ),
              ],
            ),
          ),
          title: const Text(
            '',
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(240);
}

class HomePage extends StatefulWidget implements PreferredSizeWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Color totalCowsColor =
        const Color.fromRGBO(224, 191, 184, 1.0); // Green color
    Color milkingCowsColor =
        const Color.fromRGBO(252, 222, 172, 1.0); // Red color
    Color dryCowsColor = const Color.fromRGBO(88, 148, 120, 1.0); // Blue color
    Color avgMilkPerCowColor =
        const Color.fromRGBO(202, 217, 173, 1.0); // Yellow color
    return SingleChildScrollView(
      child: Container(
        height: 600,
        color: Colors.grey[300],
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[

            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: buildClickableContainer(
                    context,
                    'Cattles',
                    'asset/cattles.jpg',
                    totalCowsColor,
                        () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AnimalList()),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: buildClickableContainer(
                    context,
                    'Feed',
                    'asset/feed.jpg',
                    milkingCowsColor,
                        () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AvgMilkCowPage()),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: buildClickableContainer(
                    context,
                    'Transactions',
                    'asset/transactions.webp',
                    dryCowsColor,
                        () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DryCowsPage()),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: buildClickableContainer(
                    context,
                    'Avg Milk/Cow',
                    'asset/avg.jpg',
                    avgMilkPerCowColor,
                        () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AvgMilkCowPage()),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildClickableContainer(
      BuildContext context,
      String value,
      String imageUrl,
      Color containerColor,
      Function() onTap,
      ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.23,
        decoration: BoxDecoration(
          color: Colors.blue[200],
          border: Border.all(
            color: Colors.indigo.shade300,
            width: 3,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(32),
          ),
          boxShadow: [
            BoxShadow(
              color: containerColor.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            ClipPath(
              clipper: ArcClipper(),
              child: Container(
                color: containerColor,
                width: double.infinity,
                height: double.infinity,
                padding: const EdgeInsets.only(bottom: 40, right: 20),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: ClipOval(
                child: Image.asset(
                  imageUrl,
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.width * 0.25,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.orange[300],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                ),
                child: Text(
                  value,
                  style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, size.height * 0.8);
    path.lineTo(size.width * 0.8, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class DryCowsPage extends StatelessWidget {
  const DryCowsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dry Cows'),
      ),
      body: const Center(
        child: Text('Dry Cows Page'),
      ),
    );
  }
}

class AvgMilkCowPage extends StatelessWidget {
  const AvgMilkCowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avg Milk/Cow'),
      ),
      body: const Center(
        child: Text('Avg Milk/Cow Page'),
      ),
    );
  }
}
