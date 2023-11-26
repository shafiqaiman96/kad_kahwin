# Kad Kahwin [![N|Solid](https://blog.expertsoftwareteam.com/wp-content/uploads/2019/01/flutter12.png)](https://flutter.dev/)

[Flutter] Web Kad Kahwin Project for both sides (Lelaki & Perempuan) by leveraging the free tier of Firebase as the Kad Kahwin usually is not will flood by users and a huge of bandwidth.

- State management: [GetX]
- Enviroment management: [dotenv]
- Hosting: [Firebase Hosting]
- Database: [Cloud Firestore]

In this project, two web apps and two hostings were created in a single Firebase project.

## Getting Started

1. Create a Firebase Project
2. Create two web app and register two Firebase hosting
3. Create two collections in Firestore DB (ucapan-lelaki & ucapan-perempuan)
4. Change `APP_ID` in and `env.lelaki` & `env.perempuan` based on registered web app

## Running

```sh
flutter run --dart-define=isLelaki=true
```

```sh
flutter run --dart-define=isLelaki=false
```

## Build and compile

```sh
flutter build web --dart-define=isLelaki=true
```

```sh
flutter build web --dart-define=isLelaki=false
```

## Deployment

1. Add site name in `firebase.json` with the correct target host

```
{
  "hosting": {
    "site": "kad-kahwin-iffshaff", <-- HERE [kad-kahwin-saui]
    "public": "build/web",
    "ignore": ["firebase.json", "**/.*", "**/node_modules/**"],
    "rewrites": [
      {
        "source": "**",
        "destination": "/index.html"
      }
    ]
  }
}
```

2. Deploy the compiled web based on your targeted host in `firebase.json`

```sh
firebase deploy --only hosting:[YOUR TARGET HOST]
```

[flutter]: https://flutter.dev/
[getx]: https://pub.dev/packages/get
[dotenv]: https://pub.dev/packages/dotenv
[firebase hosting]: https://firebase.google.com/docs/hosting
[cloud firestore]: https://firebase.google.com/docs/firestore
