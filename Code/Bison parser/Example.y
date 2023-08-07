%{ 
       #include<iostream>
       using namespace std;

       extern int yylex();
       extern int yyparse();
       extern File *yyin ;

void yyerror(const char *s)
%}

%union {
	int ival;
	float fval;
	char *sval;
}

%token <ival> INT
%token <fval> FLOAT
%token <sval> STRING

%% 

example:

	INT example {
			cout << "Bison found at: " << $1 << endl; 
     |	FLOAT example {
		cout << "Bison found at :" << $1 << endl;
     | 	STRING example {
		cout << "Bison found at :" << $1 << endl; (free $1); }		}

		} ;
%% 

int main(int, char**)
{
	File *myfile = fopen("code.ab", "r");

	if (!myfile) { 
		cout << "can't open" << endl;
		return -1; }

	yyin = myfile;
	yyparse();

}

void yyerror(const char *s) 
{
	cout <<"EEK , parse error ! Message :" << s << endl;

	exit(-1);
}

