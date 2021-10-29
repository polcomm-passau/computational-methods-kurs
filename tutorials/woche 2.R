#Zuweisungsoperatoren
x = 10 
x<- 11

#Einfachere Variablentypen
#Integer
x = 10L
class(x)

#Numeric
y = 20.5
class(y)

#Character/Strings
x = "Hello 'Daria'"
a = "Hello"
substr(a, 1, 2) #String verkürzen
toupper(a)
tolower(a)
strsplit(a, NULL) #String austeilen
paste(a, "Du da")
paste(a, "Du da", sep= ",")

#Variablentyp ändern
x = "3"
class(x)
x = as.integer(x)
as.integer(3.14)
as.integer("3.14")
as.character(3)
as.numeric("3.14")

#Logical
x = TRUE
FALSE
class(x)

#Komplexere Variablentypen
#Vektoren

x = c(4,5,6,7,8,9)

gerade_zahlen = c(2,4,6,8)
ungerade_zahlen = c(1,3,5,7,9)
string_vektor = c("Ich", "bin", "ein", "string", "Vektor")
zahlen = c(gerade_zahlen, ungerade_zahlen)
zahlen

#Vektorenelemente auswählen -> []

zahlen[2]
zahlen[2:10]
zahlen[c(1,4,6)]
zahlen[-1]

#Praktische Funktionen mit Vektoren
zahlen + 1
zahlen[zahlen != 3]
sum(zahlen)
min(zahlen)
max(zahlen)
mean(zahlen)
sd(zahlen)
length(zahlen)

#Vektoren Namen vergeben
country_codes = c(germany = "049", australia = "061", italy = "039")
country_codes

codes = c(11, 44, 67)
names(codes) = c("china", "russia", "us")
codes

codes["russia"]

#Listen
l = list(10L, 3.14, "Text")
class(l)

#Matrizen
mat = matrix(1:12, 3,4)
mat

#Dataframes

df = mtcars
view(df)
df$cyl + 1
dim(df)
length(df) #Zahl der Variablen
names(df)
summary(df)

new_df = df[df$cyl >5 ,] #Subset
new_df


#Besonderer Variblentyp - Date

d = Sys.Date() #jetztige Datum
d
class(d)
format(d, "%d.%m%Y")
class(as.Date("2020*10*28", format = "%Y*%m*%d"))

#Zeitstempel
ts = Sys.time()
ts
