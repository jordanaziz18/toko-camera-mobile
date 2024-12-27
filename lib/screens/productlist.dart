import 'package:flutter/material.dart';

import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:toko_camera_mobile/models/product_entry.dart';
import 'package:toko_camera_mobile/screens/detailProduct.dart';
import 'package:toko_camera_mobile/widgets/left_drawer.dart';

class ProductEntryPage extends StatefulWidget {
  const ProductEntryPage({super.key});

  @override
  State<ProductEntryPage> createState() => _ProductEntryPageState();
}

class _ProductEntryPageState extends State<ProductEntryPage> {
  Future<List<CameraEntry>> fetchCameras(CookieRequest request) async {
    // Make sure the endpoint URL matches your Django API for cameras
    final response = await request.get('http://localhost:8000/api/cameras/');

    // Decoding the response into JSON
    var data = response;

    // Convert JSON data to a list of CameraEntry objects
    List<CameraEntry> cameras = [];
    for (var d in data) {
      if (d != null) {
        cameras.add(CameraEntry.fromJson(d));
      }
    }
    return cameras;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchCameras(request),
        builder: (context, AsyncSnapshot<List<CameraEntry>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Column(
              children: [
                Text(
                  'There are no cameras available.',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                SizedBox(height: 8),
              ],
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                        product: snapshot.data![index],
                      ),
                    ),
                  );
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.blue, // Set the background color for cameras
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${snapshot.data![index].fields.name}",
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Set the text color to white
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Price: Rp${snapshot.data![index].fields.price}",
                        style: const TextStyle(
                          color: Colors.white, // Set the text color to white
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Description: ${snapshot.data![index].fields.description}",
                        style: const TextStyle(
                          color: Colors.white, // Set the text color to white
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Stock: ${snapshot.data![index].fields.stock}",
                        style: const TextStyle(
                          color: Colors.white, // Set the text color to white
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
