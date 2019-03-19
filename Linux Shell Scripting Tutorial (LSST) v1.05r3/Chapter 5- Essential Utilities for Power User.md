**Linux Shell Scripting Tutorial (LSST) v1.05r3**

Chapter 5: Essential Utilities for Power User

# Introduction

Linux contains powerful utility programs. You can use these utility to

- Locate system information
- For better file management
- To organize your data
- System administration etc

Following section introduce you to some of the essential utilities as well as expression. While programming shell you need to use these essential utilities. Some of these utilities (especially sed & awk) requires understanding of expression. After the quick introduction to utilities, you will learn the expression.

# Prepering for Quick Tour of essential utilities

For this part of tutorial create 

sname

 and 

smark

 data files as follows (Using text editor of your choice)

Note

 Each data block is separated from the other by TAB character i.e. while creating the file if you type 11 then press "tab" key, and then write Vivek (as shown in following files):

**sname**

Sr.No     Name
11          Vivek
12          Renuka
13          Prakash
14         Ashish
15         Rani

**smark**

Sr.No    Mark
11          67
12          55
13          96
14          36
15          67

# Selecting portion of a file using cut utility

Suppose from *sname* file you wish to print name of student on-screen, then from shell (Your command prompt i.e. $) issue command as follows:

**$cut -f2 sname**

Vivek
Renuka
Prakash
Ashish
Rani

**cut** utility cuts out selected data from *sname* file. To select Sr.no. field from sname give command as follows:
**$cut -f1 sname**

11
12
13
14
15

| **Command** | **Explanation**                                              |
| ----------- | ------------------------------------------------------------ |
| **cut**     | Name of cut utility                                          |
| **-f1**     | Using (-f) option, you are specifying the extraction field number. (In this example its 1 i.e. first field) |
| **sname**   | File which is used by cut utility and which is use as input for cut utility. |

You can redirect output of cut utility as follows
**$cut -f2 sname > /tmp/sn.tmp.\$\$**

**\$cut -f2 smark > /tmp/sm.tmp.\$\$**

**$cat /tmp/sn.tmp.\$\$**
*Vivek*

*Renuka*

*Prakash*

*Ashish*

*Rani*
**$cat /tmp/sm.tmp.\$\$**
*67*

*55*

*96*

*36*

*67*

General Syntax of cut utility:
*Syntax:*
cut -f{field number} {file-name}

*Use of Cut utility*:
Selecting portion of a file.

# Putting lines together using paste utility

Now enter following command at shell prompt

$ paste sname smark

11    Vivek      11    67
12    Renuka   12    55
13    Prakash 13    96
14    Ashish   14     36
15    Rani      15     67

Paste utility join *textual information together*. To clear your idea try following command at shell prompt:

**\$ paste /tmp/sn.tmp.​\$\$ /tmp/sm.tmp.\$\$**
*Vivek      67*

*Renuka    55*

*Prakash   96*

*Ashish     36*

*Rani        67*

Paste utility is useful to put textual information together located in various files.

General Syntax of paste utility:
*Syntax:*
paste {file1} {file2}

*Use of paste utility:*
Putting lines together.

Can you note down basic difference between cut and paste utility?

# The join utility

Now enter following command at shell prompt:

$join sname smark

11   Vivek       67
12   Renuka    55
13   Prakash  96
14   Ashish     36
15   Rani        67

Here students names are matched with their appropriate marks. How ? join utility uses the Sr.No. field to join to files. Notice that Sr.No. is the first field in both sname and smark file.

General Syntax of join utility:
*Syntax:*
join {file1} {file2}

*Use of join utility:* 
The join utility joins, lines from separate files.

**Note** that join will only work, if there is *common field in both file and if values are identical to each other*.

# Translateing range of characters using tr utility

Type the following command at shell prompt:

$ tr "h2" "3x" < sname

11   Vivek
1x   Renuka
13   Prakas3
14   As3is3
15   Rani

You can clearly see that each occurrence of character 'h' is replace with '3' and '2' with 'x'. tr utility translate specific characters into other specific characters or range of characters into other ranges.
h -> 3
2 -> x

Consider following example: (after executing command type text in lower case)
**$ tr "[a-z]" "[A-Z]"** 
hi i am Vivek
*HI I AM VIVEK*
what a magic
*WHAT A MAGIC*

{Press CTRL + C to terminate.}

