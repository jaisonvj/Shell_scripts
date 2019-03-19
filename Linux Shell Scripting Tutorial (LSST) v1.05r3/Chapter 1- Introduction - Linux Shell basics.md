**Linux Shell Scripting Tutorial (LSST) v1.05r3**

Chapter 1: Introduction: Quick Introduction to Linux

# Introduction

This tutorial is designed for beginners who wish to learn the basics of shell scripting/programming plus introduction to power tools such as awk, sed, etc. It is not help or manual for the shell; while reading this tutorial you can find manual quite useful (type man bash at $ prompt to see manual pages). Manual contains all necessary information you need, but it won't have that much examples, which makes idea more clear. For this reason, this tutorial contains examples rather than all the features of shell.

# Audience for this tutorial

I assumes you have at least working knowledge of Linux i.e. basic commands like how to create, copy, remove files/directories etc or how to use editor like vi or mcedit and login to your system. But not expects any programming language experience. If you have access to Linux, this tutorial will provide you an easy-to-follow introduction to shell scripting.

# What's different about this tutorial

Many other tutorial and books on Linux shell scripting are either too basic, or skips important intermediate steps. But this tutorial, maintained the balance between these two. It covers the many real life modern example of shell scripting which are almost missed by many other tutorials/documents/books. I have used a hands-on approach in this tutorial. The idea is very clear "*do it yourself or learn by doing*" i.e. trying things yourself is the best way to learn, so examples are presented as complete working shell scripts, which can be typed in and executed

# Chapter Organization

Chapter 1 to 4 shows most of the useful and important shell scripting concepts. Chapter 5 introduction to tools & utilities which can be used while programming the Linux shell smartly. Chapter 6 and 7 is all about expression and expression mostly used by tools such as sed and awk. Chapter 8 is loaded with tons of shell scripting examples divided into different categories. Chapter 9 gives more resources information which can be used while learning the shell scripting like information on Linux file system, common Linux command reference and other resources.

Chapter 1 introduces to basic concepts such as what is Linux, where Linux can used and continue enplaning the shell, shell script and kernel etc.

Chapter 2 shows how to write the shell script and execute them. It explains many basic concepts which requires to write shell script.

Chapter 3 is all about making decision in shell scripting as well as loops in shell. It explains what expression are, how shell understands the condition/decisions. It also shows you nesting concept for if and for loop statement and debugging of shell script.

Chapter 4 introduces the many advanced shell scripting concepts such as function, user interface, File Descriptors, signal handling, Multiple command line arguments etc.

Chapter 5 introduces to powerful utility programs which can be used variety of purpose while programming the shell scripting.

Chapter 6 and 7 gives more information on patterns, filters, expressions, and off course sed and awk is covered in depth.

Chapter 8 contains lot of example of shell scripting divided into various category such as logic development, system administration etc.

