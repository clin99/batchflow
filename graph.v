`include a.yml`
`include b.yml`
`include c.yml`


module MyModule(
  in_a1,
  in_a2,
  in_b1,
  out_c
);

input in_a1; [/home/clin99/file1]  // Specify input file position and name? Need to send this info to a.yml 
input in_a2;
input in_b1;

output out_c;  // This will be filled by the spec in yml



wire a2c;  // Each wire can be associated with a file name. This file name is used for the input for next gate
wire b2c;

A inst_a(.i1(in_a1), .i2(in_a2), .o1(a2c)) []
B inst_b(.i1(in_b1), .o1(b2c));
C inst_c(.i1(a2c), .i2(b2c), .o1(out_c));

// What if there is no dependency/IO between A, B and C but 
// we still want them to be executed in order

// Below shows an example without IO but has dependency

// Cells without any IO
// D inst_d();         
// E inst_e(); 
// inst_a -> inst_d 
// inst_d -> inst_e

endmodule 


