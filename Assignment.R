 #Question No1
#1.Try to write a code for printing sequence of numbers 
#from 1 to 50 with the differences of 3, 5, 10
count = 0
for (i in x)
{  
  if(i %% 2 == 0){
    count = count + 1
    print(i)
  }
}
print(count)
x = c(1:50)
x

#initiate count with 0
count = 0
for (i in x)
{  
  if(i %% 2 != 0){
    count = count + 1
    print(i)
  }
}
print(count)

#Question No2
#1.What are the different data objects in R? 
#and write syntax and example for each and every object

variable_logical<- TRUE  
cat(variable_logical,"\n")  
cat("The data type of variable_logical is ",class(variable_logical),"\n\n")  

#Numeric Data type  
variable_numeric<- 3532  
cat(variable_numeric,"\n")     
cat("The data type of variable_numeric is ",class(variable_numeric),"\n\n")  

#Integer Data type  
variable_integer<- 133L  
cat(variable_integer,"\n")   
cat("The data type of variable_integer is ",class(variable_integer),"\n\n")  

#Complex Data type  
variable_complex<- 3+2i  
cat(variable_complex,"\n")  
cat("The data type of variable_complex is ",class(variable_complex),"\n\n")  

#Character Data type  
variable_char<- "Learning r programming"  
cat(variable_char,"\n")  
cat("The data type of variable_char is ",class(variable_char),"\n\n")  

#Raw Data type  
variable_raw<- charToRaw("Learning r programming")  
cat(variable_raw,"\n")  
cat("The data type of variable_char is ",class(variable_raw),"\n\n") 

ID=c(1,2,3,4,5)
Name=c("John","Mani","Ram","Vijay","Nelson")
Location=c("Chennai","Mumbai","Banglore","Hyderabad","Mumbai")
Dept=c("HR","IT","Operations","IT","Admin")


df=data.frame(ID,Name,Location,Dept)
df

## Drop rows using slice()

library(dplyr)

df1 <- df %>% slice(-c(2))
df1

#Drop column
df1 <- df[ -c(3) ]
df1

#add new column
Salary=c(20000,40000,10000,40000,50000)
df1$Salary <- Salary
df1


#Adding row to the dataframe
# Data Frame - Step 1    
Employee_info <- data.frame(6, "Suraj", "IT",    40000)      

#Naming the Data Frame - Step 2  
names(Employee_info) <- c("ID", "Name", "Dept", "Salary")  

#Using rbind() function to insert above observation  
df1.Newdf <- rbind(df1, Employee_info) 
df1.Newdf

#Question No4 4.Write nested if else statements 
#to print whether the given number is negative, positive or Zero
x <- -3
if (x == 0) {
  print("Zero")
} else if (x > 0) {
  print("Positive number")
} else print("Negative Number")

#Q No.5.write a program to input any value and 
#check whether it is character, numeric or special character
ch = readline(prompt = "Enter any charcter: "); 
  if((ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z')){
    print("This is an alphabet")
  } else if (ch >= '0' && ch <= '9'){
    print("This is a number")
  }else print("This is a special character")
    
  
#Q no.6 write difference between break and next also write examples for both###

#The basic Function of Break and Next statement 
#is to alter the running loop in the program 
#and flow the control outside of the loop.
#In R language, repeat, for and while loops are used to run the statement 
#or get the desired output N number of times until the given condition to the loop becomes false.
#Sometimes there will be such a condition where we need to terminate the loop 
#to continue with the rest of the program. 
#In such cases R Break statement is used.
#Sometimes there will be such condition where we don't want loop to
#perform the program for specific condition inside the loop. 
#In such cases, R next statement is used.  

#Break Statement
no <- 1:10

for (val in no)
{
  if (val == 5) 
  {
    print(paste("Coming out from for loop Where i = ", val))
    break
  }
  print(paste("Values are: ", val))
}

#Next Statement

no <- 1:10

for (val in no)  
{
  if (val == 6)  
  {
    print(paste("Skipping for loop Where i =  ", val))
    next
  }
  print(paste("Values are:  ", val))
}

#Q No.7.write a program to print a given vector in reverse format  
v = c(1,5.6,3,10,3.5,5)
print("Original vector-1:")
print(v)
rv = rev(v)
print("The said vector in reverse order:")
print(rv)

#Q.No.8.write a program to get the mode value of the given vector 
.
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}


v <- c("a","b","c","t","a","c","r","a","c","t","z","r","v","t","u","e","t")

# Calculate the mode using the user function.
result <- getmode(v)
print(result)



#Q No.9.Write a function to filter only data belongs 
#to 'setosa' in species of Iris dataset
install.packages('dplyr')
library(dplyr)
data("iris")

filter(iris , Species=="setosa")


#Q No.10.Create a new column for iris dataset with the name of Means_of_obs, 
#which contains mean value of each row.( using dplyr package)
iris_complete <- na.omit(iris) 
iris_complete
Means_of_obs <- sapply(rowMeans(iris_complete))

iris <- cbind(iris_complete, Means_of_obs)

#Q No.11.Filter data for the "versicolor" 
#and get only 'sepel_length' and Sepel _width' columns.( using dplyr package)
iris[c(51:150),c(1,2)]
