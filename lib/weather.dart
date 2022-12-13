class Weather {
  final double temp;
  final String description;
  final String icon;
  final String name;
  Weather(
      {this.temp = 0, this.description = '', this.icon = '', this.name = ''});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        name: json['name'] ?? '',
        description: json['weather'][0]['description'] ?? '',
        icon: json['weather'][0]['icon'] ?? '',
        temp: json['main']['temp'] ?? 0);
  }
}

/**
{
  "weather": [
    {
      "description": "moderate rain",
      "icon": "10d"
    }
  ],
  "main": {
    "temp": 298.48,
  },
  "name": "Zocca",
}                        
 */