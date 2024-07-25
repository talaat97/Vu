import 'package:flutter/material.dart';
import 'package:vue_v4/screens/units&beds/beds.dart';
import '../../services/theme_services.dart';
import '../../widgets/main_drawer.dart';

class UnitsSceen extends StatefulWidget {
  const UnitsSceen({super.key});

  @override
  State<UnitsSceen> createState() => _UnitsSceenState();
}

class _UnitsSceenState extends State<UnitsSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       drawer: const MainDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Units',
          style: headingStyle,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
             ListTile(
              leading: CircleAvatar(
                child: Image.asset('assets/DocorInChooseRole.png'),
              ),
              title: Text('wessam mahmoud',style: headingStyle,),
              subtitle: Text('Cardiologist',style: subtitleStyle,),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                children: List.generate(7, (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const BedsScreen(),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.white,
                      child: GridTile(
                        header: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              String.fromCharCode(
                                  65 + index), // A, B, C, D, E, F
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: ThemeManager.deepBlue,
                              ),
                            ),
                          ),
                        ),
                        child: Image.asset(
                          'assets/unit2.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
