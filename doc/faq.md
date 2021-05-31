# FAQ

 * Installation
 * General
 * Technical

## Installation

See [install.md](install.md)

## General

### On which operating systems can I run `plinkr`?

`plinkr` is tested by GitHub Actions to work on Linux, Mac and Windows.

Real users have confirmed `plinkr` works under Linux and Mac.
Another real user needs to confirm/reject 
that `plinkr` really works under Windows
(note: I predict it does not :sunglasses:)

### Why is this package not on CRAN?

Because no real users have yet tested it, except me.

When it moves to CRAN, the `install` and `uninstall` functions will move
to a non-CRAN package, as these functions violate CRAN policy.

## Technical

### Can plinkr handle SNPs with three or four alleles?

No. PLINK cannot, so plinkr cannot.


### How can I use a version of PLINK I have installed elsewhere?

The `create_custom_plink_options` allows to do so.
If PLINK is installed in folder `my_plink_path`,
create a `plink_options` as such:
 

```
plink_options <- create_custom_plink_options("my_plink_path")
```

This `plink_options` can be used in all functions that call PLINK,
for example:

```
get_plink_version(plink_options)
```

The executable of PLINK should be at the following location:

```
get_plink_exe_path(plink_options)
```

In this example, on Linux, 
the PLINK executable must be located at `my_plink_path/plink`.

