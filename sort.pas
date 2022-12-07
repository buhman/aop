{$rangeChecks on}

unit sort;
interface

procedure heapsort(var a : array of longint);

implementation

function parent(i : longint) : longint;
begin
   parent := (i-1) div 2;
end;

function left_child(i : longint) : longint;
begin
   left_child := 2*i + 1;
end;

function right_child(i : longint) : longint;
begin
   right_child := 2*i + 2;
end;

procedure swap(var a : array of longint; i : longint; j : longint);
var temp : longint;
begin
   temp := a[i];
   a[i] := a[j];
   a[j] := temp;
end;

procedure sift_down(var a : array of longint; start_ix : longint; end_ix : longint);
var
   root_ix : longint;
   swap_ix : longint;
begin
   root_ix := start_ix;

   while left_child(root_ix) <= end_ix do
   begin
      swap_ix := root_ix;

      if a[swap_ix] > a[left_child(root_ix)] then
         swap_ix := left_child(root_ix);

      if (right_child(root_ix) <= end_ix) and (a[swap_ix] > a[right_child(root_ix)])
         then swap_ix := right_child(root_ix);

      if swap_ix = root_ix then
         break;

      swap(a, root_ix, swap_ix);

      root_ix := swap_ix;
   end;
end;

procedure heapify(var a : array of longint);
var
   start_ix : longint;
begin
   start_ix := parent(high(a));

   while start_ix >= 0 do
   begin
      sift_down(a, start_ix, high(a));

      start_ix := start_ix - 1;
   end;
end;

procedure heapsort(var a : array of longint);
var
   end_ix : longint;
begin
   heapify(a);

   end_ix := high(a);
   while end_ix > 0 do
   begin
      swap(a, end_ix, 0);
      end_ix := end_ix - 1;
      sift_down(a, 0, end_ix);
   end;
end;

begin
end.
