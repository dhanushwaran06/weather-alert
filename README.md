# Weather Data Scraper and Alert System

This Perl project fetches weather data from the OpenWeather API and checks for specific conditions (like cold weather, rain, etc.). If conditions are met, it sends an alert (extendable to email/SMS).

## Features
- Fetch real-time weather data for a specified city.
- Trigger alerts when the temperature is below a certain threshold.
- Customizable threshold for alerting.
- Easy to extend to email or SMS alerts.

## Installation

First, install the required Perl modules:

```bash
cpan install LWP::UserAgent JSON Getopt::Long
