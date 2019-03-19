**Linux Shell Scripting Tutorial (LSST) v1.05r3**

Chapter 4: Advanced Shell Scripting Commands

# Introduction

After learning basis of shell scripting, its time to learn more advance features of shell scripting/command such as:

- Functions
- User interface
- Conditional execution
- File Descriptors
- traps
- Multiple command line args handling etc

# /dev/null - Use to send unwanted output of program

This is special Linux file which is used to send any unwanted output from program/command.

Syntax:

command > /dev/null

*Example:*
**$ ls > /dev/null**
Output of above command is not shown on screen its send to this special file. The /dev directory contains other device files. The files in this directory mostly represent peripheral devices such disks like floppy disk, sound card, line printers etc. See the [file system tutorial](http://www.freeos.com/guides/lsst/appa.html) for more information on Linux disk, partition and file system.

**Future Point:**
Run the following two commands

**$ ls > /dev/null**

**$ rm > /dev/null**

1) Why the output of last command is not redirected to /dev/null device?

# Local and Global Shell variable (export command)

Normally all our variables are local. Local variable can be used in same shell, if you load another copy of shell (by typing the **/bin/bash** at the \$ prompt) then new shell ignored all old shell's variable. For e.g. Consider following example
**$ vech=Bus**
**\$ echo $vech**
*Bus*
**\$ /bin/bash**

**​\$ echo $vech**

**NOTE**:-Empty line printed
**\$ vech=Car**

**​\$ echo $vech**
*Car*
**$ exit**

**\$ echo $vech**
*Bus*

