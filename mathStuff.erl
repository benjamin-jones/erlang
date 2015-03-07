-module(mathStuff).
-export([factorial/1, area/1, average/1, sum/1, len/1, double/1, member/2]).

factorial(0) -> 1;
factorial(N) -> N * factorial(N-1).

area({square, Side}) ->
	Side * Side;
area({circle, Radius}) ->
	% almost :)
	3 * Radius * Radius;
area({triangle, A, B, C}) ->
	S = (A+B+C)/2,
	math:sqrt(S*(S-A)*(S-B)*(S-C));
area(Other) ->
	{invalid_object, Other}.

average(X) -> sum(X) / len(X).

sum([H|T]) -> H + sum(T);
sum([]) -> 0.

len([_|T]) -> 1 + len(T);
len([]) -> 0.

double([H|T]) -> [2*H|double(T)];
double([]) -> [].

member(H, [H|_]) -> true;
member(H, [_|T]) -> member(H,T);
member(_, []) -> false.
