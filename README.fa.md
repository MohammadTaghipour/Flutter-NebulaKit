# Flutter-NebulaKit

یک محیط توسعه مدرن و آماده برای فلاتر با پشتیبانی از داکر که از اندروید، وب و سایر پلتفرم‌ها پشتیبانی می‌کند. به راحتی می‌توانید توسعه چند پلتفرمی فلاتر را با استفاده از داکر و اسکریپت‌های پیش‌تنظیم شده شروع کنید.

## ویژگی‌ها
- محیط فلاتر داکرایز شده (نیازی به نصب فلاتر محلی نیست)
- شامل Android SDK و ابزارهای ساخت
- آماده برای اندروید، وب و سایر پلتفرم‌های فلاتر
- پروژه نمونه در پوشه `example/`

## شروع سریع

### ۱. کلون کردن مخزن
```sh
git clone https://github.com/mohammadtaghipour/Flutter-NebulaKit.git
cd Flutter-NebulaKit
```

### ۲. ساخت و راه‌اندازی کانتینر داکر
```sh
docker-compose up --build
```
این دستور تصویر داکر را می‌سازد و یک کانتینر با تمام ابزارهای پیش‌نصب شده راه‌اندازی می‌کند.

### ۳. باز کردن یک شل در کانتینر
```sh
docker exec -it flutter-dev bash
```

### ۴. اجرای دستورات فلاتر
در داخل کانتینر، می‌توانید از فلاتر به صورت معمول استفاده کنید:
```sh
flutter doctor
flutter pub get
flutter run -d web-server
flutter run -d android
```

## راه‌اندازی محیط توسعه با VSCode و .devcontainer

### ۱. پیش‌نیازها
- نصب [Visual Studio Code](https://code.visualstudio.com/)
- نصب افزونه [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) در VSCode
- نصب [Docker Desktop](https://www.docker.com/products/docker-desktop)

### ۲. باز کردن پروژه در VSCode با .devcontainer
1. VSCode را باز کنید
2. دکمه `F1` را فشار دهید تا پالت دستورات باز شود
3. عبارت `Remote-Containers: Open Folder in Container` را تایپ کنید و انتخاب نمایید
4. پوشه پروژه `Flutter-NebulaKit` را انتخاب کنید
5. صبر کنید تا VSCode محیط کانتینر را بسازد و به آن متصل شود

این فرآیند به طور خودکار:
- از فایل‌های `docker-compose.yml` اصلی و `.devcontainer/docker-compose.yml` استفاده می‌کند
- یک محیط توسعه کامل با فلاتر و Android SDK راه‌اندازی می‌کند
- پوشه پروژه را به عنوان فضای کاری در کانتینر نصب می‌کند

### ۳. استفاده از محیط توسعه
پس از اتصال، می‌توانید:
- از ترمینال VSCode برای اجرای دستورات فلاتر استفاده کنید
- از تمام ویژگی‌های VSCode مانند IntelliSense، دیباگ و غیره بهره‌مند شوید
- بدون نیاز به نصب فلاتر یا Android SDK روی سیستم خود، توسعه دهید

## ساختار پروژه
- `Dockerfile` – تصویر داکر برای فلاتر + Android SDK
- `docker-compose.yml` – فایل Compose برای راه‌اندازی آسان
- `.devcontainer/` – تنظیمات برای محیط توسعه VSCode
- `example/` – برنامه نمونه فلاتر
- `src/` – کد منبع خود را اینجا قرار دهید

## توسعه برای اندروید

### راه‌اندازی دستگاه اندروید
1. دستگاه اندروید خود را با کابل USB به کامپیوتر متصل کنید
2. مطمئن شوید که گزینه "USB debugging" در تنظیمات توسعه‌دهنده دستگاه فعال است
3. پورت ADB (`5037`) همانطور که در `docker-compose.yml` پیکربندی شده است، در دسترس باشد

### اجرای برنامه روی دستگاه اندروید
```sh
# لیست دستگاه‌های در دسترس
flutter devices

# اجرای برنامه روی دستگاه اندروید
flutter run -d android
```

### ساخت فایل APK
```sh
# ساخت فایل APK برای انتشار
flutter build apk --release

# مسیر فایل APK ساخته شده
# example/build/app/outputs/flutter-apk/app-release.apk
```

## توسعه برای وب

### راه‌اندازی سرور وب
1. مطمئن شوید که پورت `8000` برای پیش‌نمایش وب در دسترس است
2. دستور زیر را اجرا کنید:

```sh
flutter run -d web-server --web-port 8000
```

3. در مرورگر خود به آدرس `http://localhost:8000` بروید

### ساخت نسخه وب برای انتشار
```sh
# ساخت نسخه وب برای انتشار
flutter build web --release

# مسیر فایل‌های ساخته شده
# example/build/web/
```

## عیب‌یابی

### مشکلات رایج

#### عدم شناسایی دستگاه اندروید
1. مطمئن شوید که USB debugging فعال است
2. دستور `adb devices` را اجرا کنید تا ببینید آیا دستگاه شناسایی می‌شود
3. اگر دستگاه شناسایی نمی‌شود، کانتینر را با دستور زیر مجدداً راه‌اندازی کنید:
```sh
docker-compose down && docker-compose up
```

#### خطای "Gradle build failed"
1. مطمئن شوید که اتصال اینترنت برقرار است
2. دستور زیر را اجرا کنید:
```sh
cd example/android && ./gradlew clean
```
3. سپس دوباره برنامه را اجرا کنید

#### مشکلات مربوط به کش
اگر با خطاهای عجیب مواجه شدید، کش را پاک کنید:
```sh
flutter clean
flutter pub get
```

## منابع
- [مستندات فلاتر](https://docs.flutter.dev/)
- [مستندات داکر](https://docs.docker.com/)
- [راهنمای VSCode Remote Containers](https://code.visualstudio.com/docs/remote/containers)

---

لطفاً در صورت بروز مشکل یا سؤال، یک issue باز کنید یا در بهبود این پروژه مشارکت نمایید!