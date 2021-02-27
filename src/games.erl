-module(games).
-behaviour(gen_server).
-export([start_link/0,code_change/3,handle_call/3,handle_cast/2,handle_info/2,init/1,terminate/2]).

%TODO
%lookup cards in your hand
%who's turn / is it time to bet?
%lookup the player's names + how many points they have + how many tricks they have in the current round.
%lookup how much each player bet.
%lookup what cards have been played so far in this round.

%create a new game
%play a card
%bet


-record(game, {
          round_number, 
          how_many_rounds_in_game,
          dealer,
          whos_turn,
          trump,
          suit,
          players,%pubkeys
          points,
          hands,
          bets,
          player_names,
          nonces,
          time_to_play,
          time_to_bet,
          timer
         }).

init(ok) -> 
    process_flag(trap_exit, true),
    X = db:read(?LOC),
    Y = if
            (X == "") -> dict:new();
            true -> X
        end,
    {ok, Y}.
start_link() -> gen_server:start_link({local, ?MODULE}, ?MODULE, ok, []).
code_change(_OldVsn, State, _Extra) -> {ok, State}.
terminate(_, _) -> 
    db:save(?LOC, X),
    io:format("games died!"), 
    ok.
handle_info(_, X) -> {noreply, X}.
handle_cast(_, X) -> {noreply, X}.
handle_call(_, _From, X) -> {reply, X, X}.