Here tr translate range of characters (i.e. small a to z) into other (i.e. to Capital A to Z) ranges.

General Syntax & use of tr utility:
*Syntax:*
tr {pattern-1} {pattern-2}

*Use of tr utility:*To translate range of characters into other range of characters.

After typing following paragraph, I came to know my mistake that entire paragraph must be in lowercase characters, how to correct this mistake? (Hint - Use tr utility)

**$ cat > lcommunity.txt**

**THIS IS SAMPLE PARAGRAPH**

**WRITTEN FOR LINUX COMMUNITY,**

**BY VIVEK G GITE (WHO ELSE?)**

**OKAY THAT IS OLD STORY.**

# Data manipulation using awk utility

Before learning more about awk create data file using any text editor or simply vi:

**inventory**

egg       order   4
cacke   good   10
cheese  okay   4
pen       good  12
floppy   good   5

After crating file issue command
**$ awk '/good/ { print $3 }' inventory**
*10*

*12*

*5*

awk utility, select each record from file containing the word "good" and performs the action of printing the third field (Quantity of available goods.). Now try the following and note down its output.
**$ awk '/good/ { print $1 " " $3 }' inventory**

General Syntax of awk utility:
*Syntax:*
awk 'pattern action' {file-name}

For **$ awk '/good/ { print $3 }' inventory** example,

| **/good/**     | Is the pattern used for selecting lines from file.           |
| -------------- | ------------------------------------------------------------ |
| **{print $3}** | This is the action; if pattern found, print on of such action. Here \$3 means third record in selected record. (What \$1 and ​\$2 mean?) |
| **inventory**  | File which is used by awk utility which is use as input for awk utility. |

*Use of awk utility:*
To manipulate data.

# sed utility - Editing file without using editor

For this part of tutorial create data file as follows

[**teaormilk**](http://www.freeos.com/guides/lsst/datafiles/teaormilk)

India's milk is good.
tea Red-Lable is good.
tea is better than the coffee.

After creating file give command
**\$ sed '/tea/s//milk/g' teaormilk  > /tmp/result.tmp.\$\$**
**\$ cat /tmp/result.tmp.​\$\$**
*India's milk is good.milk Red-Lable is good.milk is better than the coffee.*

sed utility is used to find every occurrence of tea and replace it with word milk. sed - Steam line editor which uses 'ex' editors command for editing text files without starting ex. (Cool!, isn't it? no use of text editor to edit anything!!!)

| **/tea/**    | Find tea word or select all lines having the word tea |
| ------------ | ----------------------------------------------------- |
| **s//milk/** | Replace (substitute) the word milk for the tea.       |
| **g**        | Make the changes globally.                            |

*Syntax:*
sed {expression} {file}

*Use of sed utility:* sed is used to edit (text transformation) on given stream i.e a file or may be input from a pipeline.

# Removing duplicate lines using uniq utility

Create text file personame as follows:

**personame**

Hello I am vivek
12333
12333
welcome
to
sai computer academy, a'bad.
what still I remeber that name.
oaky! how are u luser?
what still I remeber that name.

After creating file, issue following command at shell prompt
**$ uniq personame**
*Hello I am vivek*

*12333*

*welcome*

*to*

*sai computer academy, a'bad.*

*what still I remeber that name.*

*oaky! how are u luser?*

*what still I remeber that name.*

Above command prints those lines which are unique. For e.g. our original file contains 12333 twice, so additional copies of 12333 are deleted. But if you examine output of uniq, you will notice that 12333 is gone (Duplicate), and "what still I remeber that name" remains as its. Because the uniq utility compare only adjacent lines, duplicate lines must be next to each other in the file. To solve this problem you can use command as follows
**$ sort personame | uniq**

General Syntax of uniq utility:
*Syntax:*
uniq {file-name}

# Finding matching pattern using grep utility

Create text file as follows:

**demo-file**

hello world!
cartoons are good
especially toon like tom (cat)
what
the number one song
12221
they love us
I too

After saving file, issue following command,
**$ grep "too" demofile**
cartoons are good
especially toon like tom (cat)
I too

grep will locate all lines for the "too" pattern and print all (matched) such line on-screen. grep prints too, as well as cartoons and toon; because grep treat "too" as expression. Expression by grep is read as the letter **t** followed by **o** and so on. So if this expression is found any where on line its printed. grep don't understand words.

*Syntax:*
grep "word-to-find" {file-name}