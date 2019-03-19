**Linux Shell Scripting Tutorial (LSST) v1.05r3**

Chapter 6: Learning expressions with ex

# Introduction

In the chpater 5, "Quick Tour of essential utilities", you have seen basic utilities. If you use them with other tools, these utilities are very useful for data processing or for other works. In rest part of tutorial we will learn more about patterns, filters, expressions, and off course sed and awk in depth.

## Learning expressions with ex

What does "*cat*" mean to you ?

One its the word cat, (second cat is an animal! I know 'tom' cat), If same question is asked to computer (not computer but to grep utility) then grep will try to find all occurrence of "cat" word (remember grep read word "cat" as the **c**letter followed by **a** and followed by **t**) including cat, copycat, catalog etc.

Pattern defined as:
"*Set of characters (may be words or not) is called pattern.*"
For e.g. "dog", "celeron", "mouse", "ship" etc are all example of pattern. Pattern can be change from one to another, for e.g. "ship" as "sheep".

Metacharacters defined as:
"*If patterns are identified using special characters then such special characters are know as metacharacters*".

expressions defined as:
"*Combination of pattern and metacharacters is know as expressions (regular expressions).*"
Regular expressions are used by different Linux utilities like

- grep
- awk
- sed

So you must know how to construct regular expression. In the next part of LSST you will learn how to construct regular expression using ex editor.

For this part of chapter/tutorial create '[demofile](http://www.freeos.com/guides/lsst/datafiles/demofile)' - text file using any text editor.

# Getting started with ex

You can start the ex editor by typeing ex at shell prompt:

Syntax: 

ex {file-name}

Example:

$ ex demofile

The **:** (colon) is ex prompt where you can type ex text editor command or regular expression. Its time to open our demofile, use ex as follows:
**$ ex demofile**
*"demofile" [noeol] 20L, 387C*

*Entering Ex mode. Type "visual" to go to Normal mode.*

*:*

As you can see, you will get **:** prompt, here you can type ex command, type **q** and press ENTER key to exit from ex as shown follows: (remember commands are case sensetive)
**: q**

*vivek@ls vivek]$*

After typing the **q** command you are exit to shell prompt.

# Printing text on-screen

First open the our demofile as follows:
**$ ex demofile**
*"demofile" [noeol] 20L, 387CEntering Ex mode. Type "visual" to go to Normal mode.*

Now type 'p' in front of : as follow and press enter
**:p**
*Okay! I will stop.*
*:*

**NOTE** By default p command will print current line, in our case its the last line of above text file.

### Printing lines using range

Now if you want to print 1st line to next 5 line (i.e. 1 to 5 lines) then give command
**:1,5 p**
*Hello World.*

*This is vivek from Poona.*



*I love linux.*

*It is different from all other Os*

**NOTE** Here 1,5 is the address. if single number is used (e.g. 5 p) it indicate line number and if two numbers are separated by comma its range of line.

### Printing particular line

To print 2nd line from our file give command
**:2 p**
*This is vivek from Poona.*

### Printing entire file on-screen

Give command
**:1,$ p**
*Hello World.*

*This is vivek from Poona.*



*I love linux.*

*It is different from all other Os*

*.............*

*Okay! I will stop.*

**NOTE** Here 1 is 1st line and $ is the special character of ex which mean last-line character. So 1,$ means print from 1st line to last-line character (i.e. end of file). Here p stands print.

### Printing line number with our text 

Give command
**:set number**
**:1,3 p**

*1 Hello World.*

*2 This is vivek from Poona.*

*3*

**NOTE** This command prints number next to each line. If you don't want number you can turn off numbers by issuing following command
**:set nonumber**
**:1,3 p**

Hello World.
This is vivek from Poona.



# Deleting lines

Give command

:1, d

I love linux.

**NOTE**
Here 1 is 1st line and d command indicates deletes (Which deletes the 1st line).

You can even delete range of line by giving command as
**:1,5 d**

# Coping lines

Give command as follows

:1,4 co $
:1,$ p

I love linux.



*It is different from all other Os*

*....*

*.....*

*. (DOT) is special command of linux.*



*Okay! I will stop.*



*I love linux.It is different from all other Os*



*My brother Vikrant also loves linux.*



**NOTE** Here 1,4 means copy 1 to 4 lines; co command stands for copy; \$ is end of file. So it mean copy first four line to end of file. You can delete this line as follows
**:18,21 d**
*Okay! I will stop.*
**:1,$ p**

