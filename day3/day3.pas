{$rangeChecks on}

type
   item            = ord('A') .. ord('z');
   items           = set of item;
   array_of_string = array of string;

function priority(c: longint) : longint;
begin
   if (c >= ord('a')) and (c <= ord('z')) then
      priority := (c - ord('a')) + 1
   else
      priority := (c - ord('A')) + 27;
end;

function priority_sum(s : items) : longint;
var
   c   : longint;
   sum : longint = 0;
begin
   for c := ord('A') to ord('z') do
      if c in s then
         sum := sum + priority(c);

   priority_sum := sum;
end;

procedure common_items(var item_set : items; rucksack : string);
var
   pocket1 : items = [];
   pocket2 : items = [];
   i       : longint;
   size    : longint;
begin
   size := length(rucksack) div 2;
   for i := 1 to size do
   begin
      pocket1 := pocket1 + [ord(rucksack[i])];
      pocket2 := pocket2 + [ord(rucksack[i + size])];
   end;

   item_set := pocket1 * pocket2;
end;

function part1(rucksacks : array_of_string) : longint;
var
   item_set : items = [];
   sum : longint = 0;
   i   : longint;
begin
   for i := low(rucksacks) to high(rucksacks) do
   begin
      common_items(item_set, rucksacks[i]);
      sum := sum + priority_sum(item_set);
   end;

   part1 := sum;
end;

procedure parse_input(var a : array_of_string);
var
   input_file     : textfile;
   line           : string;
begin
   assign(input_file, 'input.txt');
   reset(input_file);

   while not eof(input_file) do
   begin
      readln(input_file, line);
      setlength(a, length(a) + 1);
      a[high(a)] := line;
   end;
end;

var
   rucksacks : array_of_string = ();
begin
   parse_input(rucksacks);
   writeln('part1 ', part1(rucksacks));
end.
