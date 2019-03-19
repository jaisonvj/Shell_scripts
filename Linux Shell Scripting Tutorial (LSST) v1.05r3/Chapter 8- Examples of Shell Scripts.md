**Linux Shell Scripting Tutorial (LSST) v1.05r3**

Chapter 8: Examples of Shell Scripts

# More examples of Shell Script (Exercise for You :-)

These exercises are to test your general understanding of the shell scripting. My advise is first try to write this shell script yourself so that you understand how to put the concepts to work in real life scripts. For sample answer to exercise you can refer the shell script file supplied with this tutorial. If you want to become the good programmer then your first habit must be to see the good code/samples of programming language then practice lot and finally implement the your own code (and become the good programmer!!!).

Q.1. How to write shell script that will add two nos, which are supplied as command line argument, and if this two nos are not given show error and its usage
Answer: [See Q1 shell Script](http://www.freeos.com/guides/lsst/scripts/q1).

Q.2.Write Script to find out biggest number from given three nos. Nos are supplies as command line argument. Print error if sufficient arguments are not supplied.
Answer: [See Q2 shell Script.](http://www.freeos.com/guides/lsst/scripts/q2)

Q.3.Write script to print nos as 5,4,3,2,1 using while loop.
Answer: [See Q3 shell Script.](http://www.freeos.com/guides/lsst/scripts/q3)

Q.4. Write Script, using case statement to perform basic math operation as
follows
\+ addition
\- subtraction
x multiplication
/ division
The name of script must be 'q4' which works as follows
$ ./q4 20 / 3, Also check for sufficient command line arguments
Answer: [See Q4 shell Script.](http://www.freeos.com/guides/lsst/scripts/q4)

Q.5.Write Script to see current date, time, username, and current directory
Answer: [See Q5 shell Script.](http://www.freeos.com/guides/lsst/scripts/q5)

Q.6.Write script to print given number in reverse order, for eg. If no is 123 it must print as 321.
Answer: [See Q6 shell Script.](http://www.freeos.com/guides/lsst/scripts/q6)

Q.7.Write script to print given numbers sum of all digit, For eg. If no is 123 it's sum of all digit will be 1+2+3 = 6.
Answer: [See Q7 shell Script.](http://www.freeos.com/guides/lsst/scripts/q7)

Q.8.How to perform real number (number with decimal point) calculation in Linux
Answer: Use Linux's bc command

Q.9.How to calculate 5.12 + 2.5 real number calculation at $ prompt in Shell ?
Answer: Use command as , $ echo 5.12 + 2.5 | bc , here we are giving echo commands output to bc to calculate the 5.12 + 2.5

Q.10.How to perform real number calculation in shell script and store result to
third variable , lets say a=5.66, b=8.67, c=a+b?
Answer: [See Q10 shell Script.](http://www.freeos.com/guides/lsst/scripts/q10)

Q.11.Write script to determine whether given file exist or not, file name is supplied as command line argument, also check for sufficient number of command line argument
Answer: [See Q11 shell Script.](http://www.freeos.com/guides/lsst/scripts/q11)

Q.12.Write script to determine whether given command line argument ($1) contains "*" symbol or not, if $1 does not contains "*" symbol add it to $1, otherwise show message "Symbol is not required". For e.g. If we called this script Q12 then after giving ,
**$ Q12 /bin**
Here $1 is /bin, it should check whether "*" symbol is present or not if not it should print Required i.e. /bin/*, and if symbol present then Symbol is not required must be printed. Test your script as
$ Q12 /bin
$ Q12 /bin/*
Answer: [See Q12 shell Script](http://www.freeos.com/guides/lsst/scripts/q12)

Q.13. Write script to print contains of file from given line number to next given number of lines. For e.g. If we called this script as Q13 and run as
$ Q13 5 5 myf , Here print contains of 'myf' file from line number 5 to next 5 line of that file.
Answer: [See Q13 shell Script](http://www.freeos.com/guides/lsst/scripts/q13)

Q.14. Write script to implement getopts statement, your script should understand following command line argument called this script Q14,
Q14 -c -d -m -e
Where options work as
-c clear the screen
-d show list of files in current working directory
-m start mc (midnight commander shell) , if installed
-e { editor } start this { editor } if installed
Answer: [See Q14 shell Script](http://www.freeos.com/guides/lsst/scripts/q14)

Q.15. Write script called sayHello, put this script into your startup file called .bash_profile, the script should run as soon as you logon to system, and it print any one of the following message in infobox using dialog utility, if installed in your system, If dialog utility is not installed then use echo statement to print message : -
Good Morning
Good Afternoon
Good Evening , according to system time.
Answer: [See Q15 shell Script](http://www.freeos.com/guides/lsst/scripts/q15)

Q.16. How to write script, that will print, Message "Hello World" , in Bold and Blink effect, and in different colors like red, brown etc using echo command.
Answer: [See Q16 shell Script](http://www.freeos.com/guides/lsst/scripts/q16)

Q.17. Write script to implement background process that will continually print current time in upper right corner of the screen , while user can do his/her normal job at $ prompt.
Answer: [See Q17 shell Script.](http://www.freeos.com/guides/lsst/scripts/q17)

Q.18. Write shell script to implement menus using dialog utility. Menu-items and action according to select menu-item is as follows:

| **Menu-Item** | **Purpose**               | **Action for Menu-Item**                                     |
| ------------- | ------------------------- | ------------------------------------------------------------ |
| Date/time     | To see current date time  | Date and time must be shown using infobox of dialog utility  |
| Calendar      | To see current calendar   | Calendar must be shown using infobox of dialog utility       |
| Delete        | To delete selected file   | First ask user name of directory where all files are present, if no name of directory given assumes current directory, then show all files only of that directory, Files must be shown on screen using menus of dialog utility, let the user select the file, then ask the confirmation to user whether he/she wants to delete selected file, if answer is yes then delete the file , report  errors if any while deleting file to user. |
| Exit          | To Exit this shell script | Exit/Stops the menu driven program i.e. this script          |

Note: Create function for all action for e.g. To show date/time on screen create function show_datetime().
Answer: [See Q18 shell Script.](http://www.freeos.com/guides/lsst/scripts/q18)

Q.19. Write shell script to show various system configuration like
1) Currently logged user and his logname
2) Your current shell
3) Your home directory
4) Your operating system type
5) Your current path setting
6) Your current working directory
7) Show Currently logged number of users
8) About your os and version ,release number , kernel version
9) Show all available shells
10) Show mouse settings
11) Show computer cpu information like processor type, speed etc
12) Show memory information
13) Show hard disk information like size of hard-disk, cache memory, model etc
14) File system (Mounted)
Answer: [See Q19 shell Script.](http://www.freeos.com/guides/lsst/scripts/q19)

Q.20.Write shell script using for loop to print the following patterns on screen

| **for2**                                                     | **for3**                                                     | **for4**                                                     |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![Using for loop create this pattern](http://www.freeos.com/guides/lsst/images/forloop/for2.jpg) | ![Using for loop create this pattern](http://www.freeos.com/guides/lsst/images/forloop/for3.jpg) | ![Using for loop create this pattern](http://www.freeos.com/guides/lsst/images/forloop/for4.jpg) |
| **for5**                                                     | **for6**                                                     | **for7**                                                     |
| ![Using for loop create this pattern](http://www.freeos.com/guides/lsst/images/forloop/for5.jpg) | ![Using for loop create this pattern](http://www.freeos.com/guides/lsst/images/forloop/for6.jpg) | [![Click to see complete image](http://www.freeos.com/guides/lsst/images/forloop/thumbs/for7_small.jpg)](http://www.freeos.com/guides/lsst/images/forloop/for7.jpg) |
| **for8**                                                     | **for8**                                                     | **for9**                                                     |
| [![Click to see complete image](http://www.freeos.com/guides/lsst/images/forloop/thumbs/for8_small.jpg)](http://www.freeos.com/guides/lsst/images/forloop/for8.jpg) | [![Click to see complete image](http://www.freeos.com/guides/lsst/images/forloop/thumbs/for8-b_small.jpg)](http://www.freeos.com/guides/lsst/images/forloop/for8-b.jpg) | [![Click to see complete image](http://www.freeos.com/guides/lsst/images/forloop/thumbs/for9_small.jpg)](http://www.freeos.com/guides/lsst/images/forloop/for9.jpg) |

Answer: Click on above the links to see the scripts.

Q.21.Write shell script to convert file names from UPPERCASE to lowercase file names or vice versa.
Answer: See the [rename.awk](http://www.freeos.com/guides/lsst/scripts/rename.awk) - awk script and [up2sh](http://www.freeos.com/guides/lsst/scripts/up2low) shell script.

