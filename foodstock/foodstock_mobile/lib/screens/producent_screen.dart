import 'package:flutter/material.dart';
import 'package:foodstock_mobile/models/producent.dart';
import 'package:foodstock_mobile/services/api_service.dart';

class ProducentScreen extends StatefulWidget {
  const ProducentScreen({super.key});
  @override
  _ProducentScreenState createState() => _ProducentScreenState();
}

class _ProducentScreenState extends State<ProducentScreen> {
  late Future<List<Producent>> _producentListFuture;

  @override
  void initState() {
    super.initState();
    _producentListFuture = ApiService().getProducents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Producencts'),
      ),
      body: FutureBuilder<List<Producent>>(
        future: _producentListFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Producent> producents = snapshot.data!;
            return ListView.builder(
              itemCount: producents.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.lightBlue[50],
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          producents[index].name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed loading producents'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
