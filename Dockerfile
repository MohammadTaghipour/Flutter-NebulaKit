ARG FLUTTER_VERSION=3.29.0
FROM ghcr.io/cirruslabs/flutter:${FLUTTER_VERSION}

ARG ANDROID_PLATFORM_VERSION
ARG ANDROID_BUILD_TOOLS_VERSION

# Installing required tools
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    curl \
    unzip \
    git \
    zip \
    xz-utils \
    libglu1-mesa

# Installing Android SDK
RUN mkdir -p /opt/android-sdk/cmdline-tools && \
    cd /opt/android-sdk/cmdline-tools && \
    curl -o cmdline-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip && \
    unzip cmdline-tools.zip && \
    rm cmdline-tools.zip && \
    mv cmdline-tools latest

# Setting environment variables
ENV PATH="/opt/android-sdk/cmdline-tools/latest/bin:${PATH}"
ENV ANDROID_HOME="/opt/android-sdk"

# Installing Android platform and build tools
RUN yes | sdkmanager --licenses && \
    sdkmanager "platforms;android-${ANDROID_PLATFORM_VERSION}" "build-tools;${ANDROID_BUILD_TOOLS_VERSION}"

WORKDIR /app

CMD [ "bash" ]
