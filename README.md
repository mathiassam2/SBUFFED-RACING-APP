# SBUFFED RACING APP

SBUFFED RACING APP is a comprehensive racing application designed for official SBUFFED members. It offers a sleek interface to keep track of upcoming events, championship standings, and personalized profiles.

## Features

- **Home Page**:
    - A hub of all key information, featuring custom cards that display user-related data such as race standings and points.
    - Sections for 'Upcoming Race' and 'Standings' that provide quick navigation to detailed views.
    - Engaging UI with easily navigable sections and cards.

- **Events Page**:
    - View detailed information about upcoming and past racing events.
    - Includes event schedules, participant details, and race locations.
    - Ability to filter events by date and type.

- **Championship Page**:
    - Track the current championship standings with real-time updates.
    - Detailed leaderboard showing positions, points, and progression of racers.
    - Historical data of past championships for comparison and analysis.

- **Profile Page**:
    - Personalized user profiles showcasing individual performance.
    - View and edit user information such as profile picture, username, and bio.
    - Keep track of personal statistics and achievements across events and championships.

- **Navigation Bar**:
    - A user-friendly navigation bar with customized icons for each page.
    - Dynamic icon colors and selection indicators to enhance user interaction.

- **Responsive Design**:
    - Optimized for both Android and iOS devices, ensuring a smooth user experience across different screen sizes.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- **Operating System:** Windows, macOS, or Linux.
- **Flutter SDK:** Version 3.0 or higher.
- **Android Studio:** Latest version with Flutter and Dart plugins.
- **VS Code:** Latest version with Flutter and Dart extensions.

## Setup Flutter SDK

1. **Download Flutter SDK:**
    - Visit the [Flutter website](https://flutter.dev/docs/get-started/install) and follow the instructions to download and install the Flutter SDK for your operating system.

2. **Add Flutter to Path:**
    - Extract the Flutter SDK to your desired location.
    - Add the Flutter tool to your path:
        - **Windows:** Edit your system environment variables and add `flutter\bin` to the `Path`.
        - **macOS/Linux:** Add the following line to your `.bashrc`, `.bash_profile`, or `.zshrc` file:

          ```bash
          export PATH="$PATH:`pwd`/flutter/bin"
          ```

3. **Verify Installation:**
    - Open a terminal and run the following command to check your Flutter installation:

      ```bash
      flutter doctor
      ```

    - Follow the prompts to install any missing dependencies.

## Setting Up Your Development Environment

### Android Studio

1. **Install Android Studio:**
    - Download and install Android Studio from [here](https://developer.android.com/studio).

2. **Install Flutter and Dart Plugins:**
    - Open Android Studio.
    - Go to `File > Settings > Plugins` (or `Preferences` on macOS).
    - Search for "Flutter" and click `Install`.
    - This will also install the Dart plugin.

3. **Open the Project:**
    - Select `File > Open` and navigate to the directory containing your Flutter project.

4. **Run the Project:**
    - Connect an Android device or start an Android emulator.
    - Click the green `Run` button in the toolbar or press `Shift + F10`.

### Visual Studio Code (VS Code)

1. **Install VS Code:**
    - Download and install VS Code from [here](https://code.visualstudio.com/).

2. **Install Flutter and Dart Extensions:**
    - Open VS Code.
    - Go to `View > Extensions` or press `Ctrl + Shift + X`.
    - Search for "Flutter" and click `Install`.
    - This will also install the Dart extension.

3. **Open the Project:**
    - Select `File > Open Folder` and navigate to the directory containing your Flutter project.

4. **Run the Project:**
    - Connect an Android device or start an Android emulator.
    - Open the terminal in VS Code (`Ctrl + ``).
    - Run the following command:

      ```bash
      flutter run
      ```

## Running Tests

To run tests, use the following command:

```bash
flutter test
