import graph.v

module Combine(
  in_1,
  in_2, 
  in_3, 
  out
);

input::stream in_1;
input::stream in_2;
input::stream in_3;
output::stream out;

wire::stream w1; 

//  in_1 ----
//           \        w1
//  in_2 ----- [m1] ------
//                        \
//               in_3 --- [m2] ------ out

MyModule m1(.in_a1(in_1), .in_a2(in_2), .out_1(w1));
MyModule m2(.in_a1(w1),   .in_a2(in_3), .out_1(out));

endmodule
