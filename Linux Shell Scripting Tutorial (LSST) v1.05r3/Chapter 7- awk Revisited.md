**Linux Shell Scripting Tutorial (LSST) v1.05r3**

Chapter 7: awk Revisited

# Introduction : awk - Revisited

awk utility is powerful data manipulation/scripting programming language (In fact based on the C programming Language). Use awk to handle complex task such as calculation, database handling, report creation etc.

General Syntax of awk:
*Syntax:*
awk -f {awk program file} filename

awk Program contains are something as follows:

Pattern {
                   action 1
                   action 2
                   action N
            }

awk reads the input from given file (or from stdin also) one line at a time, then each line is compared with pattern. If pattern is match for each line then given action is taken. Pattern can be regular expressions. Following is the summery of common awk metacharacters:

| **Metacharacter** | **Meaning**                  |
| ----------------- | ---------------------------- |
| **. (Dot)**       | Match any character          |
| *****             | Match zero or more character |
| **^**             | Match beginning of line      |
| **$**             | Match end of line            |
| **\**             | Escape character following   |
| **[ ]**           | List                         |
| **{ }**           | Match range of instance      |
| **+**             | Match one more preceding     |
| **?**             | Match zero or one preceding  |
| **\|**            | Separate choices to match    |

# Getting Starting with awk

Consider following text database file

| **Sr.No** | **Product** | **Qty** | **Unit Price** |
| --------- | ----------- | ------- | -------------- |
| 1         | Pen         | 5       | 20.00          |
| 2         | Rubber      | 10      | 2.00           |
| 3         | Pencil      | 3       | 3.50           |
| 4         | Cock        | 2       | 45.50          |

In above file fields are Sr.No,Product,Qty,Unit Price. Field is the smallest element of any record. Each fields has its own attributes. For e.g. Take Qty. field. Qty. fields attribute is its numerical (Can contain only numerical data). Collection of fields is know as record. So
\1. Pen 5 20.00 ----> Is a Record.

