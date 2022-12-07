program day1;

uses sort, sysutils;

type array_of_longint = array of longint;

procedure parse_weights(var a : array_of_longint);
var
   input_file     : textfile;
   line           : string;
   current_weight : longint = 0;
begin
   assign(input_file, 'input.txt');
   reset(input_file);

   while not eof(input_file) do
   begin
      readln(input_file, line);

      if (line = '') then
         begin
            setlength(a, length(a) + 1);
            a[high(a)] := current_weight;
            current_weight := 0;
         end
      else
         current_weight := current_weight + strtoint(line);
   end;
end;

function solve(elf_weights : array_of_longint; n : longint) : longint;
var
   sum : longint = 0;
   i   : longint;
begin
   for i := low(elf_weights) to low(elf_weights) + (n - 1) do
      sum := sum + elf_weights[i];

   solve := sum;
end;

var
   elf_weights : array_of_longint;
begin
   parse_weights(elf_weights);

   heapsort(elf_weights);

   writeln('part1 ', solve(elf_weights, 1));
   writeln('part2 ', solve(elf_weights, 3));
end.