| **Command**       | **Meaning**                                                  |
| ----------------- | ------------------------------------------------------------ |
| **$ vech=Bus**    | Create new local variable 'vech' with Bus as value in first shell |
| **\$ echo $vech** | Print the contains of variable vech                          |
| **$ /bin/bash**   | Now load second shell in memory (Which ignores all old shell's variable) |
| **\$ echo $vech** | Print the contains of variable vech                          |
| **$ vech=Car**    | Create new local variable 'vech' with Car as value in second shell |
| **\$ echo $vech** | Print the contains of variable vech                          |
| **$ exit**        | Exit from second shell return to first shell                 |
| **\$ echo $vech** | Print the contains of variable vech (Now you can see first shells variable and its value) |

Global shell defined as:
"*You can copy old shell's variable to new shell (i.e. first shells variable to seconds shell), such variable is know as Global Shell variable.*"

To set global varible you have to use export command.
*Syntax:* 
export variable1, variable2,.....variableN

*Examples:*
**\$ vech=Bus**

**​$ echo \$vech**

*Bus*

**\$ export vech**

**\$ /bin/bash**

**\$ echo $vech**

*Bus*
**$ exit**

**\$ echo $vech**
*Bus*

| **Command**       | **Meaning**                                                  |
| ----------------- | ------------------------------------------------------------ |
| **$ vech=Bus**    | Create new local variable 'vech' with Bus as value in first shell |
| **\$ echo $vech** | Print the contains of variable vech                          |
| **$ export vech** | Export first shells variable to second shell i.e. global varible |
| **$ /bin/bash**   | Now load second shell in memory (Old shell's variable is accessed from second shell, *if they are exported* ) |
| **\$ echo $vech** | Print the contains of variable vech                          |
| **$ exit**        | Exit from second shell return to first shell                 |
| **\$ echo $vech** | Print the contains of variable vech                          |

# Conditional execution i.e. && and ||

The control operators are && (read as AND) and || (read as OR). The syntax for AND list is as follows

Syntax: 

command1 && command2

command2 is executed if, and only if, command1 returns an exit status of zero.

The syntax for OR list as follows
*Syntax:*
command1 || command2
command2 is executed if and only if command1 returns a non-zero exit status.

You can use both as follows
*Syntax:*
command1 && comamnd2 if exist status is zero || command3 if exit status is non-zero
if command1 is executed successfully then shell will run command2 and if command1 is not successful then command3 is executed.

*Example:*
**$ rm myf && echo "File is removed successfully" || echo "File is not removed"**

If file (myf) is removed successful (exist status is zero) then "*echo File is removed successfully*" statement is executed, otherwise "*echo File is not removed*" statement is executed (since exist status is non-zero)

# I/O Redirection and file descriptors

As you know I/O redirectors are used to send output of command to file or to read input from file. Consider following example

$ cat > myf
This is my file
^D

 (press CTRL + D to save file)

Above command send output of cat command to myf file

$ cal

Above command prints calendar on screen, but if you wish to store this calendar to file then give command

$ cal > mycal

The cal command send output to mycal file. This is called 

output redirection.

$ sort
10
-20
11
2

^D

-20
2
10
11

sort command takes input from keyboard and then sorts the number and prints (send) output to screen itself. If you wish to take input from file (for sort command) give command as follows:

$ cat > nos
10
-20
11
2

^D

$ sort < nos
-20
2
10
11

First you created the file *nos* using cat command, then *nos* file given as input to *sort* command which prints sorted numbers. This is called *input redirection*.

| **Standard File** | **File Descriptors number** | **Use**            | **Example** |
| ----------------- | --------------------------- | ------------------ | ----------- |
| stdin             | 0                           | as Standard input  | Keyboard    |
| stdout            | 1                           | as Standard output | Screen      |
| stderr            | 2                           | as Standard error  | Screen      |

By default in Linux every program has three files associated with it, (when we start our program these three files are automatically opened by your shell). The use of first two files (i.e. stdin and stdout) , are already seen by us. The last file stderr (numbered as 2) is used by our program to print error on screen. You can redirect the output from a file descriptor directly to file with following syntax
*Syntax:* 
file-descriptor-number>filename

*Examples:* (Assemums the file **bad_file_name111** does not exists)
**$ rm bad_file_name111**
*rm: cannot remove `bad_file_name111': No such file or directory*Above command gives error as output, since you don't have file. Now if we try to redirect this error-output to file, it can not be send (redirect) to file, try as follows:
**$ rm bad_file_name111 > er**
Still it prints output on stderr as *rm: cannot remove `bad_file_name111': No such file or directory*, And if you see er file as **$ cat er** , this file is empty, since output is send to error device and you can not redirect it to copy this error-output to your file '*er*'. To overcome this problem you have to use following command:
**$ rm bad_file_name111 2>er**
**Note** that no space are allowed between *2* and *>*, The *2>er* directs the standard error output to file. 2 number is default number (file descriptors number) of stderr file. To clear your idea onsider another example by writing shell script as follows:

```
`$ cat > demoscrif [ $# -ne 2 ]then   echo "Error : Number are not supplied"   echo "Usage : $0 number1 number2"   exit 1fians=`expr $1 + $2`echo "Sum is $ans"`
```

Run it as follows:
**$ chmod 755 demoscr**

**$ ./demoscr** 
*Error : Number are not suppliedUsage : ./demoscr number1 number2*
**$ ./demoscr > er1**

**$ ./demoscr 5 7**
*Sum is 12*

For first sample run , our script prints error message indicating that you have not given two number.

For second sample run, you have redirect output of script to file er1, since it's error we have to show it to user, It means we have to print our error message on stderr not on stdout. To overcome this problem replace above echo statements as follows
**echo "Error : Number are not supplied" 1>&2**
***echo "Usage : $0 number1 number2" 1>&2***
Now if you run it as follows:
**$ ./demoscr > er1**
*Error : Number are not suppliedUsage : ./demoscr number1 number2*

It will print error message on stderr and not on stdout. The **1>&2** at the end of echo statement, directs the standard output (stdout) to standard error (stderr) device.
*Syntax:*
from>&destination

# Functions

Humans are intelligent animals. They work together to perform all of life's task, in fact most of us depend upon each other. For e.g. you rely on milkman to supply milk, or teacher to learn new technology (if computer teacher). What all this mean is you can't perform all of life's task alone. You need somebody to help you to solve specific task/problem.

The above logic also applies to computer program (shell script). When program gets complex we need to use divide and conquer technique. It means whenever programs gets complicated, we divide it into small chunks/entities which is know as *function*.

Function is series of instruction/commands. Function performs particular activity in shell i.e. it had specific work to do or simply say task. To define function use following syntax:
*Syntax:*

```
           function-name ( )
           {
                command1
                command2
                .....
                ...
                commandN
                return
           }
```

Where function-name is name of you function, that executes series of commands. A return statement will terminate the function. *Example:*
Type SayHello() at $ prompt as follows

```
$ SayHello()
{
   echo "Hello $LOGNAME, Have nice computing"
   return
}
```

To execute this SayHello() function just type it name as follows:
**$ SayHello**
Hello vivek, Have nice computing.

This way you can call function. Note that after restarting your computer you will loss this SayHello() function, since its created for current session only. To overcome this problem and to add you own function to automat some of the day today life task, add your function to */etc/bashrc* file. To add function to this file you must logon as root. Following is the sample */etc/bashrc* file with *today()* function , which is used to print formatted date. First logon as root or if you already logon with your name (your login is not root), and want to move to root account, then you can type following command , when asked for password type root (administrators) password
**$ su -l**
*password:*
Open file **/etc/bashrc** using vi and goto the end of file (by pressing shift+G) and type the today() function:

```
`# vi /etc/bashrc# At the end of file add following in /etc/bashrc file## today() to print formatted date## To run this function type today at the $ prompt# Added by Vivek to show function in Linux#today(){echo This is a `date +"%A %d in %B of %Y (%r)"`return}`
```

Save the file and exit it, after all this modification your file may look like as follows (type command **cat /etc/bashrc**)

```
# cat /etc/bashrc 
# /etc/bashrc
# System wide functions and aliases
# Environment stuff goes in /etc/profile

# For some unknown reason bash refuses to inherit
# PS1 in some circumstances that I can't figure out.
# Putting PS1 here ensures that it gets loaded every time.

PS1="[\u@\h \W]\\$ "

#
# today() to print formatted date
#
# To run this function type today at the $ prompt
# Added by Vivek to show function in Linux
today()
{
echo This is a `date +"%A %d in %B of %Y (%r)"`
return
}
```

To run function first completely logout by typing exit at the \$ prompt (Or press CTRL + D, Note you may have to type exit (CTRL +D) twice if you login to root account by using su command) ,then login and type ​$ today , this way today() is available to all user in your system, If you want to add particular function to particular user then open .bashrc file in users home directory as follows:

```
# vi .bashrc
OR
# mcedit .bashrc
At the end of file add following in .bashrc file
SayBuy()
{
echo "Buy $LOGNAME ! Life never be the same, until you login again!"
echo "Press a key to logout. . ."
read
return
}
```

Save the file and exit it, after all this modification your file may look like as follows (type command **cat .bashrc**)

```
# cat .bashrc
# .bashrc
#
# User specific aliases and functions
# Source global definitions
if [ -f /etc/bashrc ]; then
. /etc/bashrc
fi

SayBuy()
{
echo "Buy $LOGNAME ! Life never be the same, until you login again!"
echo "Press a key to logout. . ."
read
return
}
```

To run function first logout by typing exit at the $ prompt (Or press CTRL + D ) ,then logon and type $ SayBuy , this way SayBuy() is available to only in your login and not to all user in system, Use .bashrc file in your home directory to add User specific aliases and functions only.

**Tip**: If you want to show some message or want to perform some action when you logout, Open file *.bash_logout* in your home directory and add your stuff here For e.g. When ever I logout, I want to show message Buy! Then open your *.bash_logout* file using text editor such as vi and add statement:
**echo "Buy $LOGNAME, Press a key. . ."**
**read**
Save and exit from the file. Then to test this logout from your system by pressing CTRL + D (or type exit) immediately you will see message "Buy xxxxx, Press a key. . .", after pressing key you will be logout and login prompt will be shown to you. :-)

## **Why to write function?**

- Saves lot of time.
- Avoids rewriting of same code again and again
- Program is easier to write.
- Program maintains is very easy.

![img](http://www.freeos.com/guides/lsst/images/bulb.gif) [Passing parameters to User define function](http://www.freeos.com/guides/lsst/advance01.html).

# Passing parameter to User define function

You can pass the parameter i.e. command line option to function as you passed to shell script. As you know you can define the function as follows:

function function-name( )
{
     statement1
     statement2
     statementN
}

And you can call this function (without command line option) within the shell script as follows:

function-name

You can pass the parameter to function i.e. command line option to function as follows:

function-name arg1 arg2 arg3 argN

To clear you idea lets write shell script:

```
`$ vi passfunction demo(){echo "All Arguments to function demo(): $*"echo "First argument $1"echo "Second argument $2"echo "Third argument $3"return}## Call the function#demo -f foo bar`
```

Run the above shell script as follows:
**$ chmod +x pass$ ./pass**
*All Arguments to function demo(): -f foo barFirst argument -fSecond argument fooThird argument bar*

As you can see the demo() function is define at the beginning of shell script. As you refer the command line args/option for shell script, same way you can refer the parameter for function. To pass the parameter to function we write it statement as follows in shell script:
**demo -f foo bar**This statement passes three parameter to function demo **-f**, **foo** and **bar**. All of these parameters are stored to \$1, ​\$2, and ​\$3 variable of function demo(). To clear your idea lets see one more example of parameter passing to function.

```
`$ vi pass1function cal(){n1=$1op=$2n2=$3ans=0if [ $# -eq 3 ]; then  ans=$(( $n1 $op $n2 ))  echo "$n1 $op $n2 = $ans"  return $anselse  echo "Function cal requires atleast three args"fi return}cal 5 + 10cal 10 - 2cal 10 / 2echo $?`
```

Run the above script as follows:
**$ chmod +x pass1​**

**\$ ./pass1**
*5 + 10 = 15*

*10 - 2 = 8*

*10 / 2 = 5*

*5*

Above script introduces some new concepts lets explore them step by step:

| **Command(s)/Statements**                                    | **Explanation**                                              |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| function cal() {                                             | Begins the function definition for our cal() function        |
| n1=$1 op=$2 n2=$3 ans=0                                      | Stores the parameter passed to our function cal(). So if we called cal() as **cal 5 + 10**. Then store the values as follows: n1=5 op=+ n2=10 and ans to zero value. |
| If [ \$# -eq 3 ]; then   ans=$(( $n1 ​$op $n2 ))   echo "​\$n1 \$op \$n2 = ​\$ans"   return ​\$ans | First see that sufficient parameter is passed or not. If sufficient parameter passed then do the calculation as per given operator on given two numbers. Then prints the calculation result using "*echo $n1 $op $n2 = $ans*" statement. ***return $ans*** statement is used to return the value of calculation. You can print this returned value using bashs built in variable **$?** |
| else echo "Function cal requires atleast three args" fi return } | If sufficent parameter not given then print the message "Function cal requires atleast three args" and terminate the function cal(). |
| cal 5 + 10 cal 10 - 2 cal 10 / 2                             | Call the function cal to do different calculations.          |
| echo $?                                                      | Use to retrieve and print the value returned by cal(). Even you can store this value to variable by simply writing statement **i=$?**. |

# User Interface and dialog utility-Part I

Good program/shell script must interact with users. You can accomplish this as follows:
(1) Use command line arguments (args) to script when you want interaction i.e. pass command line args to script as : **$ ./sutil.sh foo 4**, where *foo* & *4* are command line args passed to shell script *sutil.sh*.
(2) Use statement like *echo* and *read* to read input into variable from the prompt. For e.g. Write script as:

```
`$ cat > userinte## Script to demo echo and read command for user interaction#echo "Your good name please :"read naecho "Your age please :"read ageneyr=`expr $age + 1`echo "Hello $na, next year you will be $neyr yrs old."`
```

Save it and run as
**$ chmod 755 userinte**

**\$ ./userinte**

*Your good name please* :
Vivek
*Your age please :*
25
*Hello Vivek, next year you will be 26 yrs old.*

Even you can create menus to interact with user, first show menu option, then ask user to choose menu item, and take appropriate action according to selected menu item, this technique is show in following script:

```
`$ cat > menuui## Script to create simple menus and take action according to that selected# menu item#while : do    clear    echo "-------------------------------------"    echo " Main Menu "    echo "-------------------------------------"    echo "[1] Show Todays date/time"    echo "[2] Show files in current directory"    echo "[3] Show calendar"    echo "[4] Start editor to write letters"    echo "[5] Exit/Stop"    echo "======================="    echo -n "Enter your menu choice [1-5]: "    read yourch    case $yourch in      1) echo "Today is `date` , press a key. . ." ; read ;;      2) echo "Files in `pwd`" ; ls -l ; echo "Press a key. . ." ; read ;;      3) cal ; echo "Press a key. . ." ; read ;;      4) vi ;;      5) exit 0 ;;      *) echo "Opps!!! Please select choice 1,2,3,4, or 5";         echo "Press a key. . ." ; read ;; esacdone`
```

Above all statement explained in following table:

| **Statement**                                                | **Explanation**                                              |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| **while :**                                                  | Start infinite loop, this loop will only break if you select 5 ( i.e. Exit/Stop menu item) as your menu choice |
| **do**                                                       | Start loop                                                   |
| **clear**                                                    | Clear the screen, each and every time                        |
| **echo "-------------------------------------"  echo "                   Main Menu "echo "-------------------------------------"echo "[1] Show Todays date/time"  echo "[2] Show files in current directory"echo "[3] Show calendar"echo "[4] Start editor to write letters"echo "[5] Exit/Stop"echo "======================="** | Show menu on screen with menu items                          |
| **echo -n "Enter your menu choice [1-5]: "**                 | Ask user to enter menu item number                           |
| **read yourch**                                              | Read menu item number from user                              |
| **case $yourch in1) echo "Today is `date` , press a key. . ."  ; read ;;2) echo "Files in `pwd`" ;  ls -l  ;**      **echo    "Press a key. . ." ; read ;;3) cal ; echo "Press a key. . ." ; read ;;4) vi ;;5) exit 0 ;;\*) echo "Opps!!! Please select choice 1,2,3,4, or 5";     echo "Press a key. . ." ; read  ;;  esac** | Take appropriate action according to selected menu item, If menu item is not between 1 - 5, then show error and ask user to input number between 1-5 again |
| **done**                                                     | Stop loop , if menu item number is 5 ( i.e. Exit/Stop)       |

User interface usually includes, menus, different type of boxes like info box, message box, Input box etc. In Linux shell (i.e. bash) there is no built-in facility available to create such user interface, But there is one utility supplied with Red Hat Linux version 6.0 called dialog, which is used to create different type of boxes like info box, message box, menu box, Input box etc. Next section shows you how to use dialog utility.

# User Interface and dialog utility-Part II

Before programming using dialog utility you need to install the dialog utility, since dialog utility in not installed by default.

For Red Hat Linux 6.2 user install the dialog utility as follows (First insert Red Hat Linux 6.2 CD into CDROM drive)

```
# mount /mnt/cdrom
# cd /mnt/cdrom/RedHat/RPMS
# rpm -ivh dialog-0.6-16.i386.rpm
```

For Red Hat Linux 7.2 user install the dialog utility as follows (First insert Red Hat Linux 7.2 # 1 CD into CDROM drive)

```
# mount /mnt/cdrom
# cd /mnt/cdrom/RedHat/RPMS
# rpm -ivh dialog-0.9a-5.i386.rpm
```

After installation you can start to use dialog utility. Before understanding the syntax of dialog utility try the following script:

```
`$ cat > **dia1**dialog --title "Linux Dialog Utility Infobox" --backtitle "Linux Shell Script\Tutorial" --infobox "This is dialog box called infobox, which is used \to show some information on screen, Thanks to Savio Lam and\Stuart Herbert to give us this utility. Press any key. . . " 7 50 ; read`
```

Save the shell script and run it as:
**$ chmod +x** dia1**$ ./dia1**

![Dialog utility in action](http://www.freeos.com/guides/lsst/images/dia01.sh-output.jpg)

After executing this dialog statement you will see box on screen with titled as "Welcome to Linux Dialog Utility" and message "This is dialog....Press any key. . ." inside this box. The title of box is specified by --title option and infobox with --infobox "Message" with this option. Here 7 and 50 are height-of-box and width-of-box respectively. "Linux Shell Script Tutorial" is the backtitle of dialog show on upper left side of screen and below that line is drawn. Use dialog utility to Display dialog boxes from shell scripts.
*Syntax:*

```
        dialog --title {title} --backtitle {backtitle} {Box options}
        where Box options can be any one of following
        --yesno      {text}  {height} {width}
        --msgbox     {text}  {height} {width}
        --infobox    {text}  {height} {width}
        --inputbox   {text}  {height} {width} [{init}]
        --textbox    {file}  {height} {width}
        --menu       {text}  {height} {width} {menu} {height} {tag1} item1}...
```

# Message box (msgbox) using dialog utility

```
`$cat > **dia2**dialog --title "Linux Dialog Utility Msgbox" --backtitle "Linux Shell Script\Tutorial" --msgbox "This is dialog box called msgbox, which is used\to show some information on screen which has also Ok button, Thanks to Savio Lam\and Stuart Herbert to give us this utility. Press any key. . . " 9 50`
```

Save it and run as
**$ chmod +x dia2**

**$ ./dia2**

![Message box (msgbox) using dialog utility ](http://www.freeos.com/guides/lsst/images/dia2-output.jpg)

# yesno box using dialog utility

```
$ cat > dia3
dialog --title "Alert : Delete File" --backtitle "Linux Shell Script\
Tutorial" --yesno "\nDo you want to delete '/usr/letters/jobapplication'\
file" 7 60
sel=$?
case $sel in
   0) echo "User select to delete file";;
   1) echo "User select not to delete file";;
   255) echo "Canceled by user by pressing [ESC] key";;
