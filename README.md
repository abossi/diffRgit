# DiffRgit

Create an HTML git diff widget using the diff2html library.

[![N|Solid](https://cldup.com/dTxpPi9lDf.thumb.png)](https://codepen.io/salc2/pen/gwdxrB)


### Installation

Install the dependencies:

```sh
> require(devtools)
> install_github("abossi/diffRgit")
```

### Exemple

```sh
> diff <- "diff --git a/../diff2widget/file1 b/../diff2widget/file2\nindex ab63d51..eb01961 100644\n--- a/../diff2widget/file1\n+++ b/../diff2widget/file2\n@@ -1,5 +1,4 @@\n-hello!\n+hello world!\n Where is Bryan?\n+Bryan is in the kitchen.\n bye!\n-\n-oups!"

> diffRgit(diff)
```

result:

![view.png](view.png)

### Diff format

To generate the string 'l_diff', you can use:


```sh
> l_diff <- system("git diff [file1]")
> l_diff <- paste0(l_diff, collapse='\n')
> diffRgit(l_diff)
```

to compare current file with the last commit.


```sh
> l_diff <- system("git diff [SHA] -- [file1]")
> l_diff <- paste0(l_diff, collapse='\n')
> diffRgit(l_diff)
```

to compare current file with the [SHA] commit.


```sh
> l_diff <- system("git diff [SHA1] [SHA2] [file1]")
> l_diff <- paste0(l_diff, collapse='\n')
> diffRgit(l_diff)
```

to compare current 2 commits.


```sh
> l_diff <- system("diff -u [file1] [file2]")
> l_diff <- paste0(l_diff, collapse='\n')
> diffRgit(l_diff)
```

if you don't use git and you realy whant use this widget!

### License

License GPL3