Note that indicate ![Bulp](http://www.freeos.com/guides/lsst/images/bulb.gif) advanced shell scripting concepts, you can skip this if are really new to Linux or Programming, though this is not RECOMMENDED by me.

Also not that currently this tutorial is also translated into some other foreign language(s); if you are interested to read it in other language the the English then please visit <http://www.nixcraft.com/uniqlinuxfeatures/lsst/>.

I hope you get as much pleasure reading this tutorial, as I had writing it. After reading this tutorial if you are able to write your own powerful shell scripts, then I think the purpose of writing this tutorial is served and finally if you do get time after reading this tutorial drop me an e-mail message about your comment/suggestion and off course bugs (errors) of this tutorial.

# What Linux is?

- [Free](http://www.freeos.com/guides/lsst/misc.htm#free)
- [Unix Like](http://www.freeos.com/guides/lsst/misc.htm#unix)
- [Open Source](http://www.freeos.com/guides/lsst/misc.htm#opensource)
- Network operating system

# Who developed the Linux?

In 1991, Linus Torvalds studding Unix at the University, where he used special educational experimental purpose operating system called Minix (small version of Unix and used in Academic environment). But Minix had it's own limitations. Linus felt he could do better than the Minix. So he developed his own version of Minix, which is now know as Linux. Linux is Open Source From the start of the day. For more information on Linus Torvalds, please visit his home page.

# How to get Linux?

Linux available for download over the net, this is useful if your internet connection is fast. Another way is order the CD-ROMs which saves time, and the installation from CD-ROM is fast/automatic. Various Linux distributions available. Following are important Linux distributions.

| **Linux distributions.**                                     | **Website/Logo**                                             |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| Red Hat Linux:[ http://www.redhat.com/ ](http://www.redhat.com/%20) | [![Red Hat Logo](http://www.freeos.com/guides/lsst/images/redhat.gif)](http://www.redhat.com/%20) |
| SuSE Linux: [http://www.suse.com/ ](http://www.suse.com/%20) | [![Suse Logo](http://www.freeos.com/guides/lsst/images/suse.gif)](http://www.suse.com/%20) |
| Mandrake Linux: <http://www.mandrakesoft.com/>               | [![Mandrake Linux Logo](http://www.freeos.com/guides/lsst/images/logo-mandrakesoft.jpg)](http://www.mandrakesoft.com/) |
| Caldera Linux: [http://www.calderasystems.com/ ](http://www.calderasystems.com/%20) | [![Caldera Logo](http://www.freeos.com/guides/lsst/images/caldera.gif)](http://www.calderasystems.com/%20) |
| Debian GNU/Linux: [http://www.debian.org/ ](http://www.debian.org/%20) | [![Debian GNU/Linux Logo](http://www.freeos.com/guides/lsst/images/debian.jpeg)](http://www.debian.org/%20)[![Debian GNU/Linux Logo](http://www.freeos.com/guides/lsst/images/debiantext.jpeg)](http://www.debian.org/%20) |
| Slackware Linux: [http://www.slackware.com/](http://www.debian.org/%20) | [![Slakware Linux Logo](http://www.freeos.com/guides/lsst/images/slackware.jpeg)](http://www.slackware.com/%20) |

**Note:** If you are in India then you can get Linux Distribution from the Leading Computer magazine such as[ PC Quest](http://www.pcquest.com/) (Even PCQuest has got its own Linux flavor) or if you are in Pune, India please visit the [our sponsor web site ](http://www.ecyberciti.com/)to obtained the Red Hat Linux or any other official Linux distribution. Note that you can also obtained your Linux distribution with Linux books which you purchase from Local book store.

# How to Install Linux ?

Please visit the http://www.nixcraft.com/lessbs/ for Quick Visual Installation Guide for Red Hat Linux version 6.2 and 7.2.

# Where I can use Linux?

You can use Linux as Server Os or as stand alone Os on your PC. (But it is best suited for Server.) As a server Os it provides different services/network resources to client. Server Os must be:

- Stable
- Robust
- Secure
- High Performance

Linux offers all of the above characteristics plus its Open Source and Free OS. So Linux can be used as:

(1) On *stand alone workstation*/PC for word processing, graphics, software development, internet, e-mail, chatting, small personal database management system etc.
(2) In *network environment* as:
(A) *File and Print or Application* Server
Share the data, Connect the expensive device like printer and share it, e-mail within the LAN/intranet etc are some of the application.

![Linux Server: Used as File & Print or As Application Server](http://www.freeos.com/guides/lsst/images/server.gif)
Linux Server with different Client Os

(B) Linux sever cab be connected to Internet, So that PC's on intranet can share the internet/e-mail etc. You can put your web sever that run your web site or transmit the information on the internet.

![Linux Server Connected to Internet](http://www.freeos.com/guides/lsst/images/internet.gif)
Linux Server can act as Proxy/Mail/WWW/Router Server etc.

So you can use Linux for:

- Personal Work
- Web Server
- Software Development Workstation
- Workgroup Server
- In Data Center for various server activities such as FTP, Telnet, SSH, Web, Mail, Proxy, Proxy Cache Appliance etc

See the [LESSBS](http://www.nixcraft.com/lessbs/) project for more information on Linux Essential Services (as mentioned above) and how to implement them in easy manner for you or your organization.

# What Kernel Is?

Kernel is hart of Linux Os.

It manages resource of Linux Os. Resources means facilities available in Linux. For e.g. Facility to store data, print data on printer, memory, file management etc .

Kernel decides who will use this resource, for how long and when. It runs your programs (or set up to execute binary files).

The kernel acts as an intermediary between the computer hardware and various programs/application/shell.



![Linux Kernel between you/shell/apps and your computers hardware](http://www.freeos.com/guides/lsst/images/rela.gif)

It's Memory resident portion of Linux. It performance following task :-

- I/O management
- Process management
- Device management
- File management
- Memory management

# What is Linux Shell ?

Computer understand the language of 0's and 1's called binary language.

In early days of computing, instruction are provided using binary language, which is difficult for all of us, to read and write. So in Os there is special program called Shell. Shell accepts your instruction or commands in English (mostly) and if its a valid command, it is pass to kernel.

Shell is a user program or it's environment provided for user interaction. Shell is an command language interpreter that executes commands read from the standard input device (keyboard) or from a file.

Shell is not part of system kernel, but uses the system kernel to execute programs, create files etc.

Several shell available with Linux including:

| **Shell Name**              | **Developed by**                  | **Where**                          | **Remark**                                                   |
| --------------------------- | --------------------------------- | ---------------------------------- | ------------------------------------------------------------ |
| BASH ( Bourne-Again SHell ) | Brian Fox and Chet Ramey          | Free Software Foundation           | Most common shell in Linux. It's Freeware shell.             |
| CSH (C SHell)               | Bill Joy                          | University of California (For BSD) | The C shell's syntax and usage are very similar to the C programming language. |
| KSH (Korn SHell)            | David Korn                        | AT & T Bell Labs                   | --                                                           |
| TCSH                        | See the man page. Type $ man tcsh | --                                 | TCSH is an enhanced but completely compatible version of the Berkeley UNIX C shell (CSH). |

**Tip:** To find all available shells in your system type following command:
**$ cat /etc/shells**

**Note** that each shell does the same job, but each understand a different command syntax and provides different built-in functions.

In MS-DOS, Shell name is COMMAND.COM which is also used for same purpose, but it's not as powerful as our Linux Shells are!

Any of the above shell reads command from user (via Keyboard or Mouse) and tells Linux Os what users want. If we are giving commands from keyboard it is called command line interface ( Usually in-front of $ prompt, This prompt is depend upon your shell and Environment that you set or by your System Administrator, therefore you may get different prompt ).

**Tip:** To find your current shell type following command

**$ echo \$SHELL**

# How to use Shell

To use shell (You start to use your shell as soon as you log into your system) you have to simply type commands.

See common [Linux Command](http://education.vsnl.com/cyberciti/linuxcom.htm) for syntax and example, this can be used as quick reference while programming the shell.

# What is Shell Script ?

Normally shells are interactive. It means shell accept command from you (via keyboard) and execute them. But if you use command one by one (sequence of 'n' number of commands) , the you can store this sequence of command to text file and tell the shell to execute this text file instead of entering the commands. This is know as *shell script*.

Shell script defined as:"*Shell Script is **series of command** written **in plain text file**. Shell script is just like batch file is MS-DOS but have more power than the MS-DOS batch file.*"

# Why to Write Shell Script ?

- Shell script can take input from user, file and output them on screen.
- Useful to create our own commands.
- Save lots of time.
- To automate some task of day today life.
- System Administration part can be also automated.

# Which Shell We are using to write Shell Script ?

In this tutorial we are using bash shell.

# Objective of this Tutorial (LSST v.1.5)

Try to understand Linux Os
Try to understand the basics of Linux shell
Try to learn the Linux shell programming
What I need to learn this Tutorial (LSST v.1.5)

# Linux OS ( I have used Red Hat Linux distribution Version 6.x+)

Web Browse to read tutorial. (IE or Netscape) For PDF version you need PDF reader.
Linux - bash shell. (Available with almost all Linux Distributions. By default bash is default shell for Red Hat Linux Distribution). All the scripts are also tested on Red Hat Linux version 7.2.