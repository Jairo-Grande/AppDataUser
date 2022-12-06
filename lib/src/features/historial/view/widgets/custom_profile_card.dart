import 'package:flutter/material.dart';

class CustomProfileCard extends StatelessWidget {
  const CustomProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      elevation: 3,
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.blue[100],
                maxRadius: 35,
                child: const Text('JG', style: TextStyle(fontSize: 25)),
              ),
            ),
            SizedBox(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0),
                  child: Text("Jairo Orlando Grande Castro"),
                ),
                Text("03/05/1999"),
                Text("Calle 69 b bis sur 89-52"),
              ],
            )),
            const SizedBox()
          ],
        ),
      ),
    );
  }
}
