---
title:	Retrieving, compiling and running own programs
author:	CSC Training
date:	2019-12
lang:	en
---


# Installing Qiime2

- QIIME2 installation instructions are at [docs.qiime2.org](https://docs.qiime2.org/2019.10/install/native/)

```bash
$ python -V
$ python3 -V
```

```bash
$ wget https://repo.anaconda.com/miniconda/Miniconda2-latest-Linux-x86_64.sh
$ bash Miniconda2-latest-Linux-x86_64.sh
$ exit
```

```bash
$ conda update conda
$ conda install wget
```

```bash
$ wget https://data.qiime2.org/distro/core/qiime2-2019.10-py36-linux-conda.yml
$ conda env create -n qiime2-2019.10 --file qiime2-2019.10-py36-linux-conda.yml
```

```bash
$ conda activate qiime2-2019.10
```

# Why Conda?

- Conda is an open source _package management_ system and _environment management_ system that runs on Windows, macOS and Linux.
  - Conda quickly installs, runs and updates packages and their dependencies.
  - You can set up totally separate environments to run different versions of software, while continuing to run your usual
commands in your normal environment.
  - Miniconda is “mini” because by default, it does not include as many Python packages as Anaconda does. A minimum number of default packages uses less space on hard drives.
- Miniconda in not installed by default on Linux.


# Conda basics

- To create/remove a new environment and install/remove software into it:

```bash
$ conda create -n env_name software [ software … ]
$ conda remove env_name
```

- To use installed software in its environment:

```bash
$ conda activate env_name
```

- To stop using software:

```bash
(env_name) $ conda deactivate
```

- Enable/disable Conda base at startup:

```bash
$ conda config --set auto_activate_base true|false
```


# Bioconda

- Bioconda is a channel for the conda package manager specializing in bioinformatics software, see [Bioconda web page](https://bioconda.github.io/) for more information.

```bash
$ conda config --add channels defaults
$ conda config --add channels bioconda
$ conda config --add channels conda-forge
```

```bash
$ conda create -n aligners bwa bowtie
```

```bash
$ conda activate aligners
$ conda deactivate
```

# Compiling from source code

- If you are absolutely sure a ready-made executable does not exist, you need to compile the software yourself.

```bash
$ wget https://ftp.gnu.org/gnu/hello/hello-2.10.tar.gz
$ tar xzf hello-2.10.tar.gz
$ cd hello-2.10
$ ./configure --prefix=${HOME}/hello
$ make
$ make install
$ make clean
```

- Development libraries required for compiling might be missing from default install. If that's the case those need to be installed first.

```bash
$ sudo apt install libc-dev
```
