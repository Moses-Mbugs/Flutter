import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp()); // Start the application with MyApp widget
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App', // Title displayed on the app bar
      theme: ThemeData(
        primarySwatch: Colors.blue, // Sets the primary color theme
      ),
      home: WeatherPage(), // Sets the WeatherPage as the initial screen
    );
  }
}

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // Text editing controller for user input
  final TextEditingController _locationController = TextEditingController();
  // String to store fetched weather data
  String _weatherData = '';

  Future<void> _fetchWeatherData() async {
    // API key for OpenWeatherMap (replace with your own key)
    final String apiKey = '';
    // Get location entered by the user
    final String location = _locationController.text;
    // Construct the API URL with location and API key
    final String apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$apiKey&units=metric';

    // Send a GET request to the API
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Successful response, update state with fetched data
      setState(() {
        _weatherData = response.body;
      });
    } else {
      // Error fetching data, update state with error message
      setState(() {
        _weatherData = 'Failed to fetch weather data';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'), // Title displayed on the app bar
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0), // Add padding to the content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Align widgets horizontally
          children: [
            TextField(
              controller: _locationController, // Bind text field to controller
              decoration: InputDecoration(
                labelText: 'Enter Location', // Label for the text field
              ),
            ),
            SizedBox(height: 16.0), // Add spacing between widgets
            ElevatedButton(
              onPressed: _fetchWeatherData, // Call fetchWeatherData on button press
              child: Text('Get Weather'), // Text displayed on the button
            ),
            SizedBox(height: 16.0), // Add spacing between widgets
            Text(_weatherData), // Display fetched weather data or error message
          ],
        ),
      ),
    );
  }
}
