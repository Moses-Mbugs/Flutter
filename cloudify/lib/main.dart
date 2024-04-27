import 'package:flutter/material.dart';

void main() {
  runApp(CloudifyApp());
}

class CloudifyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cloudify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CloudifyHomePage(),
    );
  }
}

class CloudifyHomePage extends StatefulWidget {
  @override
  _CloudifyHomePageState createState() => _CloudifyHomePageState();
}

class _CloudifyHomePageState extends State
{
  // Define variables to store user inputs
  double powerCost = 0.0;
  double maintainaceCost = 0.0;
  double equipmentCost = 0.0;
  double salary = 0.0;
  double softwareLicense = 0.0;
  double updates = 0.0;
  double train = 0.0;

  String migrationResult = '';

  void calculateMigration() {
    
    double onPremisesCost = powerCost + maintainaceCost + salary + updates + equipmentCost + softwareLicense + train;

    // For simplicity, let's assume a fixed monthly cost for cloud infrastructure
    double cloudCost = 1000; // Adjust this value as needed

    // Compare total costs
    if (cloudCost < onPremisesCost) {
      setState(() {
        migrationResult = 'Migration is feasible!';
      });
    } else {
      setState(() {
        migrationResult = 'Migration is not feasible!';
      });
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cloudify'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Enter cost details: \n ',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Disclaimer this does not depict real time cost as ther are difeerent comapnies with different cost.\n this is to show you that cloud might be cheaper depending on your task',
              style: TextStyle(fontSize: 13.0),
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(labelText: 'Power cost'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  powerCost = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Monthly maintenance cost of equipment'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  maintainaceCost = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Salaries of the IT technicians'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  salary = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Cost of updates and security patches'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  updates = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Equipment cost'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  equipmentCost = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Software Licenses'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  softwareLicense = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Training personnel'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  train = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: calculateMigration,
              child: Text('Calculate Migration'),
            ),

            SizedBox(height: 20.0),
            Text(
              'Migration Result:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(migrationResult),
          ],
        ),
      ),
    );
  }
}
