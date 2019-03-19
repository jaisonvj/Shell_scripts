**Linux Shell Scripting Tutorial (LSST) v1.05r3**

Chapter 3: Shells (bash) structured Language Constructs

# Introduction

Making decision is important part in ONCE life as well as in computers logical driven program. In fact logic is not LOGIC until you use decision making. This chapter introduces to the bashs structured language constricts such as:

- Decision making
- Loops

Is there any difference making decision in Real life and with Computers? Well real life decision are quit complicated to all of us and computers even don't have that much power to understand our real life decisions. What computer know is 0 (zero) and 1 that is Yes or No. To make this idea clear, lets play some game (WOW!) with bc - Linux calculator program.
**$ bc** 
After this command bc is started and waiting for your commands, i.e. give it some calculation as follows type 5 + 2 as:
**5 + 2** 
*7*
7 is response of bc i.e. addition of 5 + 2 you can even try
**5 - 2**
**5 / 2**
See what happened if you type 5 > 2 as follows
**5 > 2**
*1*
1 (One?) is response of bc, How? bc compare 5 with 2 as, Is 5 is greater then 2, (If I ask same question to you, your answer will be YES), bc gives this 'YES' answer by showing 1 value. Now try
**5 < 2**
*0*
0 (Zero) indicates the false i.e. Is 5 is less than 2?, Your answer will be no which is indicated by bc by showing 0 (Zero). Remember in bc, [relational expression](http://www.freeos.com/guides/lsst/ch03sec01.html#whatexpressionis) always returns **true** (1) or **false** (0 - zero).

Try following in bc to clear your Idea and not down bc's response
**5 > 12**

**5 == 10**

**5 != 2**

**5 == 5**

**12 < 2**

| **Expression** | **Meaning to us**      | **Your Answer** | **BC's Response** |
| -------------- | ---------------------- | --------------- | ----------------- |
| 5 > 12         | Is 5 greater than 12   | NO              | 0                 |
| 5 == 10        | Is 5 is equal to 10    | NO              | 0                 |
| 5 != 2         | Is 5 is NOT equal to 2 | YES             | 1                 |
| 5 == 5         | Is 5 is equal to 5     | YES             | 1                 |
| 1 < 2          | Is 1 is less than 2    | Yes             | 1                 |

It means when ever there is any type of comparison in Linux Shell It gives only two answer one is YES and NO is other.

| **In Linux Shell Value** | **Meaning** | **Example**                      |
| ------------------------ | ----------- | -------------------------------- |
| Zero Value (0)           | Yes/True    | 0                                |
| NON-ZERO Value           | No/False    | -1, 32, 55 anything but not zero |

Remember both bc and Linux Shell uses *different ways to show True/False values*

| **Value** | **Shown in bc as** | **Shown in Linux Shell as** |
| --------- | ------------------ | --------------------------- |
| True/Yes  | 1                  | 0                           |
| False/No  | 0                  | Non - zero value            |

# if condition

if condition which is used for decision making in shell script, If given condition is true then command1 is executed.
*Syntax:*

```
	if condition
	then
		command1 if condition is true or if exit status
		of condition is 0 (zero)
		...
		...
	fi
```



Condition is defined as:
"*Condition is nothing but comparison between two values.*"

For compression you can use test or [ expr ] statements or even exist status can be also used.

Expreession is defined as:
"*An expression is nothing but combination of values, relational operator (such as >,<, <> etc) and mathematical operators (such as +, -, / etc ).*"

Following are all examples of expression:
5 > 2
3 + 6
3 * 65
a < b
c > 5
c > 5 + 30 -1

Type following commands (assumes you have file called **foo**)
**$ cat foo$ echo $?** 
The cat command return zero(0) i.e. exit status, on successful, this can be used, in if condition as follows, Write shell script as

```
`$ cat > showfile#!/bin/sh##Script to print file#if cat $1thenecho -e "\n\nFile $1, found and successfully echoed"fi`
```

Run above script as:
**$ chmod 755 showfile**
**$./showfile foo**
Shell script name is showfile ($0) and foo is argument (which is $1).Then shell compare it as follows:
if cat $1 which is expanded to if cat foo.

**Detailed explanation**
if cat command finds foo file and if its successfully shown on screen, it means our cat command is successful and its exist status is 0 (indicates success), So our if condition is also true and hence statement echo -e "\n\nFile $1, found and successfully echoed" is proceed by shell. Now if cat command is not successful then it returns non-zero value (indicates some sort of failure) and this statement echo -e "\n\nFile $1, found and successfully echoed" is skipped by our shell.

**Exercise**
Write shell script as follows:

```
`cat > trmif## Script to test rm command and exist status#if rm $1thenecho "$1 file deleted"fi`
```

Press Ctrl + d to save
**$ chmod 755 trmif**

Answer the following question in referance to above script:
(A) foo file exists on your disk and you give command, **$ ./trmfi foo** what will be output?
(B) If bar file not present on your disk and you give command, **$ ./trmfi bar** what will be output?
(C) And if you type **$ ./trmfi** What will be output?

[For Answer click here.](http://www.freeos.com/guides/lsst/misc.htm#ifanstrmif)

# test command or [ expr ]

test command or [ expr ] is used to see if an expression is true, and if it is true it return zero(0), otherwise returns nonzero for false.
*Syntax:* 
test expression OR [ expression ]
*Example:*Following script determine whether given argument number is positive.

```
`$ cat > ispostive#!/bin/sh## Script to see whether argument is positive#if test $1 -gt 0thenecho "$1 number is positive"fi`
```

Run it as follows
**$ chmod 755 ispostive**

**$ ispostive 5**
*5 number is positive*

**$ispostive -45**
*Nothing is printed*

**$ispostive**
*./ispostive: test: -gt: unary operator expected*

**Detailed explanation**
The line, if test $1 -gt 0 , test to see if first command line argument($1) is greater than 0. If it is true(0) then test will return 0 and output will printed as 5 number is positive but for -45 argument there is no output because our condition is not true(0) (no -45 is not greater than 0) hence echo statement is skipped. And for last statement we have not supplied any argument hence error ./ispostive: test: -gt: unary operator expected, is generated by shell , to avoid such error we can test whether command line argument is supplied or not.



test or [ expr ] works with
1.Integer ( Number without decimal point)
2.File types
3.Character strings

**For Mathematics, use following operator in Shell Script**



| **Mathematical Operator in  Shell Script** | **Meaning**                 | **Normal Arithmetical/ Mathematical Statements** | **But in Shell**                       |                                            |
| ------------------------------------------ | --------------------------- | ------------------------------------------------ | -------------------------------------- | ------------------------------------------ |
|                                            |                             |                                                  | **For test statement with if command** | **For [ expr ] statement with if command** |
| -eq                                        | is equal to                 | 5 == 6                                           | if test 5 -eq 6                        | if [ 5 -eq 6 ]                             |
| -ne                                        | is not equal to             | 5 != 6                                           | if test 5 -ne 6                        | if [ 5 -ne 6 ]                             |
| -lt                                        | is less than                | 5 < 6                                            | if test 5 -lt 6                        | if [ 5 -lt 6 ]                             |
| -le                                        | is less than or equal to    | 5 <= 6                                           | if test 5 -le 6                        | if [ 5 -le 6 ]                             |
| -gt                                        | is greater than             | 5 > 6                                            | if test 5 -gt 6                        | if [ 5 -gt 6 ]                             |
| -ge                                        | is greater than or equal to | 5 >= 6                                           | if test 5 -ge 6                        | if [ 5 -ge 6 ]                             |



**NOTE:** == is equal, != is not equal.

**For string Comparisons use**

| **Operator**       | **Meaning**                        |
| ------------------ | ---------------------------------- |
| string1 = string2  | string1 is equal to string2        |
| string1 != string2 | string1 is NOT equal to string2    |
| string1            | string1 is NOT NULL or not defined |
| -n string1         | string1 is NOT NULL and does exist |
| -z string1         | string1 is NULL and does exist     |

**Shell also test for file and directory types**

| **Test** | **Meaning**                                      |
| -------- | ------------------------------------------------ |
| -s file  | Non empty file                                   |
| -f file  | Is File exist or normal file and not a directory |
| -d dir   | Is Directory exist and not a file                |
| -w file  | Is writeable file                                |
| -r file  | Is read-only file                                |
| -x file  | Is file is executable                            |

**Logical Operators**

Logical operators are used to combine two or more condition at a time

| **Operator**                 | **Meaning** |
| ---------------------------- | ----------- |
| ! expression                 | Logical NOT |
| expression1  -a  expression2 | Logical AND |
| expression1  -o  expression2 | Logical OR  |

# if...else...fi

If given condition is true then command1 is executed otherwise command2 is executed.
*Syntax:*

```
           if condition
           then
                       condition is zero (true - 0)
                       execute all commands up to else statement

           else
                       if condition is not true then
                       execute all commands up to fi
           fi
```

For e.g. Write Script as follows:

```
`$ vi isnump_n#!/bin/sh## Script to see whether argument is positive or negative#if [ $# -eq 0 ]thenecho "$0 : You must give/supply one integers"exit 1fi` `if test $1 -gt 0thenecho "$1 number is positive"elseecho "$1 number is negative"fi`
```

Try it as follows:
**\$ chmod 755 isnump_n​**

**$ isnump_n 5**
*5 number is positive*

**$ isnump_n -45** 
*-45 number is negative*

**$ isnump_n**
*./ispos_n : You must give/supply one integers*
**$ isnump_n 0**
*0 number is negative*



***Detailed explanation***
First script checks whether command line argument is given or not, if not given then it print error message as "*./ispos_n : You must give/supply one integers*". if statement checks whether number of argument (\$#) passed to script is not equal (-eq) to 0, if we passed any argument to script then this if statement is false and if no command line argument is given then this if statement is true. The echo command i.e.
echo "​$0 : You must give/supply one integers"
         |              |
         |              |
         1              2
1 will print Name of script
2 will print this error message
And finally statement exit 1 causes normal program termination with exit status 1 (nonzero means script is not successfully run).

The last sample run **$ isnump_n 0** , gives output as "*0 number is negative*", because given argument is not > 0, hence condition is false and it's taken as negative number. To avoid this replace second if statement with **if test $1 -ge 0**.

# ![img](http://www.freeos.com/guides/lsst/images/bulb.gif)Nested if-else-fi

You can write the entire if-else construct within either the body of the if statement of the body of an else statement. This is called the nesting of ifs.

```
`$ vi nestedif.shosch=0echo "1. Unix (Sun Os)"echo "2. Linux (Red Hat)"echo -n "Select your os choice [1 or 2]? "read oschif [ $osch -eq 1 ] ; then     echo "You Pick up Unix (Sun Os)"else #### nested if i.e. if within if ######                   if [ $osch -eq 2 ] ; then             echo "You Pick up Linux (Red Hat)"       else             echo "What you don't like Unix/Linux OS."       fifi`
```

Run the above shell script as follows:
**$ chmod +x nestedif.sh**

**$ ./nestedif.sh**
*1. Unix (Sun Os)*

*2. Linux (Red Hat)*

*Select you os choice [1 or 2]? **1***

*You Pick up Unix (Sun Os)*

**$ ./nestedif.sh**
*1. Unix (Sun Os)*

*2. Linux (Red Hat)*

*Select you os choice [1 or 2]? **2***

*You Pick up Linux (Red Hat)*

**$ ./nestedif.sh**
*1. Unix (Sun Os)*

*2. Linux (Red Hat)Select you os choice [1 or 2]? **3***

*What you don't like Unix/Linux OS.*

Note that Second *if-else* constuct is nested in the first *else* statement. If the condition in the first *if* statement is false the the condition in the second *if* statement is checked. If it is false as well the final *else* statement is executed.

You can use the nested *if*s as follows also:
*Syntax:*

```
	if condition
	then
		if condition
		then
			.....
			..
			do this
		else
			....
			..
			do this
		fi
	else
		...
		.....
		do this
	fi
```

# Multilevel if-then-else

Syntax:

```
           if condition
           then
                       condition is zero (true - 0)
                       execute all commands up to elif statement
           elif condition1 
           then
                       condition1 is zero (true - 0)
                       execute all commands up to elif statement  
           elif condition2
           then
                       condition2 is zero (true - 0)
                       execute all commands up to elif statement          
           else
                       None of the above condtion,condtion1,condtion2 are true (i.e. 
                       all of the above nonzero or false)
                       execute all commands up to fi
           fi
```

For multilevel if-then-else statement try the following script:

```
`$ cat > elf##!/bin/sh# Script to test if..elif...else#if [ $1 -gt 0 ]; then  echo "$1 is positive"elif [ $1 -lt 0 ]then  echo "$1 is negative"elif [ $1 -eq 0 ]then  echo "$1 is zero"else  echo "Opps! $1 is not number, give number"fi`
```

Try above script as follows:
**$ chmod 755 elf$ ./elf 1$ ./elf -2$ ./elf 0$ ./elf a**Here o/p for last sample run:
./elf: [: -gt: unary operator expected
./elf: [: -lt: unary operator expected
./elf: [: -eq: unary operator expected
Opps! a is not number, give number
Above program gives error for last run, here integer comparison is expected therefore error like "*./elf: [: -gt: unary operator expected*" occurs, but still our program notify this error to user by providing message "*Opps! a is not number, give number*".

# Loops in Shell Scripts

Loop defined as:
"*Computer can repeat particular instruction again and again, until particular condition satisfies. A group of instruction that is executed repeatedly is called a loop.*"

Bash supports:

- for loop
- while loop

**Note** that in each and every loop,

(a) First, the variable used in loop condition must be initialized, then execution of the loop begins.

(b) A test (condition) is made at the beginning of each iteration.

(c) The body of loop ends with a statement that modifies the value of the test (condition) variable.

# for Loop

Syntax:

```
            for { variable name } in { list }
            do
                     execute one for each item in the list until the list is
                     not finished (And repeat all statement between do and done)
            done
```

Before try to understand above syntax try the following script:

```
`$ cat > testforfor i in 1 2 3 4 5doecho "Welcome $i times"done`
```

Run it above script as follows:
**$ chmod +x testfor$ ./testfor**
The for loop first creates i variable and assigned a number to i from the list of number from 1 to 5, The shell execute echo statement for each assignment of i. (This is usually know as iteration) This process will continue until all the items in the list were not finished, because of this it will repeat 5 echo statements. To make you idea more clear try following script:

```
`$ cat > mtable#!/bin/sh##Script to test for loop##if [ $# -eq 0 ]thenecho "Error - Number missing form command line argument"echo "Syntax : $0 number"echo "Use to print multiplication table for given number"exit 1fin=$1for i in 1 2 3 4 5 6 7 8 9 10doecho "$n * $i = `expr $i \* $n`"done`
```

Save above script and run it as:
**\$ chmod 755 mtable​**

**\$ ./mtable 7**

**$ ./mtable**

For first run, above script print multiplication table of given number where i = 1,2 ... 10 is multiply by given n (here command line argument 7) in order to produce multiplication table as
7 * 1 = 7
7 * 2 = 14
...
..
7 * 10 = 70
And for second test run, it will print message -
**Error - Number missing form command line argument**

**Syntax : ./mtable number**

**Use to print multiplication table for given number**

This happened because we have not supplied given number for which we want multiplication table, Hence script is showing Error message, Syntax and usage of our script. This is good idea if our program takes some argument, let the user know what is use of the script and how to used the script.
**Note** that to terminate our script we used 'exit 1' command which takes 1 as argument (1 indicates error and therefore script is terminated)

Even you can use following syntax:

*Syntax:*



```
         for (( expr1; expr2; expr3 ))
         do
               .....
			   ...
               repeat all statements between do and 
               done until expr2 is TRUE
         Done
```

In above syntax BEFORE the first iteration, **expr1** is evaluated. This is usually used to initialize variables for the loop. 
All the statements between do and done is executed repeatedly UNTIL the value of ***expr2*** is TRUE.
AFTER each iteration of the loop, ***expr3*** is evaluated. This is usually use to increment a loop counter.

```
`$ cat > for2for ((  i = 0 ;  i <= 5;  i++  ))do  echo "Welcome $i times"done`
```

Run the above script as follows:
**$ chmod +x for2**

**$ ./for2**
*Welcome 0 times*

*Welcome 1 times*

*Welcome 2 times*

*Welcome 3 times*

*Welcome 4 times*

*Welcome 5 times*

In above example, first expression (i = 0), is used to set the value variable **i** to zero.
Second expression is condition i.e. all statements between do and done executed as long as expression 2 (i.e continue as long as the value of variable **i** is less than or equel to 5) is TRUE.
Last expression **i++** increments the value of **i** by 1 i.e. it's equivalent to i = i + 1 statement.

# ![img](http://www.freeos.com/guides/lsst/images/bulb.gif)Nesting of for Loop

As you see the [if statement can nested](http://www.freeos.com/guides/lsst/ch03sec03.html#nestedifelseif), similarly loop statement can be nested. You can nest the for loop. To understand the nesting of for loop see the following shell script.

```
`$ vi nestedfor.shfor (( i = 1; i <= 5; i++ ))      ### Outer for loop ###do    for (( j = 1 ; j <= 5; j++ )) ### Inner for loop ###    do          echo -n "$i "    done  echo "" #### print the new line ###done`
```

Run the above script as follows:
**$ chmod +x nestedfor.sh**

**$ ./nestefor.sh**
*1 1 1 1 1*

*2 2 2 2 2*

*3 3 3 3 3*

*4 4 4 4 4*

*5 5 5 5 5*

Here, for each value of **i** the inner loop is cycled through 5 times, with the varible **j** taking values from 1 to 5. The inner for loop terminates when the value of **j** exceeds 5, and the outer loop terminets when the value of **i** exceeds 5.

Following script is quite intresting, it prints the chess board on screen.

```
`$ vi chessboardfor (( i = 1; i <= 9; i++ )) ### Outer for loop ###do   for (( j = 1 ; j <= 9; j++ )) ### Inner for loop ###   do        tot=`expr $i + $j`        tmp=`expr $tot % 2`        if [ $tmp -eq 0 ]; then            echo -e -n "\033[47m "        else            echo -e -n "\033[40m "        fi  done echo -e -n "\033[40m" #### set back background colour to black echo "" #### print the new line ###done`
```

Run the above script as follows:
**$ chmod +x chessboard**

**$ ./chessboard**

On my terminal above script produec the output as follows:

![chessboard shell script output i.e. chess board ](http://www.freeos.com/guides/lsst/images/chessboard-output.jpg)

Above shell script cab be explained as follows:

| **Command(s)/Statements**                                    | **Explanation**                                              |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| for (( i = 1; i <= 9; i++ ))<br/>do                          | Begin the outer loop which runs 9 times., and the outer loop terminets when the value of **i** exceeds 9 |
| for (( j = 1 ; j <= 9; j++ ))<br/>do                         | Begins the inner loop, for each value of **i** the inner loop is cycled through 9 times, with the varible **j** taking values from 1 to 9. The inner for loop terminates when the value of **j** exceeds 9. |
| tot=`expr $i + $j` tmp=`expr $tot % 2`                       | See for even and odd number positions using these statements. |
| if [ $tmp -eq 0 ]; then<br/>    echo -e -n "\033[47m "
else
    echo -e -n "\033[40m "
fi | If even number posiotion print the white colour block (using **echo -e -n "\033[47m "** statement); otherwise for odd postion print the black colour box (using **echo -e -n "\033[40m "** statement). This statements are responsible to print entier chess board on screen with alternet colours. |
| done                                                         | End of inner loop                                            |
| echo -e -n "\033[40m"                                        | Make sure its black background as we always have on our terminals. |
| echo ""                                                      | Print the blank line                                         |
| done                                                         | End of outer loop and shell scripts get terminted by printing the chess board. |

**Exercise**
Try to understand the [shell scripts (for loops) shown in exercise chapter](http://www.freeos.com/guides/lsst/ch08.html#q20).

# while loop

*Syntax:*

```
           while [ condition ]
           do
                 command1
                 command2
                 command3
                 ..
                 ....
            done
```

Loop is executed as long as given condition is true. For e.g.. [Above for loop program](http://www.freeos.com/guides/lsst/ch03sec06.html#forloopprog) (shown in last section of for loop) can be written using while loop as:

```
`$cat > nt1#!/bin/sh##Script to test while statement##if [ $# -eq 0 ]then   echo "Error - Number missing form command line argument"   echo "Syntax : $0 number"   echo " Use to print multiplication table for given number"exit 1fin=$1i=1while [ $i -le 10 ]do  echo "$n * $i = `expr $i \* $n`"  i=`expr $i + 1`done`
```

Save it and try as
**$ chmod 755 nt1**

**$./nt1 7**

Above loop can be explained as follows:

| n=$1                                 | Set the value of command line argument to variable n. (Here it's set to 7 ) |
| ------------------------------------ | ------------------------------------------------------------ |
| i=1                                  | Set variable i to 1                                          |
| while [ $i -le 10 ]                  | This is our loop condition, here if value of i is less than 10 then, shell execute all statements between do and done |
| do                                   | Start loop                                                   |
| echo "$n  *  $i = `expr $i  \*  $n`" | Print multiplication table as 7 * 1 = 7 7 * 2 = 14 .... 7 * 10 = 70, Here each time value of variable n is multiply be i. |
| i=`expr $i + 1`                      | Increment i by 1 and store result to i.  ( i.e. i=i+1) **Caution:** If you ignore (remove) this statement  than our loop become infinite loop because value of variable i always remain less than 10 and program will only output 7 * 1 = 7 ... ... E (infinite times) |
| done                                 | Loop stops here if i is not less than 10 i.e. condition of loop is not true. Hence loop is terminated. |

# The case Statement

The case statement is good alternative to Multilevel if-then-else-fi statement. It enable you to match several values against one variable. Its easier to read and write.

Syntax:

```
           case  $variable-name  in
                pattern1)   command
                                ...
                                ..
                                command;;
                pattern2)   command
                                ...
                                ..
                                command;;
                patternN)   command
                                ...
                                ..
                                command;;
                *)             command
                                ...
                                ..
                                command;;
           esac
