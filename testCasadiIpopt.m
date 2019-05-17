x = casadi.MX.sym('x',2);
p = casadi.MX.sym('p',4);

cost = x(1)+p(3)*x(2);

casadiNLP = struct;
casadiNLP.x = x;
casadiNLP.f = cost;
casadiNLP.g = x(1)+p(4)+p(2);
casadiNLP.p = p;

args = struct;
args.lbg = 4;
args.ubg = 5;
args.x0 = [1;1];
args.lbx = [-inf;-inf];
args.ubx = [inf;inf];
args.p = [4,1,1,4,4];

solver = casadi.nlpsol('my_solver','ipopt', casadiNLP);
sol = solver.call(args);
sol.x