*I love linux.*

*It is different from all other Os*

*My brother Vikrant also loves linux.*

*He currently lerarns linux.*

*Linux is cooool.*

*Linux is now 10 years old.*

*Next year linux will be 11 year old.*

*Rani my sister never uses Linux*

*She only loves to play games and nothing else.*

*Do you know?*

*. (DOT) is special command of linux.*

*Okay! I will stop.*

# Searching the words

(a) Give following command

:/linux/ p

I love linux.

**Note** In ex you can specify address (line) using number for various operation. This is useful if you know the line number in advance, but if you don't know line number, then you can use *contextual address* to print line on-screen. In above example */linux/* is *contextual address* which is constructed by surrounding a regular expression with two slashes. And p is print command of ex.
Try following and not down difference (Hint - Watch p is missing)
**:/Linux/**

(b)Give following command
**:g/linux/ p**

*I love linux.My brother Vikrant also loves linux.*

*He currently lerarns linux.Next year linux will be 11 year old.*

*. (DOT) is special command of linux.*

In previous example (:/linux/ p) only one line is printed. If you want to print all occurrence of the word "linux" then you have to use g, which mean global line address. This instruct ex to find all occurrence of pattern. Try following
**:1,$ /Linux/ p**

Which give the same result. It means g stands for 1,$.

### Saving the file in ex

Give command
**:w**
*"demofile" 20L, 386C written*

**w** command will save the file.

### Quitting the ex

Give command
**:q**

**q** command quits from ex and you are return to shell prompt.

**Note** use wq command to do save and exit from ex.

# Find and Replace (Substituting regular expression)

Give command as follows
**:8 p**
*He currently lerarns linux.*
**:8 s/lerarns/learn/**
**:p**
*He currently learn linux.*

**Note** Using above command, you are substituting the word "learn" for the word "lerarns".

Above command can be explained as follows:

| **Command**   | **Explanation**                                              |
| ------------- | ------------------------------------------------------------ |
| **8**         | Goto line 8, address of line.                                |
| **s**         | Substitute                                                   |
| **/lerarns/** | Target pattern                                               |
| **learn/**    | If target pattern found substitute the expression (i.e. **learn/** ) |

Considered the following command:
**:1,$ s/Linux/Unix/**
*Rani my sister never uses Unix*
**:1,$ p**

*Hello World.This is vivek from Poona............*

*. (DOT) is special command of linux.*

*Okay! I will stop.*

Using above command, you are substituting all lines i.e. **s** command will find all of the address line for the pattern "Linux" and if pattern "Linux" found substitute pattern "Unix".

| **Command** | **Explanation**                                              |
| ----------- | ------------------------------------------------------------ |
| **:1,$**    | Substitute for all line                                      |
| **s**       | Substitute                                                   |
| **/Linux/** | Target pattern                                               |
| **Unix/**   | If target pattern found substitute the expression (i.e. **Unix/** ) |

Even you can also use **contextual address** as follows
**:/sister/ p**
*Rani my sister never uses Unix*
**:g /sister/ s/never/always/:p**
*Rani my sister always uses Unix*

Above command will first find the line containing pattern "sister" if found then it will substitute the pattern "always" for the pattern "never" (It mean find the line containing the word sister, on that line find the word never and replace it with word always.)
Try the following and watch the output very carefully.
**:g /Unix/ s/Unix/Linux**
*3 substitutions on 3 lines*

Above command finds all line containing the regular expression "Unix", then substitute "Linux" for all occurrences of "Unix". Note that above command can be also written as follows
**:g /Unix/ s//Linux**

Here // is replace by the last pattern/regular expression i.e. Unix. Its shortcut. Now try the following
**:g /Linux/ s//UNIX/**
*3 substitutions on 3 lines*
**:g/Linux/p**
*Linux is cooool.Linux is now 10 years old.Rani my sister always uses Linux*

**:g /Linux/ s//UNIX/**
*3 substitutions on 3 lines*
**:g/UNIX/p**

*UNIX is cooool.UNIX is now 10 years old.Rani my sister always uses UNIX*

By default substitute command only substitute first occurrence of a pattern on a line. Let's take another example, give command
**:/brother/p**
*My brother Vikrant also loves linux who also loves unix.*

Now in above line "also" word is occurred twice, give the following substitute command
**:g/brother/ s/also/XYZ/**
**:/brother/p**
*My brother Vikrant XYZ loves linux who also loves unix.*

Make sure next time it works
**:g/brother/ s/XYZ/also/**

Note that "also" is only once substituted. If you want to **s** command to work with all occurrences of pattern within a address line give command as follows:
**:g/brother/ s/also/XYZ/g**
**:p**
*My brother Vikrant XYZ loves linux who XYZ loves unix.*

**:g/brother/ s/XYZ/also/g**
**:p**
*My brother Vikrant also loves linux who also loves unix.*

The **g** option at the end instruct **s** command to perform replacement on all occurrences of the target pattern within a address line.

# Replacing word with confirmation from user

Give command as follows

:g/Linux/ s//UNIX/gc

After giving this command ex will ask you question like - *replace with UNIX (y/n/a/q/^E/^Y)?*
Type **y** to replace the word or **n** to not replace or **a** to replace all occurrence of word.

# Finding words

Command like

:g/the/p

It is different from all other Os
My brother Vikrant also loves linux who also loves unix.

Will find word like theater, the, brother, other etc. What if you want to just find the word like "*the*" ? To find the word (Let's say Linux) you can give command like
**:/\<Linux\>**
*Linux is cooool.*
**:g/\<Linux\>/p**
*Linux is cooool.Linux is now 10 years old.Rani my sister never uses Linux*

The symbol **\<** and **\>** respectively match the empty string at the beginning and end of the word. To find the line which contain Linux pattern at the beginning give command
**:/^Linux**
*Linux is cooool.*

As you know **$** is end of line character, the **^** (caret) match beginning of line. To find all occurrence of pattern "*Linux*" at the beginning of line give command
**:g/^Linux**
*Linux is cooool.Linux is now 10 years old.*

And if you want to find "*Linux*" at the end of line then give command
**:/Linux $**
*Rani my sister never uses Linux*

Following command will find empty line:
**:/^$**

To find all blank line give command:
**:g/^$**

To view entire file without blank line you can use command as follows:
**:g/[^/^$]**
*Hello World.This is vivek from Poona.I love linux.It is different from all other OsMy brother Vikrant also loves linux who also loves unix.He currently learn linux.Linux is cooool.Linux is now 10 years old.Next year linux will be 11 year old.Rani my sister never uses LinuxShe only loves to play games and nothing else.Do you know?. (DOT) is special command of linux.Okay! I will stop.*

| **Command** | **Explanation**                     |
| ----------- | ----------------------------------- |
| **g**       | All occurrence                      |
| **/[^**     | **[^]** This means not              |
| **/^$**     | Empty line, Combination of ^ and $. |

To delete all blank line you can give command as follows
**:g/^$/d**
*Okay! I will stop.*
**:1,$ p**
*Hello World.This is vivek from Poona.I love linux.It is different from all other OsMy brother Vikrant also loves linux who also loves unix.He currently learn linux.Linux is cooool.Linux is now 10 years old.Next year linux will be 11 year old.Rani my sister never uses LinuxShe only loves to play games and nothing else.Do you know?. (DOT) is special command of linux.Okay! I will stop.*

Try u command to undo, to undo what you have done it, give it as follows:
**:u**
**:1,$ p**
*Hello World.This is vivek from Poona............Okay! I will stop.*

# Using range of characters in regular expressions

Try the following command
**:g/Linux/p**
*Linux is cooool.Linux is now 10 years old.Rani my sister never uses Linux*

This will find only "Linux" and not the "linux", to overcome this problem try as follows
**:g/[Ll]inux/p**
*I love linux.My brother Vikrant also loves linux who also loves unix.He currently learn linux.Linux is cooool.Linux is now 10 years old.Next year linux will be 11 year old.Rani my sister never uses Linux. (DOT) is special command of linux.*

Here a list of characters enclosed by [ and ], which matches any single character in that range. if the first character of list is ^, then it matches any character not in the list. In above example [Ll], will try to match L or l with rest of pattern. Let's see another example. Suppose you want to match single digit character in range you can give command as follows
**:/[0123456789]**

Even you can try it as follows
**:g/[0-9]**
*Linux is now 10 years old.Next year linux will be 11 year old.*

Here range of digit is specified by giving first digit (0-zero) and last digit (1), separated by hyphen. You can try [a-z] for lowercase character, [A-Z] for uppercase character. Not just this, there are certain named classes of characters which are predefined. They are as follows:

| **Predefined classes of characters** | **Meaning**                                                  |
| ------------------------------------ | ------------------------------------------------------------ |
| **[:alnum:]**                        | Letters and Digits (A to Z or a to z or 0 to 9)              |
| **[:alpha:]**                        | Letters A to Z or a to z                                     |
| **[:cntrl:]**                        | Delete character or ordinary control character (0x7F or 0x00 to 0x1F) |
| **[:digit:]**                        | Digit (0 to 9)                                               |
| **[:graph:]**                        | Printing character, like print, except that a space character is excluded |
| **[:lower:]**                        | Lowercase letter (a to z)                                    |
| **[:print:]**                        | Printing character (0x20 to 0x7E)                            |
| **[:punct:]**                        | Punctuation character (ctrl or space)                        |
| **[:space:]**                        | Space, tab, carriage return, new line, vertical tab, or form feed (0x09 to 0x0D, 0x20) |
| **[:upper:]**                        | Uppercase letter (A to Z)                                    |
| **[:xdigit:]**                       | Hexadecimal digit (0 to 9, A to F, a to f)                   |

For e.g. To find digit or alphabet (Upper as well as lower) you will write
**:/[0-9A-Za-Z]**

Instead of writing such command you could easily use predefined classes or range as follows
**:/[[:alnum:]]**

**The . (dot) matches any single character.**
For e.g. Type following command
**:g/\<.o\>**
*She only loves to play games and nothing else.Do you know?*

This will include lo(ves), Do, no(thing) etc.

*** Matches the zero or more times**
For e.g. Type following command
**:g/L\***
*Hello World.*

*This is vivek from Poona*

*....*

*.....*

**:g/Li\***
*Linux is cooool.Linux is now 10 years old.Rani my sister never uses Linux*

**:g/c.\*and**
*. (DOT) is special command of linux.*

Here first **c** character is matched, then any single character (.) followed by n number of single character (1 or 100 times even) and finally ends with and. This can found different word as follows command or catand etc.

In the regular expression metacharacters such . (DOT) or * loss their special meaning if we use as \. or \*. The backslash removes the special meaning of such meatcharacters and you can use them as ordinary characters. For e.g. If u want to search . (DOT) character at the beginning of line, then you can't use command as follows
**:g/^.**
*Hello World.This is vivek from Poona........... (DOT) is special command of linux.*

*Okay! I will stop.*

Instead of that use
**:g/^\.**
*. (DOT) is special command of linux.*

# Using & as Special replacement character

Try the following command:

:1,$ s/Linux/&-Unix/p

3 substitutions on 3 lines
Rani my sister never uses Linux-Unix

:g/Linux-Unix/p

Linux-Unix is cooool.
Linux-Unix is now 10 years old.
Rani my sister never uses Linux-Unix

This command will replace, target pattern "Linux" with "Linux-Unix". & before - Unix means use "last pattern found" with given pattern, So here last pattern found is "Linux" which is used with given -Unix pattern (Finally constructing "Linux-Unix" substitute for "Linux").
Can you guess the output of this command?
**:1,$ s/Linux-Unix/&Linux/p**

# Converting lowercase character to uppercase

Try the following command
**:1,$ s/[a-z]/\u &/g**

Above command can be explained as follows:

| **Command** | **Explanation**                                              |
| ----------- | ------------------------------------------------------------ |
| **1,$**     | Line Address location is all i.e. find all lines for following pattern |
| **s**       | Substitute command                                           |
| **/[a-z]/** | Find all lowercase letter - Target                           |
| **\u&/**    | Substitute to Uppercase. **\u&** means substitute last patter (**&**) matched with its UPPERCASE replacement (**\u**) Note: Use **\l** (small L) for lowercase character. |
| **g**       | Global replacement                                           |

Can you guess the output of following command?
**:1,$ s/[A-Z]/\l&/g**

Congratulation, for successfully completion of this tutorial of regular expressions.
I hope so you have learn lot from this. To master the expression you have to do lot of practice. This tutorial is very important to continue with rest of tutorial and to become power user of Linux. Impress your friends with such expressions. Can you guess what last expression do?
**:1,\$ s/^   \*$//**

Note :     indicates two black space.

