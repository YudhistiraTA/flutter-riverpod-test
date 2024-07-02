#!/bin/bash

# Read the API_KEY from the .env file
API_KEY=$(grep -oP '^API_KEY=\K.*' .env)

# Run the flutter command with the API_KEY as a Dart define
flutter run --dart-define=API_KEY="$API_KEY"