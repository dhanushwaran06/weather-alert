
# Weather Data Scraper and Alert System

Welcome to my **first Perl project**! 🎉 This project is designed to fetch real-time weather data from the OpenWeather API, check weather conditions (like temperature), and send alerts if certain thresholds are met. This can be easily extended to send alerts via email or SMS.

## Features
- Fetches real-time weather data for a specified city.
- Alerts when temperature is below a custom threshold.
- Configurable location and alert conditions.
- Can be extended to send alerts via email (see suggestions below).
- Logs the weather information and alerts.

## Why I Chose This Project

This is my **first project using Perl**. I wanted to create something both practical and interesting. By building a weather alert system, I explored how to interact with external APIs, work with JSON data, and implement basic alerting mechanisms.

## Requirements

### Install Perl
If you don't have Perl installed, you can follow these instructions:

1. **For Linux/MacOS**:
   Perl typically comes pre-installed. You can check by running:

   ```bash
   perl -v
   ```

   If Perl is not installed, you can install it using your package manager:
   
   ```bash
   sudo apt-get install perl    # For Ubuntu/Debian
   brew install perl            # For MacOS (using Homebrew)
   ```

2. **For Windows**:
   Download and install Perl from [Strawberry Perl](https://strawberryperl.com/).

### Install Required Perl Modules

Once Perl is installed, you will need a few Perl modules to run this project. You can install them via CPAN (Comprehensive Perl Archive Network):

```bash
cpan install LWP::UserAgent JSON Getopt::Long
```

Alternatively, if you use a `Makefile`, you can automate this installation process:

```makefile
install:
    cpan install LWP::UserAgent JSON Getopt::Long
```

## Usage

### 1. Fetch Weather Data for a Location
To get the current weather for a city, use the following command:

```bash
perl weather.pl --location="New York"
```

This will display the current temperature, weather conditions, and other details.

### 2. Set a Temperature Alert Threshold
If you want to receive an alert when the temperature drops below a certain value (e.g., 0°C), you can use the `--alert_threshold` option:

```bash
perl weather.pl --location="New York" --alert_threshold=0
```

If the temperature drops below 0°C, the script will notify you and you can extend this to send an email alert.

### 3. Help
For more usage options, run:

```bash
perl weather.pl --help
```

## Extend the Project: Adding Email Alerts

To make this project even more useful, you can extend it to send alerts via email when weather conditions trigger an alert. Here are a few **free email service providers** you can integrate with:

- **[SendGrid](https://sendgrid.com/)**: Free tier allows sending up to 100 emails per day.
- **[Mailgun](https://www.mailgun.com/)**: Offers 5,000 free emails in the first month.
- **[Postmark](https://postmarkapp.com/)**: Has a developer tier that includes 100 free emails per month.

You can use Perl modules like `Email::Sender::Simple` or `MIME::Lite` to send email alerts.

Example of sending an email:

```perl
use MIME::Lite;

sub send_alert {
    my ($temp, $condition) = @_;

    my $msg = MIME::Lite->new(
        From    => 'you@example.com',
        To      => 'recipient@example.com',
        Subject => "Weather Alert: $condition",
        Data    => "The temperature has dropped to $temp°C. Condition: $condition."
    );

    $msg->send;
    print "Alert email sent!
";
}
```

## Scheduling with Cron (Linux/MacOS)

You can use a cron job to run this Perl script at regular intervals to automatically check the weather and trigger alerts. For example, to run the script every hour:

1. Open your crontab for editing:

```bash
crontab -e
```

2. Add the following line to run the script every hour:

```bash
0 * * * * /usr/bin/perl /path/to/weather.pl --location="New York" --alert_threshold=0
```

This will run the script on the hour, every hour.

## .gitignore File
The `.gitignore` file for this project ensures that unnecessary or sensitive files are not uploaded to your Git repository. This includes backup files, temporary files, logs, and system-specific files.

## License

This project is licensed under the MIT License. Feel free to fork it, contribute, or suggest improvements!

---

I hope you find this project helpful. It's been an exciting experience diving into Perl for the first time, and I'm eager to hear your feedback and ideas for extending it further!