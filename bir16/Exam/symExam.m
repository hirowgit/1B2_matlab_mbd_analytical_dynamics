syms x
f = sin(5*x)

syms x z y
int(x/(1 + z^2), x)
int(x/(1 + z^2), z)

int(cos(x*y),y)


int(x*cos(x*y),y)

expand(int(1/(3+cos(x)),x))

int(1/(2+cos(x)),x)
diff(2/sqrt(3)*atan(tan(x/2)/sqrt(3)),x)

syms t
int(1/(2+t^2),t)
