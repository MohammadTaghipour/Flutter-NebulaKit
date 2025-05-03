ARG FLUTTER_VERSION=3.29.0
FROM ghcr.io/cirruslabs/flutter:${FLUTTER_VERSION}

# Installing JDK and Android SDK
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    curl \
    unzip \
    git \
    zip \
    xz-utils \
    libglu1-mesa \
    lib32stdc++6 \
    lib32z1 \
    && apt-get clean

# Setup Android SDK
ENV ANDROID_HOME=/opt/android-sdk
ENV PATH="${PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools"

# Android SDK Configuration
ARG ANDROID_PLATFORM_VERSION=33
ARG ANDROID_BUILD_TOOLS_VERSION=33.0.2

RUN mkdir -p $ANDROID_HOME/cmdline-tools && \
    cd $ANDROID_HOME/cmdline-tools && \
    curl -o cmdline-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip && \
    unzip cmdline-tools.zip && rm cmdline-tools.zip && \
    mv cmdline-tools latest && \
    yes | sdkmanager --licenses && \
    sdkmanager "platform-tools" "platforms;android-${ANDROID_PLATFORM_VERSION}" "build-tools;${ANDROID_BUILD_TOOLS_VERSION}"

WORKDIR /app

CMD [ "bash" ]
