grammar Enquanto;

programa : seqComando;     // sequência de comandos

seqComando: comando (';' comando)* ;

comando: ID ':=' expressao                          # atribuicao
       | 'skip'                                     # skip
       | 'se' bool 'entao' comando ('senaose' bool 'entao' comando)*? 'senao' comando	# se
       | 'enquanto' bool 'faca' comando 												#enquanto
       | 'escolha' ID ('caso' expressao ':' comando )*? 'outro' ':' comando   
       | 'exiba' Texto                              # exiba
       | 'escreva' expressao                        # escreva
       | '{' seqComando '}'                         # bloco
       |'para' ID 'de' expressao 'ate' expressao ('passo' INT)? 'faca' comando		#para
       | ID '(' (ID (',' ID)*)? ')' '=' expressao
       ;

expressao: INT                                      # inteiro
         | 'leia'                                   # leia
         | ID                                       # id
         | expressao ('^') expressao				# opBin
         | expressao ('*'|'/') expressao            # opBin
         | expressao ('+'|'-') expressao            # opBin       
         | '(' expressao ')'                        # expPar
          | ID '(' (expressao (',' expressao)*)? ')'	# chamadaFuncao
         ;

bool: ('verdadeiro'|'falso')                        # booleano
    | expressao '=' expressao                       # opRel
    | expressao '<=' expressao                      # opRel
    | expressao '>=' expressao                      # opRel
    | expressao '<>' expressao                      # opRel
    | 'nao' bool                                    # naoLogico
    | bool 'e' bool                                 # eLogico
    | bool 'ou' bool                                # orLogico
    | bool 'xor' bool                               # xorLogico
    | '(' bool ')'                                  # boolPar
    ;

INT: ('0'..'9')+ ;
ID: ('a'..'z')+;
Texto: '"' .*? '"';

Espaco: [ \t\n\r] -> skip;
