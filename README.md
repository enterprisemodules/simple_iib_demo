# Demo Puppet implementation

This repo contains a demonstration of a simple IBM Integration Bus (IIB) installation installation.

## Starting the nodes masterless

All nodes are available to test with Puppet masterless. To do so, add `ml-` for the name when using vagrant:

```
$ vagrant up ml-iib01
```

## Staring the nodes with PE

You can also test with a Puppet Enterprise server. To do so, add `pe-` for the name when using vagrant:

```
$ vagrant up pe-master
$ vagrant up pe-iib01
```

## ordering

You must always use the specified order:

1. master
2. iib01

## Required software

The software must be placed in in the `modules/software/files/` directory.

It must contain the next files:

### Puppet Enterprise

- puppet-enterprise-2017.2.3-el-7-x86_64.tar.gz (Extracted tar)

### IBM ACE Fixpack (Supported versions)

*If the setup targets IBM App Connect Enterprise Version 11.0*
The software directory must contain fixpack 4

- 11.0.0-ACE-LINUXX64-FP0004.tar.gz

### IBM IIB Fixpack (switch git branch)

*On `master`  branch the setup targets IBM IIB version 10*
The software directory must contain fixpack 9.

- 10.0.0-IIB-LINUXX64-FP0009.tar.gz

## Node Configuration

All setup including IBM filename reference is located yaml files in
`hieradata/nodes/`.

# Example run

Check here the example run:

[![asciicast](https://asciinema.org/a/109018.png)](https://asciinema.org/a/109018)
