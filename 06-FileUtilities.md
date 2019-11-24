---
title:	File utilities - making your work more efficient 
author:	CSC Training
date:	  2019-12
lang:	  en
---



# What we will work over

- This session shall introduce you to useful file utilities

# Changing time-stamps

- Changing time-stamps for file, but even creating empty file
```bash
touch [-a -m --reference=reffile] file1 [file2 ...]
```
      - `-a` changes access time (usually not shown)
      - `-m`  changes modification time
      - `--reference=reffile` uses *reffile*’s timestamps
    - lets try the following:
    ```bash
    $ ls  -l *.txt	      #→ -rwxrwxr-x 1 cscuser cscuser 76 Nov 16 23:02 sheep.txt
    ```
	```bash
    $ touch -m sheep.txt
	```
	```bash
	$ ls -l sheep.txt     #→ -rwxrwxr-x 1 cscuser cscuser 76 Nov 18 10:07 sheep.txt
	$ date                #→ Mon 18 Nov 10:07:38 EET 2019
	```
	
	
# Changing time-stamps (cntd.)	
	

- Changing time-stamps for file, but even creating empty file
```bash
touch [-a -m --reference=reffile] file1 [file2 ...]
```
      - `-a` changes access time (usually not shown)
      - `-m`  changes modification time
      - `--reference=reffile` uses *reffile*’s timestamps
    - lets try the following:
	```bash
    $ ls  -l count.txt	 #→ -rwxrwxr-x 1 zwinger zwinger 80 Nov 18 14:29 count.txt
	$ ls -lu count.txt	 #→ -rwxrwxr-x 1 zwinger zwinger 80 Nov 18 14:31 count.txt
    ```
	```bash
    $ touch -a count.txt
	```
	```bash
	$ ls -l count.txt     #→ -rwxrwxr-x 1 zwinger zwinger 80 Nov 18 14:29 count.txt
	$ ls -lu count.txt    #→ -rwxrwxr-x 1 zwinger zwinger 80 Nov 24 20:30 count.txt
	$ date                #→ Sun 24 Nov 20:31:21 EET 2019
	```

# Finding your executable

Find the directory of an executable file in the system
```bash
which  executablename
```
- The filename, naturally, has to be in the environment variable `$PATH`
    ```bash
    $ which ElmerSolver
    ```


# Displaying on screen

```bash
echo contents
```
- The argument *contents* can be anything from an environment variable
```bash
$ echo $PATH
```
- to a string
```bash
$ echo “hello world”
```

# Identifying files

- In some cases it is important to know which type your file is
```bash
file filename
```
    - Lets determine file type 
    ```bash
    $ file $(which ElmerSolver)
    ```
    - `$(…)` puts the output of the expression inside the brackets
    ```bash
    $ file $(which ElmerSolver_mpi)
    ```
- Obtaining detailed file status (*filename* can be also a directory)
```bash
stat filename
```
    ```bash 
	$ stat $(which ElmerSolver)
	```

   
# Next   
