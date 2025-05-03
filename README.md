# Flutter-NebulaKit

A modern, Docker-ready Flutter development environment supporting Android, Web, and more. Easily get started with cross-platform Flutter development using Docker and pre-configured scripts.

## Features
- Dockerized Flutter environment (no local Flutter install required)
- Android SDK and build tools included
- Ready for Android, Web, and other Flutter platforms
- Example project included in `example/`

## Quick Start

### 1. Clone the Repository
```sh
git clone https://github.com/yourusername/Flutter-NebulaKit.git
cd Flutter-NebulaKit
```

### 2. Build and Start the Docker Container
```sh
docker-compose up --build
```
This will build the Docker image and start a container with all tools pre-installed.

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
flutter run -d android-emulator
```

## Project Structure
- `Dockerfile` – Docker image for Flutter + Android SDK
- `docker-compose.yml` – Compose file for easy startup
- `example/` – Example Flutter app
- `src/` – Place your own source code here

## Developing for Android
- Connect your Android device or use an emulator
- Expose ADB port (`5037`) as configured in `docker-compose.yml`
- Run `flutter devices` to list available devices

## Developing for Web
- Expose port `8000` for web preview
- Run `flutter run -d web-server --web-port 8000`

## Caching
- Flutter pub cache is persisted in the `flutter-cache` Docker volume for faster builds

## Requirements
- Docker & Docker Compose
- (Optional) Android device or emulator for Android builds

## Resources
- [Flutter Documentation](https://docs.flutter.dev/)
- [Docker Documentation](https://docs.docker.com/)

---

Feel free to open issues or contribute!