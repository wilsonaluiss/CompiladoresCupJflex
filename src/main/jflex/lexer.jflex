package umg.compiladores;

import java_cup.runtime.*;

%%

// Opciones y definiciones regulares

%public
%class Lexer
%char
%line
%column
%cup

%{
    private Symbol symbol(int tipo, Object valor) {
        return new Symbol(tipo, yyline, yycolumn, valor);
    }
%}

// Definiciones regulares

espacios_blanco  = [ \t\r\n]
identificador    = [a-zA-Z]+
numFloat         = "-?[0-9]+(?:\\.[0-9]+)?"
numDouble        = "-?[0-9]+(?:\\.[0-9]+)?(?:[eE][+-]?[0-9]+)?"
numEntero        = "-?[0-9]+"
comillas         = [\"\"]


%%

// Reglas léxicas

// 1. Declaración de variables
//float, double (positivos y negativos)
"float"           { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.FLOAT, yytext()); }
{numFloat}        { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.NUM_FLOAT, yytext()); }
"double"          { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.DOUBLE, yytext()); }
{numDouble}       { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.NUM_DOUBLE, yytext()); }

// int, long, short (positivos y negativos)
"int"             { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.INT, yytext()); }
"long"            { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.LONG, yytext()); }
"short"           { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.SHORT, yytext()); }
{numEntero}       { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.NUM_ENTERO, yytext()); }


//boolean
"boolean"         { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.BOOLEAN, yytext()); }
"true"            { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.TRUE, yytext()); }
"false"           { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.FALSE, yytext()); }


//Arreglos unidimensionales
"["                 { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.CORCHETE_ABRE, yytext()); }
"]"                 { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.CORCHETE_CIERRA, yytext()); }


//Arreglos bidimensionales

// Arreglos bidimensionales
"[" "["             { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.CORCHETE_ABRE2D, yytext()); }
"]" "]"             { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.CORCHETE_CIERRA2D, yytext()); }




// 2. Expresiones
// 2.1 Aritméticas
"+"               { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.SUMA, yytext()); }
"-"               { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.RESTA, yytext()); }
"*"               { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.MULTIPLICACION, yytext()); }
"/"               { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.DIVISION, yytext()); }
"^"               { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.POTENCIA, yytext()); }
"("               { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.PARENTESIS_ABRE, yytext()); }
")"               { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.PARENTESIS_CIERRA, yytext()); }

// 2.2 Relacionales
">"               { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.MAYOR_QUE, yytext()); }
">="              { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.MAYOR_O_IGUAL, yytext()); }
"<"               { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.MENOR_QUE, yytext()); }
"<="              { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.MENOR_O_IGUAL, yytext()); }
"="               { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.IGUAL, yytext()); }
"!="              { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.DIFERENTE, yytext()); }

// 2.3 
"&&"              { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.AND, yytext()); }
"||"              { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.OR, yytext()); }
"!"               { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.NEGACION, yytext()); }





// 3. Estructuras selectivas (simples y anidadas)
//3.1.	if, if-else, if-if else, if-if else-else simples y anidados
"if"              { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.IF, yytext()); }
"else"            { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.ELSE, yytext()); }

//3.2.	switch simple y anidado
"switch"          { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.SWITCH, yytext()); }
"case"            { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.CASE, yytext()); }
"break"           { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.BREAK, yytext()); }
"default"         { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.DEFAULT, yytext()); }





// 4. Ciclos
"for"             { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.FOR, yytext()); }
"while"           { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.WHILE, yytext()); }
"do"              { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.DO_, yytext()); }




// 5	Lectura de datos de pantalla. Utilizando la clase Scanner y los métodos next(), nextInt(), nextFloat(), etc.
"Scanner"         { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.SCANNER, yytext()); }
"next"            { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.NEXT, yytext()); }
"nextInt"         { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.NEXT_INT, yytext()); }
"nextFloat"       { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.NEXT_FLOAT, yytext()); }
"nextDouble"      { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.NEXT_DOUBLE, yytext()); }
"nextBoolean"     { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.NEXT_BOOLEAN, yytext()); }
"nextByte"        { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.NEXT_BYTE, yytext()); }
"nextLine"	  { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.NEXT_LINE, yytext()); }
"nextLong"        { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.NEXT_LONG, yytext()); }
"nextShort"       { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.NEXT_SHORT, yytext()); }




//6.	Impresión de mensajes en pantalla utilizando System.out.print y System.out.println().
"System"          { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.SYSTEM, yytext()); }
"."               { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.PUNTO, yytext()); }
"out"             { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.OUT, yytext()); }
"println"         { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.PRINTLN, yytext()); }
"print"           { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.PRINT, yytext()); }
";"               { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.PUNTO_Y_COMA, yytext()); }
"in"              { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.IN, yytext()); }




// 7. Declaración de métodos
"public"          { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.PUBLIC, yytext()); }
"class"           { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.CLASS, yytext()); }
"private"         { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.PRIVATE, yytext()); }
"static"          { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.STATIC, yytext()); }
"void"            { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.VOID, yytext()); }
"main"            { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.MAIN, yytext()); }
"args"            { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.ARGS, yytext()); }

"return"          { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.RETURN, yytext()); }

// 7.1 Recepción de parámetros
"("               { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.PARENTESIS_ABRE, yytext()); }
")"               { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.PARENTESIS_CIERRA, yytext()); }
","               { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.COMA, yytext()); }

// 7.2 Retorno de datos mediante la sentencia de return





//String
"String"          { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.STRING, yytext()); }
{identificador}   { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.PALABRA, yytext()); }

{comillas}   { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.COMILLAS, yytext()); }


"{"     { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.LLAVE_ABRE, yytext()); }
"}"     { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.LLAVE_CIERRA, yytext()); }
":"     { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.DOS_PUNTOS, yytext()); }
//"new"     { System.out.println("Se reconoce lexema: " + yytext()); return symbol(sym.NEW, yytext()); }


{espacios_blanco} { /* Ignorar estos símbolos */ }