import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/TS.png",
              width: 400,
            ),
            const SizedBox(height: 20),
            const Text(
              "Time-Shaker S.A.V",
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Rapport d'intervention",
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(padding: EdgeInsets.all(16)),
       
          ],
        ),
      );
  }
}