esac
```

Save the script and run it as:
**$ chmod +x dia3**

**$ ./dia3**

![yesno box using dialog utility](http://www.freeos.com/guides/lsst/images/dia3-output.jpg)

Above script creates yesno type dialog box, which is used to ask some questions to the user , and answer to those question either yes or no. After asking question how do we know, whether user has press yes or no button ? The answer is exit status, if user press yes button exit status will be zero, if user press no button exit status will be one and if user press Escape key to cancel dialog box exit status will be one 255. That is what we have tested in our above shell script as

| **Statement**                                                | **Meaning**                                                  |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| **sel=$?**                                                   | Get exit status of dialog utility                            |
| **case $sel in    0) echo "You select to delete file";;   1) echo "You select not to delete file";;   255) echo "Canceled by you by pressing [Escape] key";;esac** | Now take action according to exit status of dialog utility, if exit status is 0 , delete file, if exit status is 1 do not delete file and if exit status is 255, means Escape key is pressed. |

# Input Box (inputbox) using dialog utility

```
`$ cat > **dia4**dialog --title "Inputbox - To take input from you" --backtitle "Linux Shell\Script Tutorial" --inputbox "Enter your name please" 8 60 2>/tmp/input.$$sel=$?na=`cat /tmp/input.$$`case $sel in  0) echo "Hello $na" ;;  1) echo "Cancel is Press" ;;  255) echo "[ESCAPE] key pressed" ;;esacrm -f /tmp/input.$$`
```

Run it as follows:
**$ chmod +x dia4**

**$ ./dia4**

![Input Box (inputbox) using dialog utility](http://www.freeos.com/guides/lsst/images/dia4-output.jpg)

Inputbox is used to take input from user, In this example we are taking Name of user as input. But where we are going to store inputted name, the answer is to redirect inputted name to file via statement *2>/tmp/input.$$* at the end of dialog command, which means send screen output to file called */tmp/input.$$*, letter we can retrieve this inputted name and store to variable as follows
*na=\`cat /tmp/input.$$`*.
For input box's exit status refer the following table:

