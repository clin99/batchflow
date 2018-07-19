import a.yml
import b.yml
import c.yml


module MyModule();


wire::stream a2b;  // Each wire can be associated with a file name. This file name is used for the input for next gate
wire::depend b2c;

A inst_a(.o1(a2b))             takes("-lib late_library -v simple.v -param 1.234 -o simple_from_a.v");
B inst_b(.i1(a2b), .o1(b2c))   takes("-o simple_from_b.v");
C inst_c(.i1(b2c))             takes("-v simple_from_b.v -o simple_from_c.v");



// What if there is no dependency/IO between A, B and C but 
// we still want them to be executed in order

// Below shows an example without IO but has dependency

// Cells without any IO
// D inst_d();         
// E inst_e(); 
// inst_a -> inst_d 
// inst_d -> inst_e

endmodule 


