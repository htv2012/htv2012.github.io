---
layout: post
title: CSV - Convert Numeric Values
date: 2024-09-13
categories: python
---


If we have a CSV file with all string values quoted and numeric values
unquoted, then we can instruct the `csv` library to convert those values
to strings and numeric values, respectively.

# Convert Using `csv.QUOTE_NONNUMERIC`

Consider the following CSV file:


```python
import csv
import json
import pathlib

data_path = pathlib.Path("convert_numeric_values.csv")
print(data_path.read_text())
```

Output:

    "uid","alias","shell","rate"
    501,"karen","zsh",105.3
    502,"john","bash",97.5
    

We can tell CSV to convert unquoted values to numeric:


```python
with open(data_path) as stream:
    reader = csv.reader(stream, quoting=csv.QUOTE_NONNUMERIC)
    for row in reader:
        print(row)
```

Output:

    ['uid', 'alias', 'shell', 'rate']
    [501.0, 'karen', 'zsh', 105.3]
    [502.0, 'john', 'bash', 97.5]


Note that `csv` blindly convert numeric values into float. If we want
to convert the UID column to int, we will have to do it ourselves. This
is a limitation of the `csv` library.

# Convert Using JSON

We can combine the `csv` and `json` library for a more precise conversion:


```python
with open(data_path) as stream:
    for row in csv.reader(stream, quoting=csv.QUOTE_NONE):
        row = [json.loads(cell) for cell in row]
        print(row)
```

Output:

    ['uid', 'alias', 'shell', 'rate']
    [501, 'karen', 'zsh', 105.3]
    [502, 'john', 'bash', 97.5]


The advantage of this method is the `json` library can understand
more than just string and numeric, it can also understand boolean,
for example. Consider the following data:


```python
raw = """
"uid","alias","is_admin"
501,"karen",true
502,"john",false
""".strip().splitlines()
```

Conversion using `json` will result in the following data:


```python
for row in csv.reader(raw, quoting=csv.QUOTE_NONE):
    row = [json.loads(cell) for cell in row]
    print(row)
```

Output:

    ['uid', 'alias', 'is_admin']
    [501, 'karen', True]
    [502, 'john', False]

# Conclusion

The key for `csv` to tell if the data is a number (float) or a
string (str) is the quotes: If the data contains quotes, it is a
string. Likewise, if it does not contain quote, then `csv` will convert
that data into float.

Also, for more flexibility, we might want to combine `csv` and `json`
to convert more data types.

