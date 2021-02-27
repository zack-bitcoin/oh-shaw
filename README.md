Oh Shaw
=====

The purpose of this software is to play a card game.

turn it on:
```
sh start.sh
```

after you turn it on, the local page for users can be seen here:
http://127.0.0.1:8000/home.html

it automatically starts in the background. You can attach to it to be able to run commands like this:
```
sh attach.sh
```

After attaching, you can turn the system off and preserve the current state like this:
```
utils:off().
halt().
```

or you can detach from the running process, and return it to the background by holding the Control key, and clicking the 'D' key.
