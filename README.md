<!-- <p align="center">
  <a href="" rel="noopener">
 <img width=200px height=200px src="https://i.imgur.com/6wj0hh6.jpg" alt="Project logo"></a>
</p> -->

<h1 align="center" style="font-family: Comic Sans MS">YnE</h1>

<div align="center">

</div>

---

<p align="center" style="font-family: Comic Sans MS"> Youthful activity, elderly pace
    <br> 
</p>

<p align="center">
  <a href="https://www.youtube.com/watch?v=b9lXTUMW3UI">
    <img src="https://res.cloudinary.com/marcomontalbano/image/upload/v1702538755/video_to_markdown/images/youtube--b9lXTUMW3UI-c05b58ac6eb4c4700831b2b3070cd403.jpg" alt="YnE Introduction">
  </a>
</p>

<br/>

## 📝 Table of Contents

- [📝 Table of Contents](#-table-of-contents)
- [🧐 About ](#-about-)
- [🏰 Software Architecture ](#-software-architecture-)
- [🏁 Getting Started ](#-getting-started-)
- [🔔 Features ](#-features-)
- [✨ Release ](#-release-)
  - [Android](#android)
- [🎉 Acknowledgements ](#-acknowledgements-)
  
<br/>

## 🧐 About <a name = "about"></a>

This is an front-end using **Flutter** for YnE APP (Youth and Elderly).

It is a mobile application that show the youth activities for the elderly.

<br/>

## 🏰 Software Architecture <a name = "software-architecture"></a>
The project is based on **Riverpod-based architecture**. 

Each feature is separated into its own folder. For each feature, there are four folders: **presentation**, **application**, **domain**, and **data**, which are responsible for the presentation layer, application layer, domain layer, and data layer, respectively.

> The following is a brief description of each layer:
> - **Presentation layer**: 
>   - user interface
>   - user interface logic for user interaction
>   - reactive state management
> - **Application layer**: 
>   - business logic
>   - provide FutureProvider to Presentation Layer for calling the use case
> - **Domain layer**: 
>   - define the objects that are used in the application
> - **Data layer**: 
>   - data access from backend
>   - implement strategy pattern to switch between different data sources and test data
>   - provide StreamProvider to Presentation Layer for reactive state management

<img src="https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/images/flutter-app-architecture.webp"  width="400" height="800">

<br/>

## 🏁 Getting Started <a name = "getting_started"></a>

Run the app on your local machine with fake or real data.
```
flutter run --dart-define=USE_FAKE_REPOSITORY={true|false}
```

<br/>

## 🔔 Features <a name = "features"></a>
- [x] Firebase Authentication
  - [x] Sign in
  - [x] Sign up
- [ ] Firebase Message
- [ ] User
  - [x] Main page
  - [ ] Profile
- [ ] Activity
  - [x] Activity list
  - [x] Activity detail
- [ ] Chat
- [ ] Payment

<br/>

## ✨ Release <a name = "release"></a>

### Android
- [Official documents](https://docs.flutter.dev/deployment/android)
- The passwords also store in google secret manager
- Able to release to local device, but not able to release to play store.

<br/>

## 🎉 Acknowledgements <a name = "acknowledgement"></a>
- [Flutter Architecture](https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/)
- [Firebase Authentification](https://firebase.google.com/docs/auth/flutter/start?hl=zh&authuser=3)

