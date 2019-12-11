---
title:	Recap of Linux 1
author:	CSC Training
date:	2019-12
lang:	en
---


# Let's install our virtual appliance

- Open your machine in Windows
- Find the application *VirtualBox* and launch it
- In Main menu, find Import
- Find the OVA file under `\\dogmi\common`
- Click on it
- IMPORTANT: check for new MAC-address

# Lets open the machine and recall the most important commands

- Listing of files/directories?
- Changing a directory?
- Absolute/relative path?
- Where am I in the filesyste?
- Creating an empty new directory?
- Removing it?
- Renaming a file/directory?
- Moving a file/directory?

# Lets open the machine and recall the most important commands

- Listing of files/directories? 
```bash
$ ls -l
```
- Changing a directory?
```bash
$ cd /etc
```
- Absolute/relative path?
```bash
$ cd ../usr
```
```bash
cd /usr
```

# Lets open the machine and recall the most important commands
- Where am I in the filesystem? 
```bash 
$ pwd
```
- Creating an empty new directory? 
```bash
$ mkdir -p mydir\mysubdir
```
- Removing it? 
```bash
$ rmdir mydir\mysubdir
```

# Lets open the machine and recall the most important commands

- Renaming a file/directory? 
```bash
$ mv mydir mynewdir
```
- Moving a file/directory? 
```bash
$ touch myfile
$ mv myfile mynewdir
$ ls -l mynewdir/*
``` 
