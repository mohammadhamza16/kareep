import 'package:flutter/material.dart';
import 'package:adhan/adhan.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

class PrayerView extends StatefulWidget {
  const PrayerView({super.key});

  @override
  _PrayerViewState createState() => _PrayerViewState();
}

class _PrayerViewState extends State<PrayerView> {
  Map<Prayer, DateTime>? _prayerTimes;
  Location location = Location();
  LocationData? _locationData;
  bool _isLoading = true; // Track loading state

  double latitude = 30.0444; // Initial latitude for Cairo
  double longitude = 31.2357; // Initial longitude for Cairo

  @override
  void initState() {
    super.initState();
    getLoc(); // Fetch location data on startup
  }

  Future<void> calculatePrayerTimes() async {
    try {
      final coordinates = Coordinates(latitude, longitude);
      final params = CalculationMethod.egyptian.getParameters();
      params.madhab = Madhab.shafi;

      final prayerTimes = PrayerTimes.today(coordinates, params);

      setState(() {
        _prayerTimes = {
          Prayer.fajr: prayerTimes.fajr,
          Prayer.sunrise: prayerTimes.sunrise,
          Prayer.dhuhr: prayerTimes.dhuhr,
          Prayer.asr: prayerTimes.asr,
          Prayer.maghrib: prayerTimes.maghrib,
          Prayer.isha: prayerTimes.isha,
        };
        _isLoading = false; // Data loaded, stop loading indicator
      });
    } catch (e) {
      setState(() {
        _isLoading = false; // Stop loading even if there's an error
      });
    }
  }

  Future<void> getLoc() async {
    try {
      bool serviceEnabled;
      PermissionStatus permissionGranted;

      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          throw Exception('Location services are disabled.');
        }
      }

      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          throw Exception('Location permissions are denied.');
        }
      }

      _locationData = await location.getLocation();

      latitude = _locationData?.latitude ?? latitude;
      longitude = _locationData?.longitude ?? longitude;

      calculatePrayerTimes();
    } catch (e) {
      setState(() {
        _isLoading = false; // Stop loading even if there's an error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Prayer Times',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _prayerTimes == null
              ? const Center(child: Text('Unable to calculate prayer times.'))
              : PrayerList(prayerTimes: _prayerTimes!),
    );
  }
}

class PrayerList extends StatelessWidget {
  final Map<Prayer, DateTime> prayerTimes;

  const PrayerList({super.key, required this.prayerTimes});

  @override
  Widget build(BuildContext context) {
    final prayers = {
      'Fajr': prayerTimes[Prayer.fajr]!,
      'Sunrise': prayerTimes[Prayer.sunrise]!,
      'Dhuhr': prayerTimes[Prayer.dhuhr]!,
      'Asr': prayerTimes[Prayer.asr]!,
      'Maghrib': prayerTimes[Prayer.maghrib]!,
      'Isha': prayerTimes[Prayer.isha]!,
    };

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: prayers.entries.map((entry) {
          return Column(
            children: [
              PrayerType(
                title: entry.key,
                prayer: entry.value,
              ),
              const Divider(
                color: Colors.black,
                thickness: 1,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class PrayerType extends StatelessWidget {
  final String title;
  final DateTime prayer;

  const PrayerType({
    super.key,
    required this.title,
    required this.prayer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            DateFormat.jm().format(prayer),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
