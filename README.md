# My-Draw

My Draw is a Flutter application which includes two primary screens:

1. **Ticket Number Picker:** Select ticket numbers to participate in the draw.
2. **Ball Drawing Results:** Draw balls and check if the numbers match your ticket numbers. It's an engaging way to test your luck!

## Features

- Smooth and interactive UI for picking ticket numbers.
- Animated ball drawing and results display.
- Cross-platform compatibility on both iOS and Android devices.

## How to Run the App

Follow these steps to run the app on your local machine:

### Prerequisites

- Ensure you have Flutter installed on your machine. Follow the [Flutter installation guide](https://flutter.dev/docs/get-started/install) if you haven't set it up.
- Your Flutter SDK must support Dart version 3.6.0 or higher. Update your environment if necessary.
- Set up an emulator or physical device for iOS or Android development.

### Steps to Run

1. Clone the repository:

   ```bash
   git clone https://github.com/rayray199085/My-Draw.git
   cd my_draw
   ```

2. Install the required dependencies:

   ```bash
   flutter pub get
   ```

3. Generate necessary files (if applicable):

   ```bash
   dart run build_runner build
   ```

4. Run the app:

   ```bash
   flutter run
   ```
### Generating Test Coverage Report

You can generate a test coverage report for the project using the provided `gen_coverage_report.sh` script:

1. Make the script executable (if necessary):

   ```bash
   chmod +x gen_coverage_report.sh
   ```

2. Run the script:

   ```bash
   ./gen_coverage_report.sh
   ```

The test coverage report will be generated and saved in the specified output directory defined in the script.

### Screen Recordings

- **iOS Screen Recording:** [Link to iOS recording](https://youtube.com/shorts/AalcK6KUVuw?feature=share)
- **Android Screen Recording:** [Link to Android recording](https://youtube.com/shorts/HxQc7BWpcnw?feature=share)

## License

This project is licensed under the Apache-2.0 License. See the LICENSE file for details.

---

