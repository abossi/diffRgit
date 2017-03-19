# diffRgit

Create an HTML git diff widget using the diff2html library.

[![N|Solid](https://cldup.com/dTxpPi9lDf.thumb.png)](https://codepen.io/salc2/pen/gwdxrB)


### Installation

Install the dependencies:

```sh
> require(devtools)
> install_github("abossi/diffRgit")
```

### exemple

```sh
> diff <- "diff --git a/README.md b/README.md\r\nindex 132c8a2..46909f2 100644\r\n--- a/README.md\r\n+++ b/README.md\r\n@ -98,6 +98,9 @ The HTML output accepts a Javascript object with configuration. Possible options\r\n   - `synchronisedScroll`: scroll both panes in side-by-side mode: `true` or `false`, default is `false`\r\n   - `matchWordsThreshold`: similarity threshold for word matching, default is 0.25\r\n   - `matchingMaxComparisons`: perform at most this much comparisons for line matching a block of changes, default is `2500`\r\n+  - `templates`: object with previously compiled templates to replace parts of the html\r\n+  - `rawTemplates`: object with raw not compiled templates to replace parts of the html\r\n+  > For more information regarding the possible templates look into [src/templates](https://github.com/rtfpessoa/diff2html/tree/master/src/templates)\r\n \r\n ## Diff2HtmlUI Helper"

> diffRgit(diff)
```

result:

![view.png](view.png)
