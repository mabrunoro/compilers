#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>
#include <string.h>
#include "parser.h"

#ifndef TREE_H
#define TREE_H

typedef enum
{
	PROGRAM,
	FUNCDECLLIST,
	FUNCDECL,
	FUNCHEADER,
	FUNCBODY,
	OPTVARDECL,
	OPTSTMTLIST,
	RETTYPE,
	PARAMS,
	PARAMLIST,
	PARAM,
	VARDECLLIST,
	VARDECL,
	STMTLIST,
	STMT,
	ASSIGNSTMT,
	LVAL,
	IFSTMT,
	BLOCK,
	WHILESTMT,
	RETURNSTMT,
	FUNCCAL,
	INPUTCALL,
	OUTPUTCALL,
	WRITECALL,
	USERFUNCCALL,
	OPTARGLIST,
	ARGLIST,
	BOOLEXPR,
	BOOLOP,
	ARITHEXPR,
	IDN,
	STRINGN
}tipo;

struct node;

typedef struct node tree;

tree* newnode(tipo p,int i);

void addchild(tree *p, tree *c);

tree* newsubtree(tipo p, int j, int c, ...);

void print(tree *t);

void printnode(tree *node, int level);

void freetree(tree *t);

const char * getenumname(int i,int j);

int printnodedot(tree *node);

void printdot(tree *a);

#endif
