% Define children of queen Elizabeth
offspring(prince_charles, queen_elizabeth).
offspring(princess_ann, queen_elizabeth).
offspring(prince_andrew, queen_elizabeth).
offspring(prince_edward, queen_elizabeth).

% Define who is directly older than who
older_than(prince_charles, princess_ann).
older_than(princess_ann, prince_andrew).
older_than(prince_andrew, prince_edward).

% Define predicate to check if A is older than B
older(A,B):- older_than(A,B).
older(A,B):- older_than(A,X), older(X,B).

% Define who should precede who

% X precedes Y if both are offspring of queen Elizabeth and X is older than Y
precedes(X, Y):- 
  offspring(X, A), offspring(Y, A),
  older(X, Y).

% Sorting algorithm
sort_successor_list([A|B], SortedList):- 
  sort_successor_list(B, Sorted_Tail), 
  insert(A, Sorted_Tail, SortedList).
sort_successor_list([], []).

insert(A, [B|C], [B|D]):- not(precedes(A,B)), !, insert(A, C, D).
insert(A, C, [A|C]).

% Generate line of succession
sortedSuccessorList(X, LineOfSuccession):-
  findall(Y, offspring(Y, X), SuccessorList),
  sort_successor_list(SuccessorList, LineOfSuccession).