-module(echo).
-export([go/0, loop/0]).

%The main routine
go() ->
	% Create new process with routine loop()
	Pid2 = spawn(echo, loop, []),

	% Send Pid2 a message
	Pid2 ! {self(), hello},

	% The main process receive callback
	receive
		{Pid2, Msg} ->
			% Print out the message
			io:format("P1 ~w~n",[Msg])
	end,
	% Tell the second process to stop
	Pid2 ! stop.

% The second process
loop() ->
	% The second process receive callback
	receive
		{From, Msg} ->
			% Send message back to who sent it
			From ! {self(), Msg},
			loop();
		% If we get a stop message, stop
		stop ->
			true
	end.
