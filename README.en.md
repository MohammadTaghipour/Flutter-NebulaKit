# Flutter-NebulaKit

A modern and ready-to-use Flutter development environment with Docker support that supports Android, Web, and other platforms. You can easily start multi-platform Flutter development using Docker and pre-configured scripts.

## Features
- Dockerized Flutter environment (no need to install Flutter locally)
- Includes Android SDK and build tools
- Ready for Android, Web, and other Flutter platforms
- Sample project in the `example/` folder

## Quick Start

### 1. Clone the Repository
```sh
git clone https://github.com/mohammadtaghipour/Flutter-NebulaKit.git
cd Flutter-NebulaKit
```

### 2. Build and Start the Docker Container
```sh
docker-compose up --build
```
This command builds the Docker image and starts a container with all pre-installed tools.

### 3. Open a Shell in the Container
```sh
docker exec -it flutter-dev bash
```

### 4. Run Flutter Commands
Inside the container, you can use Flutter as usual:
```sh
flutter doctor
flutter pub get
flutter run -d web-server
flutter run -d android
```

## Setting Up Development Environment with VSCode and .devcontainer

### 1. Prerequisites
- Install [Visual Studio Code](https://code.visualstudio.com/)
- Install the [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension in VSCode
- Install [Docker Desktop](https://www.docker.com/products/docker-desktop)

### 2. Open the Project in VSCode with .devcontainer
1. Open VSCode
2. Press `F1` to open the command palette
3. Type `Remote-Containers: Open Folder in Container` and select it
4. Select the `Flutter-NebulaKit` project folder
5. Wait for VSCode to build the container environment and connect to it

This process automatically:
- Uses the main `docker-compose.yml` and `.devcontainer/docker-compose.yml` files
- Sets up a complete development environment with Flutter and Android SDK
- Mounts the project folder as a workspace in the container

### 3. Using the Development Environment
After connecting, you can:
- Use the VSCode terminal to run Flutter commands
- Utilize all VSCode features like IntelliSense, debugging, etc.
- Develop without needing to install Flutter or Android SDK on your system

## Project Structure
- `Dockerfile` – Docker image for Flutter + Android SDK
- `docker-compose.yml` – Compose file for easy setup
- `.devcontainer/` – Settings for VSCode development environment
- `example/` – Sample Flutter application
- `src/` – Place your source code here

## Android Development

### Setting Up Android Device
1. Connect your Android device to your computer with a USB cable
2. Make sure the "USB debugging" option is enabled in the device's developer settings
3. The ADB port (`5037`) should be accessible as configured in `docker-compose.yml`

### Running the App on Android Device
```sh
# List available devices
flutter devices

# Run the app on Android device
flutter run -d android
```

### Building APK File
```sh
# Build APK file for release
flutter build apk --release

# Path to the built APK file
# example/build/app/outputs/flutter-apk/app-release.apk
```

## Web Development

### Setting Up Web Server
1. Make sure port `8000` is available for web preview
2. Run the following command:

```sh
flutter run -d web-server --web-port=8000 --web-hostname=0.0.0.0
```

3. In your browser, go to `http://localhost:8000`

### Building Web Version for Release
```sh
# Build web version for release
flutter build web --release

# Path to the built files
# example/build/web/
```

## Troubleshooting

### Common Issues

#### Android Device Not Detected
1. Make sure USB debugging is enabled
2. Run `adb devices` to see if the device is detected
3. If the device is not detected, restart the container with the following command:
```sh
docker-compose down && docker-compose up
```

#### "Gradle build failed" Error
1. Make sure internet connection is established
2. Run the following command:
```sh
cd example/android && ./gradlew clean
```
3. Then run the app again

#### Cache-related Issues
If you encounter strange errors, clear the cache:
```sh
flutter clean
flutter pub get
```

## Resources
- [Flutter Documentation](https://docs.flutter.dev/)
- [Docker Documentation](https://docs.docker.com/)
- [VSCode Remote Containers Guide](https://code.visualstudio.com/docs/remote/containers)

---