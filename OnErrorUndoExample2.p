/*
    Documentação: https://documentation.progress.com/output/ua/OpenEdge_latest/index.html#page/dvref/on-error-phrase.html
    UNDO: Ele desfaz as operações feitas dentro do bloco, como definido na documentação. Porém, ele só faz quando há uma operação de criação de registro definida (i.e. CREATE). 
    
    Este fonte, se executado desta forma, irá retornar a mensagem "ponto dois", pois está desfazendo (UNDO) o label 2, mas dando saindo (LEAVE) do label1. 
    Demonstra que o label é especificamente direcionado ao bloco, e não um GOTO, como de outras linguagens.
    Trocando os valores das labels nas clausulas de UNDO e LEAVE, teremos comportamentos diferentes.
*/


DEF VAR cTeste AS CHAR.

ASSIGN cTeste = "ponto um".

CREATE customer. 

ASSIGN cTeste = "ponto um".

label1:
    DO ON ERROR UNDO:
        ASSIGN cTeste = "ponto dois".  
        label2: 
            DO ON ERROR UNDO label2, LEAVE label1:
                ASSIGN cTeste = "ponto dois e meio".  
                RUN pi_retErroSePar (4).
            END.
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

