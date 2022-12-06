import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/data/models/data_user_model.dart';
import 'package:flutter_application_1/src/features/historial/view/pages/user_details_page.dart';

class CustomProfileCard extends StatelessWidget {
  final DataUser dataUser;
  const CustomProfileCard({super.key, required this.dataUser});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      elevation: 3,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UserDetails(dataUser: dataUser)),
          );
        },
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.blue[100],
                maxRadius: 35,
                child: Text(
                    "${dataUser.primerNombre.substring(0, 1).toUpperCase()}${dataUser.primerApellido.substring(0, 1).toUpperCase()}",
                    style: const TextStyle(fontSize: 25)),
              ),
            ),
            const SizedBox(width: 50),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0),
                  child: Text(
                    "${dataUser.primerNombre} ${dataUser.segundoNombre} ${dataUser.primerApellido} ",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "fecha de nacimiento: ${dataUser.fechaNacimiento}",
                ),
                Text(dataUser.direccion[0]),
              ],
            )),
            const SizedBox()
          ],
        ),
      ),
    );
  }
}
