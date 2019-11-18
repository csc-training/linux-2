---
title:	Replacing Spreadsheets - POSIX text utilities
author:	CSC Training
date:	  2019-12
lang:	  en
---



# What we will work over

- Your shell has built-in spread-sheet functions
- You can find/extract/combine text row or column-wise

# Adding files side-by-side: paste

merging lines of several input files

- syntax:
```bash
paste [-d del -s] file1 file2 [file3 ...]
```
    - `-d ` insert different delimiter *del* (between merged lines) than tabulator (default)
    - `-s` sequential in case of more than two files: `[(file1 + file2) + file3] + file4`

- lets try the following:
```bash
$ paste count.txt sheep.txt > counting_sheep_tab.txt         # creates merged file with tabulators
$ paste -d ' ' count.txt sheep.txt > counting_sheep_tab.txt  # creates merged file with space as delimiter
```

# Trimming files: cut

extracting fields/columns from each line of files
 
- syntax:
```bash
cut [-d del -f no -s] file1 file2 ...
```
    - `-d del` use different delimiter *del* (to identify fields) than tabulator (default)
    - `-f no` select fields *no* 
    - `-s` skip lines not containing delimiters (e.g., header lines)
- lets try the following:
```bash
$ cut -f 1 counting_sheep_tab.txt
$ cut -f 1 -d ' ' counting_sheep_space.txt
```
    - both will display the original content of count.txt
   
# Counting lines [and sheep]: wc

- counting the lines, the words as well as the characters or bytes in a file (`wc` stands for **w**ord **c**ount):
```bash
wc [-l -w -m -c] file1 [file2 ...]
```
    - `-l` count lines
    - `-w` count words
    - `-m` count characters
    - `-c` count bytes
    - without arguments displays lines, words, and byte-counts (as `-l -w -c`)
       - a word is a non-zero-length sequence of characters delimited by white space
```bash
$ wc -l sheep_space.txt
```
	
# Combining files end to start: cat

- con**cat**enates files and prints to stdout
```bash
cat [-n -E -v -T] file1 file2 ...
```
    - `-n` numbering output lines (e.g., source-code listing)
    - `-E` indicate ends with a $
    - `-v` show non-printing
    - `-T` indicate tabs
	
    - numbers the lines in `sheep_space.txt` and adds the column	
```bash
$ cat -n sheep_space.txt > sheep_lines.txt
```
```bash
$ cat -T -E sheep_tab.txt
```

# Extracting beginning and end of files

- extracting head of files
```bash
head [-n N] file1 [file2 ...]
```
    - `-n N` display *N* first lines
	
- extracting tail of files
```bash
tail [-n N -f --pid PID] file1 [file2 ...]
```
    - `-n N` display *N* last lines
	- `-f` continuously display updates of file (useful to display log-files)
	- `--pid PID` terminate tail-command in sync with termination of process with process ID *PID*
	
# Bringing order into files

- sort lines of text files (alphabetical or numerical)
```bash
sort [-d -f -g ] file1 [file2 ...]
```
    - `-d` dictionary (alphanumeric) order
    - `-f` ignore upper/lower case
    - `-g` general numeric
    - Spot the difference:
	```bash
	 $ sort -d sheep_space.txt
     $ sort -g sheep_lines.txt 
    ```

# Removing redundancy in files

- filter adjacent matching (redundant) files
```bash
 uniq [-c -f -s -w ] file1 [file2 ...]
```
    - `-c` prefix lines by number of their occurrence
    - `-f N` avoid comparing the first *N* fields
    - `-s N` avoid comparing the first *N* characters
    - `-w N` compare not more than *N* characters/line

    - skips the first column (the previously inserted numbers) and matches in max. 10 characters (i.e., avoiding the later columns) and prefixes the number of occurrence (Hint: try with –f 2)
    ```bash
	$ uniq -c -f 1 -w 10 sheep_lines.txt 
    ```

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
    $ ls  -l *.txt	      → -rwxrwxr-x 1 cscuser cscuser 76 Nov 16 23:02 sheep.txt
    ```
	```bash
    $ touch -m sheep.txt
	```
	```bash
	$ ls -l *.txt         → -rwxrwxr-x 1 cscuser cscuser 76 Nov 18 10:07 sheep.txt
	$ date                → Mon 18 Nov 10:07:38 EET 2019
	```
	
	
# Changing time-stamps (cntd.)	
	

- Changing time-stamps for file, but even creating empty file
```bash
touch [-a -m --reference=reffile] file1 [file2 ...]
```
      - `-a` changes access time (usually not shown)
      - `-m`  changes modification time
      - `--reference=reffile` uses *reffile*’s timestamps
