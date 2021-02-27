-module(utils).
-export([off/0]).

off() ->
    oh_shaw_sup:stop(),
    ok = application:stop(oh_shaw).
