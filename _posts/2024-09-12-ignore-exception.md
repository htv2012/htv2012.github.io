---
layout: post
title: How to Ignore Exception in Python
date: 2024-09-12
categories: python
---

There are times when we want to ignore an exception. For example:

```python
import os

try:
    os.unlink("myfile.txt")
except FileNotFoundError:
    pass
```

This block of code will remove a file and ignore exception of that file
does not exist. This code works fine: it does it job.

However, those who read it might wonder if the `pass` statement was a
placeholder and the author intended to handle this exception, but forgot
to do so.

A more expressive way to ignore exception is to use `contextlib.suppress`:

```python
import contextlib
import os

with contextlib.suppress(FileNotFoundError):
    os.unlink("myfile.txt")
```

This block of code accomplishes the same result as the previous one,
but it clearly communicates the intention to ignore the exception.

Experience Python coder might point out the use of
`pathlib.Path.unlink(missing_ok=False)`, but that is beside the point
of this article.

A note about ignoring exception: we should only do this when the need
arises. In general, blindly ignore exceptions will hide the root cause
of the problems, making troubleshooting difficult.

Furthermore, under the `suppress()` context manager, ideally we should
only have one statement to ensure we pinpoint the exact place we might
raise an exception. Having too many statements under `suppress()` and
we might end up ignoring the exception raised by the unintended statement.
