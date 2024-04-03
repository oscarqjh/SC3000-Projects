% sumsum, a competitor of appy
competitor(appy).
competitor(sumsum).

% developed some nice smart phone technology called galacticas3
developed(galacticas3, sumsum).

% galacticas3 is a smart phone technology
smart_phone_technology(galacticas3).

% all of which was stolen by stevey,
stolen(galacticas3, stevey).

% who is a boss of appy.
boss(stevey, appy).

% smart phone technology is business
business(X) :- smart_phone_technology(X).

% A competitor is a rival
rival(Company) :- competitor(Company).

% It is unethical for a boss to steal business from rival companies
unethical(Boss) :- stolen(Technology, Boss), business(Technology), boss(Boss, Company), rival(Company).





