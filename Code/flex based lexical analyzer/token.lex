%option noyywrap

%{
    #include <stdio.h>
	
%}

increment_operators (\++|\+=)
decrement_operators (\-=|\--)

%%

PRINT       { printf("PRINT, '%s'\n", yytext); } 
[A-Z]       { printf("IDENTIFIER, '%s'\n", yytext); }
[a-z]       { printf("STRING, '%s'\n", yytext); }
","         { printf("COMMA, '%s'\n", yytext); }
"["         { printf("LEFT_BRACKET, '%s'\n", yytext); }
"]"         { printf("RIGHT_BRACKET, '%s'\n", yytext); }
"="         { printf("ASSIGNMENT, '%s'\n", yytext); }
"∪"         { printf("UNION, '%s'\n", yytext); }
"∩"         { printf("INTERSECT, '%s'\n", yytext); }
"-"         { printf("SUBSTRACT, '%s'\n", yytext); }
\n          { printf("NEWLINE\n"); }
"//".*      { printf("comment: %s\n", yytext); }
[ \t]       { printf("space or tab\n"); }
.           { printf("unexpected token: (%s)\n", yytext); }
{increment_operators} printf("(increment_operator) '%s' ",yytext);
{decrement_operators} printf("(decrement_operator) '%s' ",yytext);
	
%%

int main()
{
// printf("Enter input to show tokens: \n"); if you want to take input from user then comment or remove the yyin call
	
	yyin = fopen("code.ab","r");
	
    yylex(); 
}