```

The *$variable-name* is compared against the patterns until a match is found. The shell then executes all the statements up to the two semicolons that are next to each other. The default is *) and its executed if no match is found. For e.g. write script as follows:

```
`$ cat > car## if no vehicle name is given# i.e. -z $1 is defined and it is NULL## if no command line arg``if [ -z $1 ]then  rental="*** Unknown vehicle ***"elif [ -n $1 ]then# otherwise make first arg as rental  rental=$1fi``case $rental in   "car") echo "For $rental Rs.20 per k/m";;   "van") echo "For $rental Rs.10 per k/m";;   "jeep") echo "For $rental Rs.5 per k/m";;   "bicycle") echo "For $rental 20 paisa per k/m";;   *) echo "Sorry, I can not gat a $rental for you";;esac`
```

Save it by pressing CTRL+D and run it as follows:

**$ chmod +x car**

**$ car van**

**$ car car**

**$ car Maruti-800**

First script will check, that if \$1(first command line argument) is given or not, if NOT given set value of rental variable to "*** Unknown vehicle ***",if command line arg is supplied/given set value of rental variable to given value (command line arg). The $rental is compared against the patterns until a match is found.
For first test run its match with van and it will show output "*For van Rs.10 per k/m.*"
For second test run it print, "*For car Rs.20 per k/m*".
And for last run, there is no match for Maruti-800, hence default i.e. *) is executed and it prints, "*Sorry, I can not gat a Maruti-800 for you*".
**Note** that esac is always required to indicate end of case statement.

See the one more [example of case](http://www.freeos.com/guides/lsst/ch04sec14.html#onemorexampleofcase) statement in chapter 4 of section shift command.

# How to de-bug the shell script?

While programming shell sometimes you need to find the errors (bugs) in shell script and correct the errors (remove errors - debug). For this purpose you can use -v and -x option with sh or bash command to debug the shell script. General syntax is as follows:
*Syntax:*
sh   option   { shell-script-name }
**OR**
bash   option   { shell-script-name }
Option can be
**-v** Print shell input lines as they are read.
**-x** After expanding each simple-command, bash displays the expanded value of PS4 system variable, followed by the command and its expanded arguments.



*Example:*

```
$ cat > dsh1.sh
#
# Script to show debug of shell
#
tot=`expr $1 + $2`
echo $tot
```

Press ctrl + d to save, and run it as
$ chmod 755 dsh1.sh

$ ./dsh1.sh 4 5
9

$ sh -x dsh1.sh 4 5

```
#
# Script to show debug of shell
#
tot=`expr $1 + $2`
expr $1 + $2
++ expr 4 + 5
+ tot=9
echo $tot
+ echo 9
9
```

See the above output, -x shows the exact values of variables (or statements are shown on screen with values).

**$ sh -v dsh1.sh 4 5**

Use -v option to debug complex shell script.

