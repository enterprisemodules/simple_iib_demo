# Demo Puppet implementation

This repo contains a demonstration of a simple IBM Integration Bus (IIB) installation installation.

## Starting the nodes masterless

All nodes are available to test with Puppet masterless. To do so, add `ml-` for the name when using vagrant:

```
$ vagrant up ml-iib01
```

## Staring the nodes with PE

You can also test with a Puppet Enterprise server. To do so, add `pe-` for the
name when using vagrant:

```
$ vagrant up pe-master
$ vagrant up pe-iib01
```

## ordering

You must always use the specified order:

1. master
2. iib01

## Required software

The software must be placed in in the `modules/software/files` directory.
It must contain the following files:

### Puppet Enterprise
- `puppet-enterprise-2017.2.3-el-7-x86_64.tar.gz` (Extracted tar)

### IBM IIB Fixpack (Supported versions)
- `10.0.0-IIB-LINUXX64-FP0010.tar.gz`


# Example run

Check here the example run:

[![asciicast](https://asciinema.org/a/109018.png)](https://asciinema.org/a/109018)