| **Exit Status for Input box** | **Meaning**                      |
| ----------------------------- | -------------------------------- |
| 0                             | Command is successful            |
| 1                             | Cancel button is pressed by user |
| 255                           | Escape key is pressed by user    |

# User Interface using dialog Utility - Putting it all together

Its time to write script to create menus using dialog utility, following are menu items
Date/time
Calendar
Editor
and action for each menu-item is follows :

| **MENU-ITEM** | **ACTION**             |
| ------------- | ---------------------- |
| Date/time     | Show current date/time |
| Calendar      | Show calendar          |
| Editor        | Start vi Editor        |

```
`$ cat > **smenu**##How to create small menu using dialog#dialog --backtitle "Linux Shell Script Tutorial " --title "Main\Menu" --menu "Move using [UP] [DOWN],[Enter] to\Select" 15 50 3\Date/time "Shows Date and Time"\Calendar "To see calendar "\Editor "To start vi editor " 2>/tmp/menuitem.$$menuitem=`cat /tmp/menuitem.$$`opt=$?case $menuitem inDate/time) date;;Calendar) cal;;Editor) vi;;esac`
```

Save it and run as:

**$ chmod +x smenu**

**$ ./smenu**

![User Interface using dialog Utility - Putting it all together](http://www.freeos.com/guides/lsst/images/dia5-output.jpg)

--menu option is used of dialog utility to create menus, menu option take

| **--menu options**                              | **Meaning**                                                  |
| ----------------------------------------------- | ------------------------------------------------------------ |
| **"Move using [UP] [DOWN],[Enter] to  Select"** | This is text show before menu                                |
| **15**                                          | Height of box                                                |
| **50**                                          | Width of box                                                 |
| **3**                                           | Height of menu                                               |
| **Date/time    "Shows Date and Time"**          | First menu item called as *tag1* (i.e. **Date/time**) and description for menu item called as *item1* (i.e. **"Shows Date and Time")** |
| **Calendar      "To see calendar    "**         | First menu item called as *tag2* (i.e. **Calendar**) and description for menu item called as *item2* (i.e. **"To see calendar")** |
| **Editor           "To start vi editor "**      | First menu item called as *tag3* (i.e. **Editor**) and description for menu item called as *item3* (i.e.**"To start vi editor")** |
| **2>/tmp/menuitem.$$**                          | Send selected menu item (tag) to this temporary file         |

After creating menus, user selects menu-item by pressing the ENTER key, selected choice is redirected to temporary file, Next this menu-item is retrieved from temporary file and following case statement compare the menu-item and takes appropriate step according to selected menu item. As you see, dialog utility allows more powerful user interaction then the older read and echo statement. The only problem with dialog utility is it work slowly.

# trap command

Consider following script example:

```
`$ cat > testsignls -R /`
```

Save and run it as
**$ chmod +x testsign**

**$ ./testsign**

Now if you press ctrl + c , while running this script, script get terminated. The ctrl + c here work as signal, When such signal occurs its send to all process currently running in your system. Now consider following shell script:

```
`$ cat > testsign1## Why to trap signal, version 1#Take_input1(){ recno=0 clear echo "Appointment Note keeper Application for Linux" echo -n "Enter your database file name : " read filenameif [ ! -f $filename ]; then  echo "Sorry, $filename does not exit, Creating $filename database"  echo "Appointment Note keeper Application database file" > $filenamefiecho "Data entry start data: `date`" >/tmp/input0.$$## Set a infinite loop#while :do     echo -n "Appointment Title:"     read na     echo -n "time :"     read ti     echo -n "Any Remark :"     read remark     echo -n "Is data okay (y/n) ?"     read ansif [ $ans = y -o $ans = Y ]; then    recno=`expr $recno + 1`    echo "$recno. $na $ti $remark" >> /tmp/input0.$$fiecho -n "Add next appointment (y/n)?"read isnext if [ $isnext = n -o $isnext = N ]; then     cat /tmp/input0.$$ >> $filename     rm -f /tmp/input0.$$    return # terminate loop fidone}### Call our user define function : Take_input1#Take_input1`
```

Save it and run as
**$ chmod +x testsign1**

**$ ./testsign1**

It first ask you main database file where all appointment of the day is stored, if no such database file found, file is created, after that it open one temporary file in /tmp directory, and puts today's date in that file. Then one infinite loop begins, which ask appointment title, time and remark, if this information is correct its written to temporary file, After that, script asks user , whether he/she wants to add next appointment record, if yes then next record is added , otherwise all records are copied from temporary file to database file and then loop will be terminated. You can view your database file by using cat command. Now problem is that while running this script, if you press CTRL + C, your shell script gets terminated and temporary file are left in */tmp* directory. For e.g. try it as follows
**$./testsign1**
After given database file name and after adding at least one appointment record to temporary file press CTRL+C, Our script get terminated, and it left temporary file in /tmp directory, you can check this by giving command as follows
**$ ls /tmp/input\***
Our script needs to detect such signal (event) when occurs; To achieve this we have to first detect Signal using trap command.
*Syntax:* 
trap {commands} {signal number list}

| **Signal Number** | **When occurs**         |
| ----------------- | ----------------------- |
| 0                 | shell exit              |
| 1                 | hangup                  |
| 2                 | interrupt (CTRL+C)      |
| 3                 | quit                    |
| 9                 | kill (cannot be caught) |

To catch signal in above script, put trap statement before calling Take_input1 function as trap del_file 2 ., Here trap command called del_file() when 2 number interrupt ( i.e. CTRL+C ) occurs. Open above script in editor and modify it so that at the end it will look like as follows:

```
`$ vi testsign1## signal is trapped to delete temporary file , version 2#del_file(){  echo "* * * CTRL + C Trap Occurs (removing temporary file)* * *"  rm -f /tmp/input0.$$  exit 1}``Take_input1(){recno=0clearecho "Appointment Note keeper Application for Linux"echo -n "Enter your database file name : "read filenameif [ ! -f $filename ]; then  echo "Sorry, $filename does not exit, Creating $filename database"  echo "Appointment Note keeper Application database file" > $filenamefiecho "Data entry start data: `date`" >/tmp/input0.$$## Set a infinite loop#while :do  echo -n "Appointment Title:"  read na  echo -n "time :"  read ti  echo -n "Any Remark :"  read remark  echo -n "Is data okay (y/n) ?"  read ans  if [ $ans = y -o $ans = Y ]; then   recno=`expr $recno + 1`   echo "$recno. $na $ti $remark" >> /tmp/input0.$$  fi  echo -n "Add next appointment (y/n)?"  read isnext  if [ $isnext = n -o $isnext = N ]; then    cat /tmp/input0.$$ >> $filename    rm -f /tmp/input0.$$    return # terminate loop  fidone # end_while}## Set trap to for CTRL+C interrupt i.e. Install our error handler# When occurs it first it calls del_file() and then exit#trap del_file 2## Call our user define function : Take_input1#Take_input1`
```

Run the script as:
**$ ./testsign1**

After giving database file name and after giving appointment title press CTRL+C, Here we have already captured this CTRL + C signal (interrupt), so first our function del_file() is called, in which it gives message as "* * * CTRL + C Trap Occurs (removing temporary file)* * * " and then it remove our temporary file and then exit with exit status 1. Now check /tmp directory as follows
**$ ls /tmp/input\***
Now Shell will report no such temporary file exit.

# The shift Command

The shift command moves the current values stored in the positional parameters (command line args) to the left one position. For example, if the values of the current positional parameters are:

\$1 = -f \$2 = foo \$3 = bar
and you executed the shift command the resulting positional parameters would be as follows:

\$1 = foo ​\$2 = bar

For e.g. Write the following shell script to clear you idea:

```
`$ vi shiftdemo.shecho "Current command line args are: \$1=$1, \$2=$2, \$3=$3"shiftecho "After shift command the args are: \$1=$1, \$2=$2, \$3=$3"`
```

Excute above script as follows:

\$ chmod +x shiftdemo.sh
\$ ./shiftdemo -f foo bar
*Current command line args are: \$1=-f, ​\$2=foo, \$3=bar*

*After shift command the args are: \$1=foo, ​\$2=bar, \$3=*

You can also move the positional parameters over more than one place by specifying a number with the shift command. The following command would shift the positional parameters two places:

shift 2

# **But where to use shift command?**

You can use shift command to parse the command line (args) option. For example consider the following simple shell script:

```
`$ vi convertwhile [ "$1" ]do   if [ "$1" = "-b" ]; then        ob="$2"        case $ob in          16) basesystem="Hex";;           8) basesystem="Oct";;           2) basesystem="bin";;           *) basesystem="Unknown";;        esac       shift 2   elif [ "$1" = "-n" ]   then      num="$2"      shift 2   else      echo "Program $0 does not recognize option $1"      exit 1   fidoneoutput=`echo "obase=$ob;ibase=10; $num;" | bc`echo "$num Decimal number = $output in $basesystem number system(base=$ob)"`
```

Save and run the above shell script as follows:
**$ chmod +x convert**

**$ ./convert -b 16 -n 500**
500 Decimal number = 1F4 in Hex number system(base=16)
**$ ./convert -b 8 -n 500**
500 Decimal number = 764 in Oct number system(base=8)
**$ ./convert -b 2 -n 500**
500 Decimal number = 111110100 in bin number system(base=2)
**$ ./convert -b 2 -v 500**
Program ./convert does not recognize option -v
**$ ./convert -t 2 -v 500**
Program ./convert does not recognize option -t
\$ **./convert -b 4 -n 500**
500 Decimal number = 13310 in Unknown number system(base=4)
**\$ ./convert -n 500 -b 16** 
500 Decimal number = 1F4 in Hex number system(base=16)

Above script is run in variety of ways. First three sample run converts the number 500 ( -n 500 ) to respectively 1F4 (hexadecimal number i.e. -b 16), 764 (octal number i.e. -b 16) , 111110100 (binary number i.e. -b 16). It use **-n** and **-b**as command line option which means:
-b {base-system i.e. 16,8,2 to which *-n number* to convert}
-n {Number to convert to *-b base-system*}

Fourth and fifth sample run produce the error "*Program ./convert does not recognize option -v*". This is because these two (-v & -t) are not the valid command line option.

Sixth sample run produced output "*500 Decimal number = 13310 in Unknown number system(base=4)*". Because the base system 4 is unknown to our script.

Last sample run shows that command line options can given different ways i.e. you can use it as follows:
**$ ./convert -n 500 -b 16** 
Instead of
**$ ./convert -b 16 -n 500**

All the shell script command can be explained as follows:

| **Command(s)/Statements**                                    | **Explanation**                                              |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| while [ "$1" ] do                                            | Begins the while loop; continue the while loop as long as script reads the all command line option |
| if [ "\$1" = "-b" ]; then ob="​\$2"                           | Now start to parse the command line (args) option using if command our script understands the -b and -n options only all other option are invalid. If option is -b then stores the value of second command line arg to variable ob (i.e. if arg is -b 16 then store the 16 to ob) |
| case $ob in 16) basesystem="Hex";; 8) basesystem="Oct";; 2) basesystem="bin";; *) basesystem="Unknown";; esac | For easy understanding of conversion we store the respective number base systems corresponding string to basesystem variable. If base system is 16 then store the Hex to basesystem and so on. This is done using case statement. |
| shift 2                                                      | Once first two command line options (args) are read, we need next two command line option (args). shift 2 will moves the current values stored in the positional parameters (command line args) to the left two position. |
| elif [ "$1" = "-n" ] then num="$2" shift 2                   | Now check the next command line option and if its -n option then stores the value of second command line arg to variable num (i.e. if arg is -n 500 then store the 500 to num) and shift 2 will moves the current values stored in the positional parameters (command line args) to the left two position. |
| else echo "Program \$0 does not recognize option ​\$1" exit 1 fi | If command line option is not -n or -b then print the error "*Program ./convert does not recognize option xx*" on screen and terminates the shell script using *exit 1* statement. |
| done                                                         | End of loop as we read all the valid command line option/args. |
| output=`echo "obase=$ob;ibase=10; $num;" | BC` echo "\$num Decimal number = \$output in \$basesystem number system(base=$ob)" | Now convert the given number to given number system using BC Show the converted number on screen. |

As you can see shift command can use to parse the command line (args) option. This is useful if you have limited number of command line option. If command line options are too many then this approach works slowly as well as complex to write and maintained. You need to use another shell built in command - getopts. Next section shows the use of getopts command. You still need the shift command in conjunction with getopts and for other shell scripting work.

# getopts command

This command is used to check valid command line argument are passed to script. Usually used in while loop.
*Syntax:*
getopts {optsring} {variable1}

*getopts* is used by shell to parse command line argument.
As defined in man pages:
"*optstring* contains the option letters to be recognized; if a letter is followed by a colon, the option is expected to have an argument, which should be separated from it by white space. Each time it is invoked, getopts places the next option in the shell variable variable1, When an option requires an argument, getopts places that argument into the variable OPTARG. On errors getopts diagnostic messages are printed when illegal options or missing option arguments are encountered. If an illegal option is seen, getopts places ? into variable1."
*Examlpe:*
We have script called ani which has syntax as
ani -n -a -s -w -d
Options: These are optional argument
    -n name of animal
    -a age of animal
    -s sex of animal
    -w weight of animal
    -d demo values (if any of the above options are used their values are not taken)

Above ani script is as follows:

```
`$ vi ani## Usage: ani -n -a -s -w -d### help_ani() To print help#help_ani(){  echo "Usage: $0 -n -a -s -w -d"  echo "Options: These are optional argument"  echo " -n name of animal"  echo " -a age of animal"  echo " -s sex of animal "  echo " -w weight of animal"  echo " -d demo values (if any of the above options are used "  echo " their values are not taken)"  exit 1}##Start main procedure###Set default value for variable#isdef=0na=Motiage="2 Months" # may be 60 days, as U like it!sex=Maleweight=3Kg##if no argument#if [ $# -lt 1 ]; then  help_anifiwhile getopts n:a:s:w:d optdo  case "$opt" in    n) na="$OPTARG";;    a) age="$OPTARG";;    s) sex="$OPTARG";;    w) weight="$OPTARG";;    d) isdef=1;;    \?) help_ani;;  esacdoneif [ $isdef -eq 0 ]then  echo "Animal Name: $na, Age: $age, Sex: $sex, Weight: $weight (user define mode)"else  na="Pluto Dog"  age=3  sex=Male  weight=20kg  echo "Animal Name: $na, Age: $age, Sex: $sex, Weight: $weight (demo mode)"fi`
```

Save it and run as follows
**$ chmod +x ani$ ani -n Lassie -a 4 -s Female -w 20Kg$ ani -a 4 -s Female -n Lassie -w 20Kg$ ani -n Lassie -s Female -w 20Kg -a 4$ ani -w 20Kg -s Female -n Lassie -a 4$ ani -w 20Kg -s Female$ ani -n Lassie -a 4$ ani -n Lassie$ ani -a 2**

See because of getopts, we can pass command line argument in different style. Following are invalid options for ani script
**$ ani -nLassie -a4 -sFemal -w20Kg**
No space between option and their value.

**$ ani -nLassie-a4-sFemal-w20Kg$ ani -n Lassie -a 4 -s Female -w 20Kg -c Mammal**
-c is not one of the valid options.

# getopts command

This command is used to check valid command line argument are passed to script. Usually used in while loop.
*Syntax:*
getopts {optsring} {variable1}

*getopts* is used by shell to parse command line argument.
As defined in man pages:
"*optstring* contains the option letters to be recognized; if a letter is followed by a colon, the option is expected to have an argument, which should be separated from it by white space. Each time it is invoked, getopts places the next option in the shell variable variable1, When an option requires an argument, getopts places that argument into the variable OPTARG. On errors getopts diagnostic messages are printed when illegal options or missing option arguments are encountered. If an illegal option is seen, getopts places ? into variable1."
*Examlpe:*
We have script called ani which has syntax as
ani -n -a -s -w -d
Options: These are optional argument
    -n name of animal
    -a age of animal
    -s sex of animal
    -w weight of animal
    -d demo values (if any of the above options are used their values are not taken)

Above ani script is as follows:

```
`$ vi ani## Usage: ani -n -a -s -w -d### help_ani() To print help#help_ani(){  echo "Usage: $0 -n -a -s -w -d"  echo "Options: These are optional argument"  echo " -n name of animal"  echo " -a age of animal"  echo " -s sex of animal "  echo " -w weight of animal"  echo " -d demo values (if any of the above options are used "  echo " their values are not taken)"  exit 1}##Start main procedure###Set default value for variable#isdef=0na=Motiage="2 Months" # may be 60 days, as U like it!sex=Maleweight=3Kg##if no argument#if [ $# -lt 1 ]; then  help_anifiwhile getopts n:a:s:w:d optdo  case "$opt" in    n) na="$OPTARG";;    a) age="$OPTARG";;    s) sex="$OPTARG";;    w) weight="$OPTARG";;    d) isdef=1;;    \?) help_ani;;  esacdoneif [ $isdef -eq 0 ]then  echo "Animal Name: $na, Age: $age, Sex: $sex, Weight: $weight (user define mode)"else  na="Pluto Dog"  age=3  sex=Male  weight=20kg  echo "Animal Name: $na, Age: $age, Sex: $sex, Weight: $weight (demo mode)"fi`
```

Save it and run as follows
**\$ chmod +x ani**

**\$ ani -n Lassie -a 4 -s Female -w 20Kg**

**\$ ani -a 4 -s Female -n Lassie -w 20Kg**

**\$ ani -n Lassie -s Female -w 20Kg -a 4**

**\$ ani -w 20Kg -s Female -n Lassie -a 4**

**\$ ani -w 20Kg -s Female**

**\$ ani -n Lassie -a 4**

**\$ ani -n Lassie**

**\$ ani -a 2**

See because of getopts, we can pass command line argument in different style. Following are invalid options for ani script
**$ ani -nLassie -a4 -sFemal -w20Kg**
No space between option and their value.

**\$ ani -nLassie-a4-sFemal-w20Kg**

**\$ ani -n Lassie -a 4 -s Female -w 20Kg -c Mammal**
-c is not one of the valid options.