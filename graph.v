//import a.yml
//import b.yml
//import c.yml

module MyModule(
  in_a1,
  in_a2,
  out_c
);

input::stream in_a1;  
input::stream in_a2;

output::stream out_c;  

wire::stream a2b;  
wire::depend b2c;


//  in_a1 -----
//             \             a2b               b2c 
//  in_a2 ------ [inst_a] -------- [inst_b] --------- [inst_c] ---- out_c
//

A inst_a(.i1(in_a1), .i2(in_a2), .o1(a2b)) takes("-lib late_library -v simple.v -param 1.234 -o simple_from_a.v");
B inst_b(.i1(a2b),   .o1(b2c))             takes("-o simple_from_b.v");
C inst_c(.i1(b2c),   .o1(out_c))           takes("-v simple_from_b.v -o simple_from_c.v");




// What if there is no dependency/IO between A, B and C but 
// we still want them to be executed in order

// Below shows an example without IO but has dependency

// Cells without any IO
// D inst_d();         
// E inst_e(); 
// inst_a -> inst_d 
// inst_d -> inst_e

endmodule 
