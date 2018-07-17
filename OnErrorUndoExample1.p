/*
    Documentação: https://documentation.progress.com/output/ua/OpenEdge_latest/index.html#page/dvref/on-error-phrase.html
    UNDO: Ele desfaz as operações feitas dentro do bloco, como definido na documentação. Porém, ele só faz quando há uma operação de criação de registro definida (i.e. CREATE). 
    
    Este fonte, se executado desta forma, não apresentará o resultado esperado. Mas se retirar o comentário da linha de CREATE Custumer, o UNDO funcionará normalmente.
*/


DEF VAR cTeste AS CHAR.

ASSIGN cTeste = "ponto um".

//CREATE customer.

ASSIGN cTeste = "ponto um".

DO ON ERROR UNDO, LEAVE:
    ASSIGN cTeste = "ponto dois".  
    RUN pi_retErroSePar (4).
    ASSIGN cTeste = "ponto tres".
END.

MESSAGE cTeste
    VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.


PROCEDURE pi_retErroSePar:
    DEFINE INPUT PARAM X AS INT NO-UNDO.
    IF X MOD 2 = 0  THEN DO:
        RETURN ERROR "NOK".
    END.
    ELSE DO:
        RETURN "OK".
    END.

END PROCEDURE.

