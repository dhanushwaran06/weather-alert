#!/usr/bin/perl
use strict;
use warnings;
use LWP::UserAgent;
use JSON;
use Getopt::Long;

# API Key and Endpoint Configuration
my $api_key = '233c6242ed52bc1677ae39b09c73784d';
my $api_endpoint = 'http://api.openweathermap.org/data/2.5/weather';

# Variables for command-line options
my $location = 'London';  # Default location
my $alert_threshold = 0;  # Default temperature threshold
my $help;

# Parse command-line options
GetOptions(
    'location=s' => \$location,
    'alert_threshold=i' => \$alert_threshold,
    'help' => \$help
);

# Display help message
sub print_usage {
    print "Usage: weather.pl --location=<city_name> --alert_threshold=<temperature>\n";
}

if ($help) {
    print_usage();
    exit 0;
}

# Function to fetch weather data
sub get_weather {
    my ($location) = @_;

    my $url = "$api_endpoint?q=$location&appid=$api_key&units=metric";
    my $ua = LWP::UserAgent->new;
    my $response = $ua->get($url);

    if ($response->is_success) {
        return decode_json($response->decoded_content);
    } else {
        die "Failed to fetch weather data: ", $response->status_line;
    }
}

# Function to check if alert conditions are met
sub check_weather_alert {
    my ($weather_data, $alert_threshold) = @_;

    my $temp = $weather_data->{main}{temp};
    my $condition = $weather_data->{weather}[0]{description};

    print "Current temperature: $temp°C\n";
    print "Current weather condition: $condition\n";

    if ($temp < $alert_threshold) {
        print "ALERT: Temperature is below $alert_threshold°C!\n";
        send_alert($temp, $condition);
    } else {
        print "No alert triggered.\n";
    }
}

# Function to send an alert (email alert functionality can be added here)
sub send_alert {
    my ($temp, $condition) = @_;
    print "Sending alert: Weather condition is $condition, temperature is $temp°C.\n";
    # You can extend this function to send actual email alerts
}

# Fetch and check the weather data
my $weather_data = get_weather($location);
check_weather_alert($weather_data, $alert_threshold);
