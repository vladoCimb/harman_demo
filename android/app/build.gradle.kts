plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.harman_demo"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.harman_demo"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        // if you use multidex:
        // multiDexEnabled = true
    }

    // --- Flavors (Kotlin DSL) ---
    flavorDimensions += "default"

    productFlavors {
        create("staging") {
            dimension = "default"
            // conventionally prefix with a dot so it installs alongside prod
            applicationIdSuffix = ".stg"
            // Kotlin DSL map syntax:
            manifestPlaceholders += mapOf("appName" to "Template APP [STG]")
        }
        create("production") {
            dimension = "default"
            // no suffix for production
            manifestPlaceholders += mapOf("appName" to "Template APP")
        }
    }

    buildTypes {
        getByName("debug") {
            // optional, helps install alongside release
            applicationIdSuffix = ".debug"
            versionNameSuffix = "-debug"
        }
        getByName("release") {
            // Replace this with your real release signing config
            signingConfig = signingConfigs.getByName("debug")
            isMinifyEnabled = false
            isShrinkResources = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }

    // If you have kotlin sources under src/main/kotlin
    sourceSets["main"].java.srcDirs("src/main/kotlin")
}

flutter {
    source = "../.."
}
