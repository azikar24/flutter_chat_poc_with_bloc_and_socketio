# flutter_chat_poc_with_socket

A project to demonstrate socket io with flutter in a chat application.
Minimal POC

## Getting Started

- clone the project: 
  - ```git clone https://github.com/azikar24/flutter_chat_poc_with_bloc_and_socketio.git``` 
- open the project
  - in the terminal: 
    ```
      dart pub get
      cd node-socket-api
      npm i
      npm run dev
    ```
  - update config.dart
    - You will get an output from socket server: Application is listening at http://XXX.XXX.XXX.XXX:1996
    - update socketHost with this output
