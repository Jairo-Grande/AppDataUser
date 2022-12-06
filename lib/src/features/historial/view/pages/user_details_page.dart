import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                child: Column(
              children: const [
                CircleAvatar(
                  radius: 35,
                ),
                Text("Jairo Grande",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                Text("Joined jul. 2022"),
                SizedBox(
                  height: 30,
                )
              ],
            )),
            const Divider(),
            SizedBox(
              child: Column(children: [
                IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      print("Edit Button");
                    }),
                const SingleChildScrollView(
                    child: Text(
                        "Profiles with personal info and coonnected Social media appear more trustworthy",
                        textAlign: TextAlign.center)),
                TextButton(onPressed: () {}, child: const Text("Read More."))
              ]),
            ),
            const Divider(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("VERIFIED INFO",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                              fontSize: 12)),
                    ),
                    SizedBox()
                  ],
                ),
                const SizedBox(height: 50),
                const Text("No reviews yet"),
                const SizedBox(height: 50),
                const Divider(),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        onPressed: () {},
        child: const Icon(Icons.edit),
      ),
    );
  }
}