Collection of record is know as *database file*. In above text database file each field is separated using space (or tab character) and record is separated using new-line character ( i.e. each record is finished at the end of line ). In the awk, fields are access using special variable. For e.g. In above database $1, ​$2, $3, ​$4 respectively represents Sr.No, Product, Qty, Unit Price fields. (Don't confuse $1,​$2 etc with command line arguments of shell script)

For this part of tutorial create text datafile **inven** (Shown as above). Now enter following simple awk program/command at shell prompt:
**$ awk '{ print $1 $2 "--> Rs." $3 \* $4 }' inven** 
*1.Pen--> Rs.1002.Pencil--> Rs.203.Rubber--> Rs.10.54.Cock--> Rs.91*

Above awk program/command can be explained as follows:

| **awk program statement**                     | **Explanation**                                              |
| --------------------------------------------- | ------------------------------------------------------------ |
| **'{ print \$1 \$2 "--> Rs." \$3 \* \$4 } '** | print command is used to print contains of variables or text enclose in " text ". Here \$1, ​\$2, ​\$3,​\$4 are all the special variable. ​\$1, ​\$2,  etc all of the variable contains value of field. Finally we can directly do the calculation using ​\$3 * ​\$4 i.e. multiplication of third and fourth field in database. Note that **"--> Rs."** is string which is printed as its. |

**Note** $1,$2 etc (in awk) also know as predefined variable and can assign any value found in field.

Type following awk program at shell prompt,
**$ awk '{ print $2 }' inven** 
*PenPencilRubberCock*

awk prints second field from file. Same way if you want to print second and fourth field from file then give following command:
**$awk '{ print $2 $4}' inven** 
Pen20.00
Pencil2.00
Rubber3.50
Cock45.50

$0 is special variable of awk , which print entire record, you can verify this by issuing following awk command:
$ awk '{ print $0 }' inven 
1. Pen 5 20.00
2. Pencil 10 2.00
3. Rubber 3 3.50
4. Cock 2 45.50

You can also create awk command (program) file as follows:

```
$ cat > prn_pen
/Pen/ { print $3 }
```

And then you can execute or run above "prn_pen" awk command file as follows
**$ awk -f prn_pen inven** 
*5*

*10*
In above awk program */Pen/* is the search pattern, if this pattern is found on line (or record) then print the third field of record. *{ print $3 }* is called Action. On shell prompt , *$ awk -f prn_pen inven* , **-f** option instruct awk, to read its command from given file, *inven* is the name of database file which is taken as input for awk.

Now create following awk program as follows:

```
$cat > comp_inv
$3 > 5 { print $0 }
```

Run it as follows:
**$ awk -f comp_inv inven** 
*2. Pencil 10 2.00*

Here third field of database is compared with 5, this the pattern. If this pattern found on any line database, then entire record is printed.

# Predefined variable of awk

Our next example talks more about predefined variable of awk. Create awk file as follows:

```
`$cat > def_var{print "Printing Rec. #" NR "(" $0 "),And # of field for this record is " NF}`
```

Run it as follows.
**$awk -f def_var inven** 
*Printing Rec. #1(1. Pen 5 20.00),And # of field for this record is 4Printing Rec. #2(2. Pencil 10 2.00),And # of field for this record is 4Printing Rec. #3(3. Rubber 3 3.50),And # of field for this record is 4Printing Rec. #4(4. Cock 2 45.50),And # of field for this record is 4*

*NR* and *NF* are predefined variables of awk which means Number of input Record, Number of Fields in input record respectively. In above example NR is changed as our input record changes, and NF is constant as there are only 4 field per record. Following table shows list of such built in awk variables.

| **awk Variable** | **Meaning**                                            |
| ---------------- | ------------------------------------------------------ |
| FILENAME         | Name of current input file                             |
| RS               | Input record separator character (Default is new line) |
| OFS              | Output field separator string (Blank is default)       |
| ORS              | Output record separator string (Default is new line)   |
| NF               | Number of input record                                 |
| NR               | Number of fields in input record                       |
| OFMT             | Output format of number                                |
| FS               | Field separator character (Blank & tab is default)     |

# Doing arithmetic with awk

You can easily, do the arithmetic with awk as follows

```
`$ cat > **math** {  print $1 " + " $2 " = " $1 + $2  print $1 " - " $2 " = " $1 - $2  print $1 " / " $2 " = " $1 / $2  print $1 " x " $2 " = " $1 * $2  print $1 " mod " $2 " = " $1 % $2}`
```

Run the awk program as follows:

**$ awk -f math** 
20 3
20 + 3 = 23
20 - 3 = 17
20 / 3 = 6.66667
20 x 3 = 60
20 mod 3 = 2
(Press CTRL + D to terminate)

In above program print $1 " + " $2 " = " $1 + $2, statement is used for addition purpose. Here $1 + $2, means add (+) first field with second field. Same way you can do - (subtraction ), * (Multiplication), / (Division), % (modular use to find remainder of division operation).

# User Defined variables in awk

You can also define your own variable in awk program, as follows:

```
`$ cat > **math1**{no1 = $1no2 = $2ans = $1 + $2print no1 " + " no2 " = " ans}`
```

Run the program as follows
**$ awk -f math1** 
*1 5*

*1 + 5 = 6*

In the above program, no1, no2, ans all are user defined variables. Value of first and second field are assigned to no1, no2 variable respectively and the addition to ans variable. Value of variable can be print using print statement as, print no1 " + " no2 " = " ans. Note that print statement prints whatever enclosed in double quotes (" text ") as it is. If string is not enclosed in double quotes its treated as variable. Also above two program takes input from stdin (Keyboard) instead of file.

Now try the following awk program and note down its output.

```
`$ cat > **bill**{total = $3 * $4recno = $1item = $2print recno item " Rs." total}`
```

Run it as
**$ awk -f bill inven** 
*1.Pen Rs.100*

*2.Pencil Rs.20*

*3.Rubber Rs.10.5*

*4.Cock Rs.91*

Here we are printing the total price of each product (By multiplying third field with fourth field). Following program prints total price of each product as well as the Grand total of all product in the bracket.

```
$ cat > bill1
{
total = $3 * $4
recno = $1
item = $2
gtotal = gtotal + total
print recno item " Rs." total " [Total Rs." gtotal "] "
}
```

Run the above awk program as follows:
**$ awk -f bill1 inven** 
*1.Pen Rs.100 [Total Rs.100]*

*2.Pencil Rs.20 [Total Rs.120]*

*3.Rubber Rs.10.5 [Total Rs.130.5]*

*4.Cock Rs.91 [Total Rs.221.5]*

In this program, gtotal variable holds the grand total. It adds the total of each product as gtotal = gtotal + total. Finally this total is printed with each record in the bracket. But their is one problem with our script, Grand total mostly printed at the end of all record. To solve this problem we have to use special BEGIN and END Patterns of awk. First take the example,

```
`$ cat > **bill2**BEGIN {   print "---------------------------"   print "Bill for the 4-March-2001. "   print "By Vivek G Gite. "   print "---------------------------"}{   total = $3 * $4   recno = $1   item = $2   gtotal += total   print recno item " Rs." total}END {   print "---------------------------"   print "Total Rs." gtotal   print "==========================="}`
```

Run it as
**$awk -f bill2 inven** 
*---------------------------*

*Bill for the 4-March-2001.*

*By Vivek G Gite.*

*---------------------------*

*1.Pen Rs.100*

*2.Pencil Rs.20*

*3.Rubber Rs.10.5*

*4.Cock Rs.91*

*---------------------------*

*Total Rs.221.5*

*===============*

Now the grand total is printed at the end. In above program BEGIN and END patters are used. BEGIN instruct awk, that perform BEGIN actions before the first line (Record) has been read from database file. Use BEGIN pattern to set value of variables, to print heading for report etc. General syntax of BEGIN is as follows
*Syntax:*BEGIN {
                action 1
                action 2
                action N
             }

END instruct awk, that perform END actions after reading all lines (RECORD) from the database file. General syntax of END is as follows:

END {
                 action 1
                 action 2
                 action N
          }

In our example, BEGIN is used to print heading and END is used print grand total.

# Use of printf statement

Next example shows the use of special printf statement

```
`$ cat > **bill3**BEGIN {    printf "Bill for the 4-March-2001.\n"    printf "By Vivek G Gite.\n"    printf "---------------------------\n"}{    total = $3 * $4    recno = $1    item = $2    gtotal += total    printf "%d %s Rs.%f\n", recno, item, total    #printf "%2d %-10s Rs.%7.2f\n", recno, item, total}END {   printf "---------------------------\n"   printf "Total Rs. %f\n" ,gtotal   #printf "\tTotal Rs. %7.2f\n" ,gtotal   printf "===========================\n"}`
```

Run it as follows:
**$ awk -f bill3 inven** 
*Bill for the 4-March-2001.*

*By Vivek G Gite.*

*---------------------------*

*1 Pen Rs.100.000000*

*2 Pencil Rs.20.000000*

*3 Rubber Rs.10.500000*

*4 Cock Rs.91.000000*

*---------------------------*

*Total Rs. 221.500000*

*===============*

In above example printf statement is used to print formatted output of the variables or text. General syntax of printf as follows:
*Syntax:*
printf "format" ,var1, var2, var N

If you just want to print any text using try printf as follows
printf "Hello"
printf "Hello World\n"

In last example **\n** is used to print new line. Its Part of escape sequence following may be also used:
**\t**   for tab
**\a**  Alert or bell
**\"**  Print double quote etc

For e.g. **printf "\nAn apple a day, keeps away\t\t\tDoctor\n\a\a"**
It will print text on new line as :
*An apple a day, keeps away Doctor*
Notice that twice the sound of bell is produced by \a\a. To print the value of decimal number use %d as format specification code followed by the variable name. For e.g. printf "%d" , no1

It will print the value of no1. Following table shows such common format specification code:

| **Format Specification Code** | **Meaning**                                | **Example**                                                  |
| ----------------------------- | ------------------------------------------ | ------------------------------------------------------------ |
| %c                            | Character                                  | {   isminor = "y"   printf "%c" , isminor }                  |
| %d                            | Decimal number such as 10,-5  etc          | {    n = 10    printf "%d",n }                               |
| %x                            | Hexadecimal number such as 0xA, 0xffff etc | {    n = 10    printf "%x",n }                               |
| %s                            | String such as "vivek", "Good buy"         | {    str1 = "Welcome to Linux!"    printf "%s", str1    printf "%s", "Can print ?" } |

To run above example simply create any awk program file as follows

```
`$ cat > p_demoBEGIN {n = 10printf "%d", nprintf "\nAn apple a day, keeps away\t\t\tDoctor\n\a\a"}`
```

Run it as
**$ awk -f p_demo**
*10An apple a day, keeps away Doctor*

Write awk program to test format specification code. According to your choice.

# Use of Format Specification Code

```
`$ cat > **bill4**BEGIN {  printf "Bill for the 4-March-2001.\n"  printf "By Vivek G Gite.\n"  printf "---------------------------\n"}{  total = $3 * $4  recno = $1  item = $2  gtotal += total  printf "%2d %-10s Rs.%7.2f\n", recno, item, total}END {  printf "---------------------------\n"  printf "\tTotal Rs. %6.2f\n" ,gtotal  printf "===========================\n"}`
```

Run it as
**$ awk -f bill4 inven** 
*Bill for the 4-March-2001.*

*By Vivek G Gite.*

*---------------------------*

*1 Pen       Rs. 100.00*

*2 Pencil   Rs. 20.00*

*3 Rubber Rs. 10.50*

*4 Cock    Rs. 91.00*

*---------------------------T*

*otal      Rs. 221.50*

*===============*

From the above output you can clearly see that printf can format the output. Let's try to understand formatting of printf statement. For e.g. %2d, number between % and d, tells the printf that assign 2 spaces for value. Same way if you write following awk program ,

```
`$ cat > prf_demo{na = $1printf "|%s|", naprintf "|%10s|", naprintf "|%-10s|", na}`
```

Run it as follows (and type the **God**)
**$ awk -f prf_demo**
**God**
*|God|*

*|      God|*

*|God      |*

(press CTRL + D to terminate)

| **printf "\|%s\|", na**    | Print God as its                                           |
| -------------------------- | ---------------------------------------------------------- |
| **printf "\|%10s\|", na**  | Print God Word as Right justified.                         |
| **printf "\|%-10s\|", na** | Print God Word as left justified. (- means left justified) |

Same technique is used in our bill4 awk program to print formatted output. Also the statement like gtotal += total, which is equvalent to gtotal = gtotal + total. Here += is called assignment operator. You can use following assignment operator:

| **Assignment operator** | **Use for**                         | **Example**    | **Equivalent to**    |
| ----------------------- | ----------------------------------- | -------------- | -------------------- |
| +=                      | Assign the result of addition       | a += 10 d += c | a = a + 10 a = a + c |
| -=                      | Assign the result of subtraction    | a -= 10 d -= c | a = a - 10 a = a - c |
| *=                      | Assign the result of multiplication | a *= 10 d *= c | a = a * 10 a = a * c |
| %=                      | Assign the result of modulo         | a %= 10 d %= c | a = a % 10 a = a % c |

# if condition in awk

General syntax of if condition is as follows:
*Syntx:*
if ( condition )
{
       Statement 1
       Statement 2
       Statement N
       if condition is TRUE
}
else
{
       Statement 1
       Statement 2
       Statement N
      if condition is FALSE
}

Above if syntax is selfexplontary, now lets move to next awk program

```
`$ awk > **math2**BEGIN {  myprompt = "(To Stop press CTRL+D) > "  printf "Welcome to MyAddtion calculation awk program v0.1\n"  printf "%s" ,myprompt}{no1 = $1op = $2no2 = $3ans = 0if ( op == "+" ){     ans = $1 + $3     printf "%d %c %d = %d\n" ,no1,op,no2,ans     printf "%s" ,myprompt } else {     printf "Opps!Error I only know how to add.\nSyntax: number1 + number2\n"     printf "%s" ,myprompt  }}END {    printf "\nGoodbuy %s\n" , ENVIRON["USER"]}`
```

Run it as follows (Give input as **5 + 2** and **3 - 1** which is shown in bold words)
**$awk -f math2**
*Welcome to MyAddtion calculation awk program v0.1*

*(To Stop press CTRL+D) > **5 + 2** *

*5 + 2 = 7*

*(To Stop press CTRL+D) > **3 - 1** *

*Opps!Error I only know how to add.Syntax: number1 + number2*

*(To Stop press CTRL+D) >*

*Goodbuy vivek*

In the above program various, new concept are introduce so lets try to understand them step by step

| BEGIN {                                                      | Start of BEGIN Pattern                                       |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| myprompt = "(To Stop press CTRL+D) > "                       | Define user define variable                                  |
| printf "Welcome to MyAddtion calculation awk program v0.1\n" printf "%s" ,myprompt | Print welcome message and value of **myprompt** variable.    |
| }                                                            | End of BEGIN Pattern                                         |
| {                                                            | Now start to process input                                   |
| no1 = $1 op  = $2 no2 = $3 ans = 0                           | Assign first, second, third, variables value to **no1, op, no2** variables respectively |
| if ( op == "+" ) {  ans = no1 + no2  printf "%d %c %d = %d\n" ,no1,op,no2,ans  printf "%s" ,myprompt  }       else {  printf "Opps!Error I only know how to add.\nSyntax:number1+ number2\n"  printf "%s" ,myprompt } | If command is used for decision making in awk program. Here if value of variable **op** is "+" then addition is done and result is printed on screen, else error message is shown on screen. |
| }                                                            | Stop all inputted lines are process.                         |
| END {   printf "\nGoodbuy %s\n" , ENVIRON["USER"]  }         | END patterns start here. Which says currently log on user Goodbuy. |

ENVIRON is the one of the predefined system variable that is array. Array is made up of different element. ENVIRON array is also made of elements. It allows you to access system variable (or variable in your environment). Give set command at shell prompt to see list of your environment variable. You can use variable name to reference any element in this array. For e.g. If you want to print your home directory you can write printf as follows:
**printf "%s is my sweet home", ENVIRON["HOME"]**

# Loops in awk

For loop and 

while loop

 are used for looping purpose in awk.

Syntax of for loop

Syntax:

for (expr1; condition; expr2)

{

​     Statement 1

​     Statement 2

​     Statement N

}

Statement(s) are executed repeatedly UNTIL the condition is true. BEFORE the first iteration, expr1 is evaluated. This is usually used to initialize variables for the loop. AFTER each iteration of the loop, expr2 is evaluated. This is usually used to increment a loop counter.

*Example:*

```
`$ cat > **while01.awk**BEGIN{   printf "Press ENTER to continue with for loop example from LSST v1.05r3\n"}{sum = 0i = 1for (i=1; i<=10; i++){  sum += i; # sum = sum + i}printf "Sum for 1 to 10 numbers = %d \nGoodbuy!\n\n", sumexit 1}`
```

Run it as follows:
**$ awk -f while01.awk**
*Press ENTER to continue with for loop example from LSST v1.05r3*

*Sum for 1 to 10 numbers = 55*

*Goodbuy*

Above for loops prints the sum of all numbers between 1 to 10, it does use very simple for loop to achieve this. It take number from 1 to 10 using i variable and add it to sum variable as sum = previous sum + current number (i.e. i).

Consider the one more example of for loop:

```
`$ cat > **for_loop**BEGIN {   printf "To test for loop\n"   printf "Press CTRL + C to stop\n" } {  for(i=0;i<NF;i++)  {       printf "Welcome %s, %d times.\n" ,ENVIRON["USER"], i  }}`
```

Run it as (and give input as **Welcome to Linux!**)
**$ awk -f for_loop**
*To test for loopPress CTRL + C to Stop*

**Welcome to Linux!**

Welcome vivek, 0 times.

Welcome vivek, 1 times.

Welcome vivek, 2 times.

Program uses for loop as follows:

| for(i=0;i<NF;i++)                                    | Set the value of i to 0 (Zero); Continue as long as value of i is less than NF (Remember NF is built in variable, which mean Number of Fields in record); increment i by 1 (i++) |
| ---------------------------------------------------- | ------------------------------------------------------------ |
| printf "Welcome %s, %d times.\n" ,ENVIRON["USER"], i | Print "Welcome...." message, with user name who is currently log on and value of i. |

Here i++, is equivalent to i = i + 1 statement. ++ is increment operator which increase the value of variable by one and -- is decrement operator which decrease the value of variable by one. Don't try i+++, to increase the value of i by 2 (since +++ is not valid operator), instead try i+= 2.

You can use while loop as follows:
*Syntax:*
while (condition)
{
      statement1
      statement2
      statementN
      Continue as long as given condition is TRUE
}

While loop will continue as long as given condition is TRUE. To understand the while loop lets write one more awk script:

```
`$ cat > **while_loop**{no = $1remn = 0while ( no > 1 ) {    remn = no % 10    no /= 10    printf "%d" ,remn } printf "\nNext number please (CTRL+D to stop):";}`
```

Run it as
**$awk -f while_loop** 
654
456
Next number please(CTRL+D to stop):587
785
Next number please(CTRL+D to stop):

Here user enters the number 654 which is printed in reverse order i.e. 456. Above program can be explained as follows:

| no = $1                                          | Set the first fields ($1) value to no.                       |
| ------------------------------------------------ | ------------------------------------------------------------ |
| remn = 0                                         | Set remn variable to zero                                    |
| {                                                | Start the while loop                                         |
| while (no > 1)                                   | Continue the loop as long as value of no is greater than one |
| remn = no % 10                                   | Find the remainder of no variable, and assign result to remn variable. |
| no /= 10                                         | Divide the no by 10 and store result to no variable.         |
| print "%d", remn                                 | Print the remn (remainder) variables value.                  |
| }                                                | End of while loop, since condition (no>1) is not true i.e false condition.. |
| printf "\nNext number please (CTRL+D to stop):"; | Prompt for next number                                       |

# Real life example in awk

Before learning more features of awk its time to see some real life example in awk.

**Our first Example**

I would like to read name of all files from the file and copy them to given destination directory. For e.g. The file [filelist.conf](http://www.freeos.com/guides/lsst/datafiles/filelist.conf); looks something as follows:
*/home/vivek/awks/temp/file1     /home/vivek/final/home/vivek/awks/temp/file2     /home/vivek/final/home/vivek/awks/temp/file3     /home/vivek/final/home/vivek/awks/temp/file4     /home/vivek/final*

In above file first field ($1) is the name of file that I would like to copy to the given destination directory ($2 - second field) i.e. copy /home/vivek/awks/temp/file1 file to /home/vivek/final directory. For this purpose write the awk program as follows:

```
`$ cat > temp2final.awk##temp2final.awk#Linux Shell Scripting Tutorial v1.05, March 2001#Author: Vivek G Gite#BEGIN{}## main logic is here#{    sfile = $1    dfile = $2    cpcmd = "cp " $1 " " $2    printf "Coping %s to %s\n",sfile,dfile    system(cpcmd)}## End action, if any, e.g. clean ups#END{}`
```

Run it as follows:
**$ awk -f temp2final.awk filelist.conf**

Above awk Program can be explained as follows:

| sfile = $1                             | Set source file path i.e. first field ($1) from the file filelist.conf |
| -------------------------------------- | ------------------------------------------------------------ |
| dfile = $2                             | Set source file path i.e. second field ($2) from the file filelist.conf |
| cpcmd = "cp " $1 " " $2                | Use your normal **cp** command for copy file from source to destination. Here **cpcmd**, variable is used to construct **cp** command. |
| printf "Coping %s to %s\n",sfile,dfile | Now print the message                                        |
| system(cpcmd)                          | Issue the actual cp command using **system()**, function.    |

*system()* function execute given system command. For e.g. if you want to remove file using rm command of Linux, you can write system as follows
*system("rm foo")*OR
*dcmd = "rm " $1system(dcmd)*

The output of command is not available to program; but system() returns the *exit code (error code)* using which you can determine whether command is successful or not. For e.g. We want to see whether rm command is successful or not, you can write code as follows:

```
`$ cat > **tryrmsys**{  dcmd = "rm " $1   if ( system(dcmd) != 0 )         printf "rm command not successful\n"   else        printf "rm command is successful and %s file is removed \n", $1}`
```

Run it as (assume that file foo exist and bar does not exist)
**$ awk -f tryrmsys**
**foo**
*rm command is successful and foo file is removed* 
**bar**
*rm command not successful*

(Press CTRL + D to terminate)

**Our Second Example:**

As I write visual installation guide, I use to capture lot of images for my work, while capturing images I saved all images (i.e. file names) in UPPER CASE for e.g.

RH7x01.JPG,RH7x02.JPG,...RH7x138.JPG.

Now I would like to rename all files to lowercase then I tried with following two scripts:

[**up2low**](http://www.freeos.com/guides/lsst/scripts/up2low) and [**rename.awk**](http://www.freeos.com/guides/lsst/scripts/rename.awk)

up2low can be explained as follows:

| **Statements/Command**                                       | **Explanation**                                              |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| AWK_SCRIPT="rename.awk"                                      | Name of awk scripts that renames file                        |
| awkspath=$HOME/bin/$AWK_SCRIPT                               | Where our awk script is installed usguall it shoude installed under your-home-directory/bin (something like /home/vivek/bin) |
| ls -1 > /tmp/file1.$$                                        | List all files in current working directory line by line and send output to /tmp/file1.$$ file. |
| tr "[A-Z]" "[a-z]" < /tmp/file1.$$ > /tmp/file2.$$           | Now convert all Uppercase filename to lowercase and store them to /tmp/file2.$$ file. |
| paste /tmp/file1.$$ /tmp/file2.$$ > /tmp/tmpdb.$$            | Now paste both Uppercase filename and lowercase filename to third file called /tmp/tmpdb.$$ file |
| rm -f /tmp/file1.$$ rm -f /tmp/file2.$$                      | Remove both file1.$$ and file2.$$ files                      |
| if [ -f $awkspath ]; then   awk -f $awkspath /tmp/tmpdb.$$ else   echo -e "\n$0: Fatal error - $awkspath not found"   echo -e "\nMake sure \$awkspath is set correctly in $0 script\n" fi | See if rename.awk script installed, if not installed give error message on screen. If installed call the rename.awk script and give it /tep/tepdb.$$ path to read all filenames from this file. |
| rm -f /tmp/tmpdb.$$                                          | Remove the temporary file.                                   |

rename.awk can be explained as follows:

| **Statements/Command**                                       | **Explanation**                                              |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| isdir1 = "[ -d " $1 " ] "                                    | This expression is quite tricky. Its something as follows: isdir1 = [ -d $1 ] Which means see if directory exists using [ expr ]. As you know [ expr ] is used to test whether expr is true or not. So we are testing whether directory exist or not. What does $1 mean? If you remember, in awk $1 is the first field. |
| isdir2 = "[ -d " $2 " ] "                                    | As above except it test for second field as isdir2 = [ -d $2 ] i.e. Whether second field is directory or not. |
| scriptname = "up2low" awkscriptname = "rename.awk"           | Our shell script name (up2low) and awk script name (rename.awk). |
| sfile = $1                                                   | Source file                                                  |
| dfile = $2                                                   | Destination file                                             |
| if ( sfile == scriptname \|\| sfile == awkscriptname )   next | Make sure we don't accidentally rename our own scripts, if scripts are in current working directory |
| else if( ( system(isdir1) ) == 0 \|\| system((isdir2)) == 0 ) {   printf "%s or %s is directory can't rename it to lower case\n",sfile,dfile   next # continue with next recored } | Make sure source or destination are files and not the directory. We check this using [ expr ] command of bash. From the awk script you can called or invoke (as official we called it) the [ expr ] if directory do exists it will return true (indicated by zero) and if not it will return nonzero value. |
| else if ( sfile == dfile ) {   printf "Skiping, \"%s\" is alrady in lowercase\n",sfile   next } | If both source and destination file are same, it mean file already in lower case no need to rename it to lower case. |
| else # everythink is okay rename it to lowercase {   mvcmd = "mv " $1 " " $2   printf "Renaming %s to %s\n",sfile,dfile   system(mvcmd) } | Now if source and destination files are notDirectoriesName of our scriptsAnd File is in UPPER CASEThen rename it to lowercase by issuing command mv command. |

**Note** that if you don't have files name in UPPER case for testing purpose you can create files name as follows:

```
`$ for j in 1 2 3 4 5 6 7 8 9 10; do touch TEMP$j.TXT; done`
```

Above sample command creates files as TEMP1.TXT,TEMP2.TXT,....TEMP10.TXT files.

Run it as follows:
**$ up2low**

Letters or letters is directory can't rename it to lower case

RH6_FILES or rh6_files is directory can't rename it to lower case

Renaming RH7x01.JPG to rh7x01.jpg

Renaming RH7x02.JPG to rh7x02.jpg

Renaming RH7x03.JPG to rh7x03.jpg

Renaming RH7x04.JPG to rh7x04.jpg

Renaming RH7x05.JPG to rh7x05.jpg

Renaming RH7x06.JPG to rh7x06.jpg

....

..

....

Renaming RH7x138.JPG to rh7x138.jpg

On my workstation above output is shown.

# awk miscellaneous

You can even take input from keyboard while running awk script, try the following awk script:

```
`$ cat > **testusrip**BEGIN {      printf "Your name please:"      getline na < "-"      printf "%s your age please:",na      getline age < "-"     print "Hello " na, ", next year you will be " age + 1}`
```

Save it and run as
**$ awk -f testusrip**
*Your name please:* **Vivek**
*Vivek your age please:* **26**
*Hello Vivek, next year you will be 27*

Here getline function is used to read input from keyboard and then assign the data (inputted from keyboard) to variable.
*Syntax:*
getline variable-name < "-"
|              |                      |
1              2                      3

1 --> getline is function name
2 --> variable-name is used to assign the value read from input
3 --> Means read from stdin (keyboard)

To reading Input from file use following
*Syntax:*
getline < "file-name"

*Example:*
getline < "friends.db"

To reading Input from pipe use following
*Syntax:*
"command" | getline

Example:

```
$ cat > awkread_file
BEGIN {
     "date" | getline
     print $0
}
```

Run it as
**$ awk -f awkread_file**

*Fri Apr 12 00:05:45 IST 2002*

Command date is executed and its piped to getline which assign the date command output to variable $0. If you want your own variable then replace the above program as follows

```
$ cat > awkread_file1
BEGIN {
     "date" | getline today
     print today
}
```

Run it as follows:
**$ awk -f awkread_file1**

Try to understand the following awk script and note down its output.
[**temp2final1.awk**](http://www.freeos.com/guides/lsst/scripts/temp2final1.awk)

# sed - Quick Introduction

SED is a stream editor. A stream editor is used to perform basic text transformations on an input stream (a file or input from a pipeline). SED works by making only one pass over the input(s), and is consequently more efficient. But it is SED's ability to filter text in a pipeline which particularly distinguishes it from other types of editors.

Before getting started with tutorial you must know basic expression which is covered in our [Learning expressions with ex ](http://www.freeos.com/guides/lsst/ch06.html)tutorial. For this part of tutorial create **demofile1**. After creating the file type following sed command at shell prompt:

**$ sed 's/Linux/UNIX(system v)/' demofile1**
*Hello World.This is vivek from Poona.I love linux..............linux is linux*

Above sed command can be explained as follows:

| **Commands**                  | **Meaning**                                                  |
| ----------------------------- | ------------------------------------------------------------ |
| **sed**                       | Start the sed command                                        |
| **'s/Linux/UNIX(system v)/'** | Use substitute command to replace Linux with UNIX(system v). General syntax of substitute is **s/pattern/pattern-to-substitute/'** |
| **demofile1**                 | Read the data from demofile1                                 |

General Syntax of sed
*Syntax:*
sed -option 'general expression' [data-file]
sed -option sed-script-file [data-file]

Option can be:

| **Option** | **Meaning**                                                  | **Example**                                                  |
| ---------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| -e         | Read the different sed command from command line.            | $ sed  -e  'sed-commands'    data-file-name **$ sed  -e   's/Linux/UNIX(system v)/'    demofile1** |
| -f         | Read the sed command from sed script file.                   | $sed   -f   sed-script-file    data-file-name **$ sed  -f  chgdb.sed    friends.tdb** |
| -n         | Suppress the output of sed command. When -n is used you must use **p** command of print flag. | **\$ sed -n  '/^\*..\$/p'   demofile2**                      |

# Redirecting the output of sed command

You can redirect the output of sed command to file as follows

$ sed 's/Linux/UNIX(system v)/' demofile1 > file.out

And can see the output using cat command as follows

$ cat file.out

### Deleting blank lines

Using sed you can delete all blank line from file as follow
**\$ sed '/^​\$/d' demofile1**
As you know pattern */^$/*, match blank line and **d**, command deletes the blank line.

Following sed command takes input from who command and sed is used to check whether particular user is logged or not.
**$ who | sed -n '/vivek/p'**
Here -n option to sed command, suppress the output of sed command; and */vivek/* is the pattern that we are looking for, finally if the pattern found its printed using **p** command of sed.

# How to write sed scripts?

Sed command can be grouped together in one text file, this is know as *sed script*. For next example of sed script create [**inven1**](http://www.freeos.com/guides/lsst/datafiles/inven1) data file and create "*chg1.sed*", script file as follows

**Tip:** Give *.sed* extension to sed script, *.sh* to Shell script and *.awk* to awk script file(s), this will help you to identify files quickly.

```
$ cat > chg1.sed
1i\
Price of all items changes from 1st-April-2001
/Pen/s/20.00/19.5/
/Pencil/s/2.00/2.60/
/Rubber/s/3.50/4.25/
/Cock/s/45.50/51.00/
```

Run the above sed script as follows:
$ sed -f chg1.sed inven1
Price of all items changes from 1st-April-2001
1. Pen 5 19.5
2. Pencil 10 2.60
3. Rubber 3 4.25
4. Cock 2 51.00

In above sed script, the *1i\* is the (**i**) insert command. General Syntax is as follows:
*Syntax:*
[line-address]i\
text

So,
**1i\Price of all items changes from 1st-April-2001** 
means insert the text "Price of all items changes from 1st-April-2001" at line number 1.

Same way you can use append (**a**) or change (**c**) command in your sed script,
General Syntax of append
*Syntax:*
[line-address]a\
text

*Example:*
/INDIA/ a\
E-mail: vg@indiamail.co.in


Find the word INDIA and append (a) "*E-mail: vg@indiamail.co.in*" text.

General Syntax of change as follows:
*Syntax:*
[line-address]c\
text

*Example:*
/INDIA/ c\
E-mail: vg@indiamail.co.in

Find the word INDIA and change e-mail id to "*vg@indiamail.co.in*"

Rest of the statements (like */Pen/s/20.00/19.5/*) are general substitute statements.

# More examples of sed

First create text file 

[demofile2](http://www.freeos.com/guides/lsst/datafiles/demofile2)

 which is used to demonstrate next sed script examples.

Type following sed command at shell promote:

$ sed -n '/10\{2\}1/p' demofile2

1001

Above command will print 1001, here in search pattern we have used 

\{2\}

.

Syntax:

\{n,\}

At least nth occurrences will be matched. So /10\{2\} will look for 1 followed by 0 (zero) and \{2\}, tells sed look for 0 (zero) for twice.

### Matcheing any number of occurrence

*Syntax:*
\{n,\m}
Matches any number of occurrence between n and m.

*Example:*
**$ sed -n '/10\{2,4\}1/p' demofile2**
1001
10001
100001
Will match "1001", "10001", "100001" but not "101" or "10000000". Suppose you want to print all line that begins with *\*\* (three stars or asterisks), then you can type command
**\$ sed -n '/^\*..​\$/p' demofile2**
*\*\*
**\*
Above sed expression can be explianed as follows:

| **Command** | **Explnation**                                               |
| ----------- | ------------------------------------------------------------ |
| **^**       | Beginning of line                                            |
| **\***      | Find the asterisk or star (\ remove the special meaning of '*' metacharacter) |
| **..**      | Followed by any two character (you can also use \*\* i.e. **\$ sed -n '/^\*\*\*$/p' demofile2** ) |
| **$**       | End of line (So that only three star or asterisk will be matched) |
| **/p**      | Print the pattern.                                           |

Even you can use following expression for the same purpose
**\$ sed -n '/^\*\{2,3\}​$/p' demofile2**

Now following command will find out lines between \*\*\* and \*\*\* and then delete all those line
**\$sed -e '/^\*\{2,3\}​\$/,/^\*\{2,3\}​\$/d' demofile2 > /tmp/fi.\$\$\$cat /tmp/fi.\$\$**

Above expression can be explained as follows

| **Expression**  | **Meaning**                                                  |
| --------------- | ------------------------------------------------------------ |
| **^**           | Beginning of line                                            |
| **\***          | Find the asterisk or star (\ remove the special meaning of **'\*'** metacharacter) |
| **\{2,3\}**     | Find next two asterisk                                       |
| **$**           | End of line                                                  |
| **,**           | Next range or search pattern                                 |
| **^\*\{2,3\}$** | Same as above                                                |
| **d**           | Now delete all lines between *** and *** range               |

You can group the commands in sed - scripts as shown following example

```
cat > dem_gsed
/^\*\{2,3\}$/,/^\*\{2,3\}$/{
/^$/d
s/Linux/Linux-Unix/
}<
```

Now save above sed script and run it as follows:
**\$ sed -f dem_gsed demofile2 > /tmp/fi.\$\$**

**\$ cat /tmp/fi.​\$\$**

Above sed scripts finds all line between *** and *** and performance following operations
1) Delete blank line, if any using /^$/d expression.
2) Substitute "Linux-Unix" for "Linux" word using s/Linux/Linux-Unix/ expression.

Our next example removes all blank line and converts multiple spaces into single space, for this purpose you need [**demofile3**](http://www.freeos.com/guides/lsst/datafiles/demofile3) file. Write sed script as follows:

```
$ cat > rmblksp
/^$/d
s/ */ /g<
```

Run above script as follows:
**$ sed -f rmblksp demofile3**
*Welcome to word of sed what sed is?*

*I don't know what sed is but I think*

*Rani knows what sed Is*

--------------------------------------------------

Above script can be explained as follows:

| **Expression**  | **Meaning**                                                  |
| --------------- | ------------------------------------------------------------ |
| **/^$/d**       | Find all blank line and delete is using **d** command.       |
| **s/   \*/ /g** | Find two or more than two blank space and replace it with single blank space |

**Note** that indicates     two blank space and indicate   one blank space.

For our next and last example create database file [**friends** ](http://www.freeos.com/guides/lsst/datafiles/friends)
Our task is as follows for friends database file:
1)Find all occurrence of "A'bad" word replace it with "Aurangabad" word
2)Exapand MH state value to Maharastra
3)Find all blank line and replace with actual line (i.e. ========)
4)Instert e-mail address of each persons at the end of persons postal address. For each person e-mail ID is different

To achieve all above task write sed script as follows:

```
`$ cat > mkchgfrddbs/A.bad/Aurangabad/gs/MH/Maharastra/gs/^$/===================================================================/g/V.K. /{NNa\email:vk@fackmail.co.in}/M.M. /{NNa\email:mm@fackmail.co.in}/R.K. /{NNa\email:rk@fackmail.co.in}/A.G. / {NNa\email:ag@fackmail.co.in}/N.K. / {NNa\email:nk@fackmail.co.in}`
```

Run it as follows:
**$ sed -f mkchgfrddb friends > updated_friendsdb**

**$ cat updated_friendsdb**
Above script can be explained as follows:

| **Expression**                           | **Meaning**                                                  |
| ---------------------------------------- | ------------------------------------------------------------ |
| **s/A.bad/Aurangabad/g**                 | Substitute Aurangabad for A'bad. Note that here second character in A'bad is ' (single quote), to match this single quote we have to use . (DOT - Special Metacharcter) that matches any single character. |
| **s/MH/Maharastra/g**                    | Substitute Maharastra for MH                                 |
| **s/^$/==========/g**                    | Substitute blank line with actual line                       |
| **/V.K. /{NNa\email:vk@fackmail.co.in}** | Match the pattern and follow the command between { and }, if pattern found. Here we are finding each friends initial name if it matches then we are going to end of his address (by giving **N** command twice) and appending (**a** command) friends e-mail address at the end. |

Our last examples shows how we can manipulate text data files using sed. Here our tutorial on sed/awk ends but next version (LSST ver 2.0) will cover more real life examples, case studies using all these tools, plus integration with shell scripts etc.

