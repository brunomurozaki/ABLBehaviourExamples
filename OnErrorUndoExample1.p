/*
    Documenta��o: https://documentation.progress.com/output/ua/OpenEdge_latest/index.html#page/dvref/on-error-phrase.html
    UNDO: Ele desfaz as opera��es feitas dentro do bloco, como definido na documenta��o. Por�m, ele s� faz quando h� uma opera��o de cria��o de registro definida (i.e. CREATE). 
    
    Este fonte, se executado desta forma, n�o apresentar� o resultado esperado. Mas se retirar o coment�rio da linha de CREATE Custumer, o UNDO funcionar� normalmente.
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

