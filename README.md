# Temperature and Humidity App

This Flutter app fetches temperature and humidity data from a Firebase Firestore database and displays the values in real-time.

## Getting Started

Follow these steps to set up and run the project:

### Prerequisites

- Install [Flutter](https://flutter.dev/docs/get-started/install) (version 2.5.0 or higher)
- Install [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/download) with Flutter and Dart plugins
- Set up a Firebase project and Firestore database with temperature and humidity data (see below for more details)

### Firebase Configuration

1. Create a new Firebase project or use an existing one at the [Firebase console](https://console.firebase.google.com/).

2. Add a web app to your project:
   - Click on the gear icon (⚙️) in the left sidebar and select "Project settings".
   - Navigate to the "Your apps" section and click on the "</>" icon to add a new web app.
   - Give your app a nickname and click "Register app".

3. Configure your app with the Firebase project settings:
   - In the "Settings" page of your app, scroll down to the "Firebase SDK snippet" section and select "Config".
   - Copy the configuration object and replace the corresponding values in the `lib/firebase_config.dart` file with your own.

### Running the App

1. Clone the repository:

```git clone https://github.com/bishwashadhikari1/humiditytemperature/```


2. Navigate to the project directory:

```cd temperature_humidity_app```

3. Install the dependencies:

```flutter pub get```

4. Run the app:

- For Android, make sure you have an Android device connected or an emulator running, and then execute:

```flutter run```

- For iOS, open the project in Xcode, set up a simulator, and then run the app.

Now you should see the temperature and humidity values displayed in the app. The app will update the values in real-time as the data changes in Firestore. 
