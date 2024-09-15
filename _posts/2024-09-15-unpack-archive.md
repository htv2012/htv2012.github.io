---
layout: post
title: How to Unpack an Archive Using Python
date: 2024-09-15
categories: python
---

When coding in Python, we sometimes have the need to unpack an archive
such as a zip or a tar file. This article show a couple of ways and
compare the pros and cons of each method.

# Using the `zipfile` Library

Python comes with the `zipfile` standard library. It seems to be the
most obvious choice when we want to unpack a zip archive. The following
code snippet with unpack the contents of `my.zip` into a directory `out`:

```python
import zipfile

with zipfile.ZipFile("my.zip") as zip:
    for name in zip.namelist():
        zip.extract(name, path="out")
```

Pros:

* The name of library is obvious.
* The library offer more tools than just unpacking. For example, one can
  list the names, compression size of each file in the archive.
* We can selectively unpack files based on their names for other
  attributes, see ZipInfo.

Cons:

* It is not obvious how to extract the files. For example, how do we get
  the `name` for `extract()`?
* It is a multi-steps process.
* This library can only unpack zip file, it cannot handle other archive
  format such as tar.


# Using the `shutil` Library

The `shutil` library provide a quick and easy way to unpack an archive.

```python
import shutil

shutil.unpack_archive("my.zip", "out")
```

Pros:

* Simple: it is a 1-liner job
* `shutil` can unpack more than one formats, including zip and tar

Cons:

* The library name `shutil` is not obvious
* We cannot selectively unpack files. `shutil` will always unpackage all
  files.

### Sidebar: What Kind of Format can `shutil` Unpack?

On my system, the following snippet:

```python
import shutil
import pprint

pprint.pprint(shutil.get_unpack_formats())
```

Produces the following output:

```
[('bztar', ['.tar.bz2', '.tbz2'], "bzip2'ed tar-file"),
 ('gztar', ['.tar.gz', '.tgz'], "gzip'ed tar-file"),
 ('tar', ['.tar'], 'uncompressed tar file'),
 ('xztar', ['.tar.xz', '.txz'], "xz'ed tar-file"),
 ('zip', ['.zip'], 'ZIP file')]
```

The result on your system might be different.


# Using The Shell

There are times when we encounter an unsupported format, such as a tar
file compressed with LZMA algorithm. In the following example, attempt
to unpack such an archive. When unpack failed, we will have to use the
shell command `tar` to unpackage it.

```python
import contextlib
import os
import shutil
import subprocess

archive_path = "my.tar.lz"
out_dir = "out"
success = True

try:
    shutil.unpack_archive(archive_path, out_dir)
except shutil.ReadError as error:
    print(f"Unpack failed: {error}")
    success = False


if not success:
    with contextlib.suppress(FileExistsError):
        os.mkdir(out_dir)
    subprocess.run(
        ["tar", "--lzma", "--extract", "--file", archive_path, "--directory", out_dir]
    )
    print("Unpacked")
```

This process involves two separate steps: First, we need to create
the output directory if one does not exists. Next, we invoke the `tar`
command to unpack.

Pros

* Get the job done, even when the format is not supported
* Work with formats that not supported by `shutil`

Cons

* A bit involved
* We need to learn how to use the command line in terminal to unpack


# Using `shutil` to Register a New Unpack Format

In the previous section, we use the shell `tar` command to unpack
a tar file compressed using the LZMA algorithm. While this example
works fine, it would be nice if we can package this into a function
for reusability. It would be nicer if we can register this function to
`shutil`. This is the topic for the next code snippet:

```python
import pathlib
import shutil
import subprocess


def lzma_untar(archive_path, out_dir, filter=None, **kwargs):
    pathlib.Path(out_dir).mkdir(exist_ok=True)
    subprocess.run(
        ["tar", "--lzma", "--extract", "--file", archive_path, "--directory", out_dir],
    )

shutil.register_unpack_format("lztar", [".tar.lz", "tar.lzma"], lzma_untar, description="LZMA tar file")
shutil.unpack_archive("my.tar.lz", "out")
```

Notes

* The function `lzma_untar` is similar to what we have seen before
* We call `register_unpack_format()` to register this function with
  `shutil` so that if it encounters archives with matched extensions, it
  will invoke our function to unpack
* After registration, we can call `unpack_archive()` just like before

Pros

* Intuitive
* Register once, unpackage many times
* We can also make up our own archive format

Cons:

* Again, require shell command knowledge
* We have to create the output directory ourselves


# Conclusion

* Using `shutil` is more convenient than `zipfile`
* The `shutil` library can handle more archive formats, including custom
  ones
