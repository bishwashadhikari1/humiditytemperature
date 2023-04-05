import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_config.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: firebaseConfig["apiKey"],
      authDomain: firebaseConfig["authDomain"],
      projectId: firebaseConfig["projectId"],
      storageBucket: firebaseConfig["storageBucket"],
      messagingSenderId: firebaseConfig["messagingSenderId"],
      appId: firebaseConfig["appId"],
    ),
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Temperature and Humidity App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TemperatureHumidityPage(),
    );
  }
}

class TemperatureHumidityPage extends StatefulWidget {
  @override
  _TemperatureHumidityPageState createState() =>
      _TemperatureHumidityPageState();
}

class _TemperatureHumidityPageState extends State<TemperatureHumidityPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature and Humidity'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: _firestore.collection('climate').doc('sensorData').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData) {
            return Center(child: Text('No data found'));
          }

          final data = snapshot.data!;
          final temperature = data['temperature'] ?? 'N/A';
          final humidity = data['humidity'] ?? 'N/A';

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Temperature: $temperature °C',
                    style: TextStyle(fontSize: 24)),
                SizedBox(height: 16),
                Text('Humidity: $humidity %', style: TextStyle(fontSize: 24)),
              ],
            ),
          );
        },
      ),
    );
  }
}
