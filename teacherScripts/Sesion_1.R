#PERMITE COLOCAR COMENTARIOS
#HOLA MUNDO !!!!!

#Pedir ayuda
help(solve)   # es equivalente a la l�nea 6
?solve
example(solve)

#borrar la consola Ctrl + L

#Calculadora en R
# +, - : suma y resta
7+4
5-4
#producto *,  divisi�n /
78/10
4*12

#aritm�tica entera
#   %% regresa el residuo de la divisi�n de 7/3
7%%3
#  %/% regresa el cociente de la divisi�n entera de 7/3
7%/%3

#FUNCIONES PRECARGADAS EN R
#logaritmos
log(8,2)     #regresa el logaritmo de 8 en base 2
log10(1000)  #regresa el logaritmo de 1000 en base 10
log(1000,10) #equivalente a log10
log(9)       #regresa el logaritmo natural de 9
log(9,exp(1))   #es equivalente a log

exp(1)       #regresa el n�mero de Euler
exp(3)      #regresa la funci�n exponencial evaluada en 3
2.718282^3  #aproximadamente exp(3)
pi          #es el valor default precargado en R del n�mero pi

#Casos extremos
7/0
-7/0
#Inf es el s�mbolo de R que denota la idea de que 
#al hacer la divisi�n se realiza como un l�mite
0/7
#
0/0
#NaN representa una operaci�n que no tiene ninguna 
#soluci�n, no siquiera en el caso de l�mites
#
7/Inf     #la divisi�n entre "infinito" es cero
7/-Inf    #tambi�n por la izquierda...
#
abs(-5)   #regresa el valor absoluto de un n�mero
abs(5)

#Para definir objetos se puede emplear "=" � "<-"
x=6    #el n�mero x es igual a 6
x
x<-6   #el n�mero 6 se asigna a x
x
class(x)   #regresa el tipo del objeto

#Definimos un vector columna con 5 valores 
x=c(7,4,0,8,9)  #c define un vector columna
x
x[1]      #regresa el primer valor
xt=t(x)   #x como fila, obtiene la transpuesta
xt
y=c(-2,-6,0,9,1)
y
#las operaciones se realizan elemento a elemento
x
X     #X may�scula no es el objeto x min�scula
y
x+y     #suma
x-y     #resta
x*y     #producto
x/y     #divisi�n
x^y     #potencia
#
z=c(8,4)
x
z
w=x+z
w
#
#Cadenas
a=c("Juan","D�az")
a
class(a)      #checamos el atributo 

#�lgebra Booleana
u=c(TRUE,FALSE)
u
class(u)       #revisamos el atributo de u




#Matrices
A=matrix(NA,nrow=1,ncol=3)     #matriz de 1X3: vector fila
A
A=matrix(NA,1,3)               #NA es celda vac�a
A
B=matrix(NA,3,1)      #matriz de 3X1: vector columna
B
C=matrix(NA,2,3)      #matriz de 2X3
C
#Notaci�n de filas y columnas
B[2,1]    #mandamos llamar a la fila 2 columna 1
B[1,1]=9  #filas 1 columna 1
B[1] #en vectores columna, basta con indicar la fila
     #B[1]  es equivalente a B[1,1] solo
     #filas y columnas
B
B[2]<--8    #asignamos valores en la segunda y tercera fila
B[3]<-10
B

#La columna 1 con todas sus filas (espacio vac�o)
C[,1]
#La fila 1 con todas sus columnas (espacio vac�o)
C[1,]

#Definamos concretamente una matriz
C[1,1]=8   #fila 1 columna 1 es 8
C[2,1]=7
C[1,2]=3
C[2,2]=4
C[1,3]=-7
C[2,3]=10
C
C[1,]     #primera fila
C[,1]     #primera columna

#Se puede incrustar filas o columnas
x=c(1,2)
C[,3]<-x   #se sustituye la tercera columna de C
C
x<-c(5)
C[,3]<-x
#Se puede mandar llamar submatrices con el s�mbolo ":"
C
C[,2:3]   #muestra todas las filas de la columna 2 a la columna 3
C
u=c(1,3)  #vector columna con elementos 1 y 3
C[,u]     #mostrar las columnas que empatan con u

#Operaciones de matrices
A=C+2     #suma de un escalar con matriz
          #elemento a elemento
A
B=2*C     #multiplica por 2 cada entrada de la matriz

D= A + 3*A   #Suma de matrices, se requiere
           #mismo n�mero de filas y columnas

E= C-A     #Resta de dos matrices, elemento por elemento
E          #Deben tener el mismo tama�o en filas y columnas  

#Matriz transpuesta
t(A)     #gira las filas y columnas:
         #filas se vuelven columnas y las columnas filas...

#Producto de matrices 
D*E             #solo multiplica elemento por elemento
G=D%*%t(E)      #%*% representa el producto matricial
             #debemos cuidar el n�mero de filas y
             #columnas por definici�n
G

#El determinante de una matriz 
#se realiza sobre matrices cuadradas:
#mismo n�mero de filas y columnas
det(G)


#Matriz inversa  A*A^(-1)=I;   A^(-1)*A=I
A=matrix(NA,3,3)
A[,1]<-c(1,2,3)
A[,2]<-c(-8,7,1)
A[,3]<-c(6,5,1) 
A  
A1=solve(A)      #es la matriz inversa A^(-1)
A1
round(A%*%A1,0)    #round redondea cifras
round(A1%*%A,0)    #round redondea cifras
round(8.34752392,4)    #redondear a cuatro d�gitos

#Nota. El producto de A con A^(-1)
#es la matriz identidad.
#Adem�s, en matrices el orden de multiplicarlas
#s� altera los resultados  A%*%B  es diferente
# B%*%A...


#Redondear un n�mero
round(7.34234124312,3)    #redondear a tres d�gitos
#
#Techo del n�mero: el entero superior m�s cercano
ceiling(7.31231231)
#
#Piso del n�mero: el entero inferior m�s cercano
floor(4.7897645)



