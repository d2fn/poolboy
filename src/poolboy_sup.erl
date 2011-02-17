% Poolboy by Devin Torres <devin@devintorres.com>

-module(poolboy_sup).
-behaviour(supervisor).

-export([start_link/2, init/1]).

start_link(Mod, Args) ->
    supervisor:start_link(?MODULE, {Mod, Args}).

init({Mod, Args}) ->
    {ok, {{simple_one_for_one, 0, 1},
          [{Mod, {Mod, start_link, [Args]},
            temporary, brutal_kill, worker, [Mod]}]}}.
