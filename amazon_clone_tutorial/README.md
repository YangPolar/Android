# amazon_clone_tutorial

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.




-------------------------------Yang Note-----------------------------------------------

# Android
Install Android Studio

# Flutter
https://docs.flutter.dev/get-started/install/windows
> flutter --version

> flutter create amazon_clone_tutorial
Open with AndroidStudio

> flutter pub add http
Install http

> flutter pub add shared_preferences
Install this to save token data into app memory

> flutter pub add provider
Install provider to save login user data so it can pass to other app.

# Node.js
1. Create a server folder in the project root directory

2. In the terminal, run "npm init"
{
  "name": "server",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "",
  "license": "ISC"
}

3. npm i http express mongoose
npm i bcryptjs
Run: node index.js

4. install the nodemon dependency in dev mode
npm i nodemon --save-dev

5. Setup dev mode: no need to restart server
"scripts": {
    "start": "node ./index.js",
    "dev": "nodemon ./index.js"
},
npm run dev

6. Create account and DB in https://www.mongodb.com/

7.  npm i jsonwebtoken






