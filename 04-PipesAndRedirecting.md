---
title:	Pipes and redirecting
author:	CSC Training
date:	  2019-12
lang:	  en
---


# File descriptors

- A file descriptor _is an abstract indicator used to access a file or other input/output resource, such as a pipe or network connection._ (Wikipedia)
- A file descriptor is a non-negative integer number, which is used as a reference pointer to a file or other input/output resource.
- Three standard file descriptors:
    - **Standard input**, stdin
    - **Standard output**, stdout
    - **Standard error**, stderr


# File descriptors (cntd)

<div style="float:right"> ![Standard Streams](https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Stdstreams-notitle.svg/800px-Stdstreams-notitle.svg.png "public domain (https://en.wikipedia.org/wiki/Standard_streams#/media/File:Stdstreams-notitle.svg)")</div>

| stream | Descriptor | default direction |
| ------:|:----------:|:------------------|
| stdin  | 0          | terminal input    |
| stdout | 1          | terminal output   |
| stderr | 2          | terminal output   |


# Redirecting

- Before a command is executed, its input and output may be redirected using redirection operators `|`, `<`, `>` and/or `>>`.
  - The pipeline is a simple redirection where output (stdout) of each command in the pipeline is connected via a pipe to the input (stdin) of the next command.

```bash
$ ls | wc -l
```

- The redirection operators may precede or appear anywhere within a simple command or may follow a command.
- Redirections are processed in the order they appear, from left to right.


# Redirecting output

- The general format for redirecting output is: `[n]>file` or `[n]>&[m]`
  - Redirection of output causes the _file_ to be opened for writing on file descriptor _n_ (default on standard output). _m_ is another file descriptor.

```bash
$ grep -r "global" /etc   >output   # redirects default stdout
$ grep -r "global" /etc  2>error    # redirects stderr
```

- Multiple redirections with descriptor duplication:

```bash
$ grep -r "global" /etc >output 2>error   # redirects stderr and stout to separate files
$ grep -r "global" /etc >output 2>&1      # redirects stderr to stdout to file
```

- Redirecting to a pipe:

```bash
$ grep -r "global" /etc  2>&1 | less
```


# Appending redirected output

&#9888; Unless the shell option `noclobber` has been set redirecting to a file always overwrites an existing file &#9888;

- To prevent accidental overwriting:

```bash
$ set -o noclobber
```

- If you need to **append** to a _file_ instead of overwriting it, replace the `>` with `>>` operator:

```bash
$ ls >>output
$ grep -r "global" /etc  >>output 2>&1
```


# Some special files

- Unix has three special, so-called _pseudo device files_, which are commonly being used with redirections:
  - `/dev/null` discards all data written to it but reports that the write operation succeeded. Trying to read from it provides nothing.

  ```bash
  $ grep -r "global" /etc 2>/dev/null
  ```

  - `/dev/zero` provides an endless stream of zeros (bytes, not character).
  - `/dev/random` provides an endless stream of random bytes.

  ```bash
  $ cat /dev/random >gibberish.txt   # end with CTRL+C
  $ ls -l gibberish.txt
  ```


# Redirecting input

- The general format for redirecting input is: `[n]<file`
- Redirection of input causes the file to be opened for reading on file descriptor `n` (or by default the standard input).

```bash
$ tr a-z A-Z <adg.txt
$ <adg.txt >output tr a-z A-Z
```


# Here-documents

- A here-document is an input redirection using source data specified directly at the command line until a line containing only a certain keyword is seen.
- The format of here-documents is:

```
command <<[-]keyword
    contents of
    here-document
keyword
```

- All of the lines read up to that point are then used as the standard input for a command.
- See examples next slide.

# Here-documents (cntd)

- Often used in scripts for printing out instructions:

```bash
$ cat <<EndOfText
  A line of text.
  Second line of text.
EndOfText
```

- …but it can also be used to steer an interactive program:

```bash
$ gnuplot <<end
set terminal dumb
f(x)=1/x
plot f(x)
end
```

&#9995; <sub><sup>In case your system lacks `gnuplot`, install by: `sudo apt-get install gnuplot`</sup></sub>


# Here-documents (still cntd)

- A variant of here documents, the format is: `command <<<word`
- The _word_ undergoes brace expansion, tilde expansion, parameter and variable expansion, command substitution, arithmetic expansion, and quote removal. The result is supplied as a single string to the command on its standard input.

```bash
$ bc <<< 2^10
```

```bash
$ tr a-z A-Z <<< 'one two three'
$ echo 'one two three' | tr a-z A-Z
```

```bash
$ read a b c <<< $(echo 'one two three'); echo $c $b $a
```

# Named pipes

- A named pipe (FIFO) works much like a regular pipe, but does have some noticeable differences:
  - Named pipes exist as a device special file in the file system.
  - Processes of different ancestry can share data through a named pipe.
  - When all I/O is done by sharing processes, the named pipe remains in the file system for later use.


# Named pipes (cntd)

- A named pipe is created with `mkfifo` command:

```bash
$ mkfifo -m a=rw MYFIFO
```

- FIFO files can be quickly identified in a physical file system by the "p" indicator seen here in a long directory listing:

```bash
$ ls -lF MYFIFO
[…]
prw-rw-rw-  1 userid  group  0 Dec 5 13:16 MYFIFO|
```

&#9995; <sub><sup>Notice the vertical bar ("pipe sign") located directly after the file name.</sup></sub>


# Named pipes (cntd)

0. If you haven't done so, create a fifo as described on the previous slide
1. In your terminal type:

```bash
$ cat <<EOF >MYFIFO
  Hello, is there anybody in there?
  Not if you can see me.
  Is there anyone at all?
EOF
```

2. In *another* terminal type:

```bash
$ cat <MYFIFO
```

3. In order to remove a named pipe:

```bash
$ rm MYFIFO
```
