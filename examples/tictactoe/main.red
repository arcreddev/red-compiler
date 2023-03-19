PUSH "-"
PUSH "-"
PUSH "-"
MAKEARRAY
STORE T1
PUSH "-"
PUSH "-"
PUSH "-"
MAKEARRAY
STORE T2
PUSH "-"
PUSH "-"
PUSH "-"
MAKEARRAY
STORE T3
LOAD T1
LOAD T2
LOAD T3
MAKEARRAY
STORE board
UTIL INITBOOL "run"
UTIL INITBOOL "x"
UTIL INITNUM "counter"

FUNC step
    UTIL PRINT "row(0-2)?"
    INPUT
    STORE e
    
    LOAD e
    PUSH "exit"
    EQ
    STORE sa
    IF sa EXIT

    LOAD e
    FLOAT
    STORE row
    UTIL PRINT "column(0-2)?"
    INPUT
    FLOAT
    STORE col

    LOAD board row
    STORE tempi
    PUSH "O"
    IF x PUSH "X"
    LOAD tempi col
    PUSH "-"
    EQ
    STORE sa
    IF sa SETINDEX tempi col
    LOAD sa
    NOT
    STORE saba
    IF saba UTIL PRINT "INVALID"
    IF saba EXIT
    
    CLEAR
    LOAD tempi
    SETINDEX board row
    LOAD board 0
    STORE temp
    LOAD temp
    JOIN
    PRINT
    LOAD board 1
    STORE temp
    LOAD temp
    JOIN
    PRINT
    LOAD board 2
    STORE temp
    LOAD temp
    JOIN
    PRINT

    LOAD x
    NOT
    STORE x

    LOAD counter
    IF sa PUSH 1
    IF sa ADD
    STORE counter

    LOAD board 0
    STORE temp
    LOAD temp
    JOIN
    PUSH "OOO"
    EQ
    STORE owon
    LOAD board 1
    STORE temp
    LOAD temp
    JOIN
    PUSH "OOO"
    EQ
    LOAD owon
    NOT
    STORE ba
    IF ba STORE owon
    LOAD board 2
    STORE temp
    LOAD temp
    JOIN
    PUSH "OOO"
    EQ
    LOAD owon
    NOT
    STORE ba
    IF ba STORE owon
    CLEAR
    LOAD board 0
    STORE temp
    LOAD temp 0
    LOAD board 1
    STORE temp
    LOAD temp 1
    LOAD board 2
    STORE temp
    LOAD temp 2
    MAKEARRAY
    JOIN
    PUSH "OOO"
    EQ
    LOAD owon
    NOT
    STORE ba
    IF ba STORE owon
    CLEAR
    LOAD board 0
    STORE temp
    LOAD temp 2
    LOAD board 1
    STORE temp
    LOAD temp 1
    LOAD board 2
    STORE temp
    LOAD temp 0
    MAKEARRAY
    JOIN
    PUSH "OOO"
    EQ
    LOAD owon
    NOT
    STORE ba
    IF ba STORE owon
    CLEAR
    LOAD board 0
    STORE temp
    LOAD temp 0
    LOAD board 1
    STORE temp
    LOAD temp 0
    LOAD board 2
    STORE temp
    LOAD temp 0
    MAKEARRAY
    JOIN
    PUSH "OOO"
    EQ
    LOAD owon
    NOT
    STORE ba
    IF ba STORE owon
    CLEAR
    LOAD board 0
    STORE temp
    LOAD temp 1
    LOAD board 1
    STORE temp
    LOAD temp 1
    LOAD board 2
    STORE temp
    LOAD temp 1
    MAKEARRAY
    JOIN
    PUSH "OOO"
    EQ
    LOAD owon
    NOT
    STORE ba
    IF ba STORE owon
    CLEAR
    LOAD board 0
    STORE temp
    LOAD temp 2
    LOAD board 1
    STORE temp
    LOAD temp 2
    LOAD board 2
    STORE temp
    LOAD temp 2
    MAKEARRAY
    JOIN
    PUSH "OOO"
    EQ
    LOAD owon
    NOT
    STORE ba
    IF ba STORE owon
    
    LOAD board 0
    STORE temp
    LOAD temp
    JOIN
    PUSH "XXX"
    EQ
    STORE xwon
    LOAD board 1
    STORE temp
    LOAD temp
    JOIN
    PUSH "XXX"
    EQ
    LOAD xwon
    NOT
    STORE ba
    IF ba STORE xwon
    LOAD board 2
    STORE temp
    LOAD temp
    JOIN
    PUSH "XXX"
    EQ
    LOAD xwon
    NOT
    STORE ba
    IF ba STORE xwon
    CLEAR
    LOAD board 0
    STORE temp
    LOAD temp 0
    LOAD board 1
    STORE temp
    LOAD temp 1
    LOAD board 2
    STORE temp
    LOAD temp 2
    MAKEARRAY
    JOIN
    PUSH "XXX"
    EQ
    LOAD xwon
    NOT
    STORE ba
    IF ba STORE xwon
    CLEAR
    LOAD board 0
    STORE temp
    LOAD temp 2
    LOAD board 1
    STORE temp
    LOAD temp 1
    LOAD board 2
    STORE temp
    LOAD temp 0
    MAKEARRAY
    JOIN
    PUSH "XXX"
    EQ
    LOAD xwon
    NOT
    STORE ba
    IF ba STORE xwon
    CLEAR
    LOAD board 0
    STORE temp
    LOAD temp 0
    LOAD board 1
    STORE temp
    LOAD temp 0
    LOAD board 2
    STORE temp
    LOAD temp 0
    MAKEARRAY
    JOIN
    PUSH "XXX"
    EQ
    LOAD xwon
    NOT
    STORE ba
    IF ba STORE xwon
    CLEAR
    LOAD board 0
    STORE temp
    LOAD temp 1
    LOAD board 1
    STORE temp
    LOAD temp 1
    LOAD board 2
    STORE temp
    LOAD temp 1
    MAKEARRAY
    JOIN
    PUSH "XXX"
    EQ
    LOAD xwon
    NOT
    STORE ba
    IF ba STORE xwon
    CLEAR
    LOAD board 0
    STORE temp
    LOAD temp 2
    LOAD board 1
    STORE temp
    LOAD temp 2
    LOAD board 2
    STORE temp
    LOAD temp 2
    MAKEARRAY
    JOIN
    PUSH "XXX"
    EQ
    LOAD xwon
    NOT
    STORE ba
    IF ba STORE xwon

    PUSH 1
    PUSH 1
    PUSH 0
    IF owon ADD
    IF xwon ADD
    STORE or
    PUSH 1
    LOAD or
    EQ
    STORE someonewon

    LOAD counter
    PUSH 9
    EQ
    STORE sa
    IF sa UTIL SET "run" false
    
    IF sa PUSH "BOARD FULL"
    LOAD someonewon
    NOT
    STORE sab
    IF sab PUSH "DRAW"
    IF sa PRINT

    IF someonewon UTIL SET "run" false
    PUSH "O WINS"
    IF owon PRINT
    PUSH "X WINS"
    IF xwon PRINT
ENDFUNC

RUN step run