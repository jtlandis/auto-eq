# Auto-eq Extension For Quarto

Adds an arbitrary label behind any equation using `$$ $$` notation, such that each equation in the document will be numbered. This arbitrary label can theoretically be cross referenced, but it is recommended not to do this because labels are given at render time.

## Installing

```bash
quarto add jtlandis/auto-eq
```

This will install the extension under the `_extensions` subdirectory.
If you're using version control, you will want to check in this directory.

## Using

Simply add `auto-eq` under the `filters:` yml header of your document.

````qmd
---
title: "Untitled"
filter:
  - auto-eq
---
````

### Embedding Filter

If you are embedding this filter within another extension, such as a format, then you may add it like so:

```bash
quarto add jtlandis/auto-eq --embed my-extension
```

You will then need to add additional headers under the `common:` field of your extension's yml file. Consider [this](https://quarto.org/docs/extensions/formats.html#common-metadata) resource as a guide

```yml
contributes:
  formats:
    common:
      filters:
        - auto-eq
```

## Example

Here is the source code for a minimal example: [example.qmd](example.qmd).

