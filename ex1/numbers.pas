PROGRAM Numbers;

procedure printArray(var a: array of integer; aLen: integer);
var
   i: integer;
begin
    for i := 0 to (aLen-1) do
    begin
        writeln(a[i]);
    end;
end;

procedure generate(var a: array of integer; aLen, min, max: Word);
var
   i: integer;
begin
    Randomize;
    for i := 0 to (aLen-1) do
    begin
        a[i] := Random(max-min) + min;
    end;
end;

procedure sort(var a: array of integer; aLen: Word);
var
    i,j,t: integer;
begin
    for i := 0 to (aLen-1) do
    begin
        for j := 0 to (aLen-2-i) do
        begin
            if a[j] > a[j+1] then
            begin
                t := a[j];
                a[j] := a[j+1];
                a[j+1] := t;
            end;
        end;
    end;
end;

// TESTS

procedure test_run(val:boolean; fnName: string); 
begin
    if val = true then
        writeln('PASS: ' + fnName + '()')
    else
        writeln('!FAIL!: ' + fnName+'()');
end;

function test_generate_singleValue() : boolean;
CONST
    test_size: integer = 10;
    test_min: integer = 0;
    test_max: integer = 1;
var
    test_a: array of integer;
    i: integer;
begin
    setLength(test_a, test_size);
    generate(test_a, test_size, test_min, test_max);

    for i := 0 to (test_size-1) do
    begin
        if test_a[i] <> test_min then
        begin
            Exit(false);
        end;
    end;

    Exit(true);
end;

function test_generate_notLessThanMin() : boolean;
CONST
    test_size: integer = 10;
    test_min: integer = 0;
    test_max: integer = 10;
var
    test_a: array of integer;
    i: integer;
begin
    setLength(test_a, test_size);
    generate(test_a, test_size, test_min, test_max);

    for i := 0 to (test_size-1) do
    begin
        if test_a[i] < test_min then
        begin
            Exit(false);
        end;
    end;

    Exit(true);
end;

function test_generate_lessOrEqualMax() : boolean;
CONST
    test_size: integer = 10;
    test_min: integer = 0;
    test_max: integer = 10;
var
    test_a: array of integer;
    i: integer;
begin
    setLength(test_a, test_size);
    generate(test_a, test_size, test_min, test_max);

    for i := 0 to (test_size-1) do
    begin
        if test_a[i] >= test_max then
        begin
            Exit(false);
        end;
    end;

    Exit(true);
end;

function test_sort_sorted() : boolean;
CONST
    test_size: integer = 10;
    test_min: integer = 5;
    test_max: integer = 100;
var
    test_a: array of integer;
    i: integer;
begin
    setLength(test_a, test_size);
    generate(test_a, test_size, test_min, test_max);
    sort(test_a, test_size);

    for i := 0 to (test_size-2) do
    begin
        if test_a[i] > test_a[i+1] then
        begin
            Exit(false);
        end;
    end;

    Exit(true);
end;

function test_sort_singleValueSame() : boolean;
CONST
    test_size: integer = 10;
    test_min: integer = 0;
    test_max: integer = 1;
var
    test_a: array of integer;
    i: integer;
begin
    setLength(test_a, test_size);
    generate(test_a, test_size, test_min, test_max);
    sort(test_a, test_size);

    for i := 0 to (test_size-2) do
    begin
        if test_a[i] <> test_min then
        begin
            Exit(false);
        end;
    end;

    Exit(true);
end;

CONST
    size: integer = 10;
VAR
    a: array of integer;
BEGIN
    
    setLength(a, size);
    generate(a, size, 5, 13);
    printArray(a, size);

    sort(a, size);
    writeln('------------------');
    printArray(a, size);

    writeln('Running tests');
    test_run(test_generate_singleValue(), 'test_generate_singleValue');
    test_run(test_generate_notLessThanMin(), 'test_generate_notLessThanMin');
    test_run(test_generate_lessOrEqualMax(), 'test_generate_lessOrEqualMax');
    test_run(test_sort_sorted(), 'test_sort_sorted');
    test_run(test_sort_singleValueSame(), 'test_sort_singleValueSame');

END.