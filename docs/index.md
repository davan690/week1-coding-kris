--- 
title: "The effect of ticks on running speed of lizards"
subtitle: "An implementation in R Markdown"
author: "Kris Wilde and Anthony Davidson"
date: "2019-08-17"
site: bookdown::bookdown_site
documentclass: book
bibliography: [book.bib, packages.bib]
biblio-style: apalike
link-citations: yes
description: "This is a minimal example of using the bookdown package to write a book. The output format for this example is bookdown::gitbook."
---

# Components

This chapter demonstrates the syntax of common components of a book written in **bookdown**, including code chunks, figures, tables, citations, math theorems, and equations. The approach is based on Pandoc, so we start with the syntax of Pandoc's\index{Pandoc} flavor of Markdown.

## Markdown syntax

In this section, we give a very brief introduction to Pandoc's Markdown\index{Markdown}. Readers who are familiar with Markdown can skip this section. The comprehensive syntax of Pandoc's Markdown can be found on the Pandoc website <http://pandoc.org>.

### Inline formatting

You can make text _italic_ by surrounding it with underscores or asterisks, e.g., `_text_` or `*text*`. For **bold** text, use two underscores (`__text__`) or asterisks (`**text**`). Text surrounded by `~` will be converted to a subscript (e.g., `H~2~SO~4~` renders H~2~SO~4~), and similarly, two carets (`^`) produce a superscript (e.g., `Fe^2+^` renders Fe^2+^). To mark text as `inline code`, use a pair of backticks, e.g., `` `code` ``.^[To include literal backticks, use more backticks outside, e.g., you can use two backticks to preserve one backtick inside: ``` `` `code` `` ```.] Small caps can be produced by the HTML tag `span`, e.g., `<span style="font-variant:small-caps;">Small Caps</span>` renders <span style="font-variant:small-caps;">Small Caps</span>. Links are created using `[text](link)`, e.g., `[RStudio](https://www.rstudio.com)`, and the syntax for images is similar: just add an exclamation mark, e.g., `![alt text or image title](path/to/image)`. Footnotes are put inside the square brackets after a caret `^[]`, e.g., `^[This is a footnote.]`. We will talk about citations in Section \@ref(citations).

### Block-level elements

Section headers can be written after a number of pound signs, e.g.,

```markdown
# First-level header

## Second-level header

### Third-level header
```

If you do not want a certain heading to be numbered, you can add `{-}` after the heading, e.g.,

```markdown
# Preface {-}
```

Unordered list items start with `*`, `-`, or `+`, and you can nest one list within another list by indenting the sub-list by four spaces, e.g.,

```markdown
- one item
- one item
- one item
    - one item
    - one item
```

The output is:

- one item
- one item
- one item
    - one item
    - one item

Ordered list items start with numbers (the rule for nested lists is the same as above), e.g.,

```markdown
1. the first item
2. the second item
3. the third item
```

The output does not look too much different with the Markdown source:

1. the first item
2. the second item
3. the third item

Blockquotes are written after `>`, e.g.,

```markdown
> "I thoroughly disapprove of duels. If a man should challenge me,
  I would take him kindly and forgivingly by the hand and lead him
  to a quiet place and kill him."
>
> --- Mark Twain
```

The actual output (we customized the style for blockquotes in this book):

> "I thoroughly disapprove of duels. If a man should challenge me,
  I would take him kindly and forgivingly by the hand and lead him
  to a quiet place and kill him."
>
> --- Mark Twain

Plain code blocks can be written after three or more backticks, and you can also indent the blocks by four spaces, e.g.,

````markdown
```
This text is displayed verbatim / preformatted
```

Or indent by four spaces:

    This text is displayed verbatim / preformatted
````

### Math expressions

Inline LaTeX equations\index{LaTeX math expression} can be written in a pair of dollar signs using the LaTeX syntax, e.g., `$f(k) = {n \choose k} p^{k} (1-p)^{n-k}$` (actual output: $f(k)={n \choose k}p^{k}(1-p)^{n-k}$); math expressions of the display style can be written in a pair of double dollar signs, e.g., `$$f(k) = {n \choose k} p^{k} (1-p)^{n-k}$$`, and the output looks like this:

$$f\left(k\right)=\binom{n}{k}p^k\left(1-p\right)^{n-k}$$

You can also use math environments inside `$ $` or `$$ $$`, e.g.,

```latex
$$\begin{array}{ccc}
x_{11} & x_{12} & x_{13}\\
x_{21} & x_{22} & x_{23}
\end{array}$$
```

$$\begin{array}{ccc}
x_{11} & x_{12} & x_{13}\\
x_{21} & x_{22} & x_{23}
\end{array}$$

```latex
$$X = \begin{bmatrix}1 & x_{1}\\
1 & x_{2}\\
1 & x_{3}
\end{bmatrix}$$
```

$$X = \begin{bmatrix}1 & x_{1}\\
1 & x_{2}\\
1 & x_{3}
\end{bmatrix}$$

```latex
$$\Theta = \begin{pmatrix}\alpha & \beta\\
\gamma & \delta
\end{pmatrix}$$
```

$$\Theta = \begin{pmatrix}\alpha & \beta\\
\gamma & \delta
\end{pmatrix}$$

```latex
$$\begin{vmatrix}a & b\\
c & d
\end{vmatrix}=ad-bc$$
```

$$\begin{vmatrix}a & b\\
c & d
\end{vmatrix}=ad-bc$$

## Markdown extensions by bookdown

Although Pandoc's Markdown is much richer than the original Markdown syntax, it still lacks a number of things that we may need for academic writing. For example, it supports math equations, but you cannot number and reference equations in multi-page HTML or EPUB output. We have provided a few Markdown extensions in **bookdown** to fill the gaps.

### Number and reference equations {#equations}

To number and refer to equations\index{equation}\index{cross-reference}, put them in the equation environments and assign labels to them using the syntax `(\#eq:label)`, e.g.,

```latex
\begin{equation} 
  f\left(k\right) = \binom{n}{k} p^k\left(1-p\right)^{n-k}
  (\#eq:binom)
\end{equation} 
```

It renders the equation below:

\begin{equation}
f\left(k\right)=\binom{n}{k}p^k\left(1-p\right)^{n-k} (\#eq:binom)
\end{equation}

You may refer to it using `\@ref(eq:binom)`, e.g., see Equation \@ref(eq:binom).

\BeginKnitrBlock{rmdcaution}<div class="rmdcaution">Equation labels must start with the prefix `eq:` in **bookdown**. All labels in **bookdown** must only contain alphanumeric characters, `:`, `-`, and/or `/`. Equation references work best for LaTeX/PDF output, and they are not well supported in Word output or e-books. For HTML output, **bookdown** can only number the equations with labels. Please make sure equations without labels are not numbered by either using the `equation*` environment or adding `\nonumber` or `\notag` to your equations. The same rules apply to other math environments, such as `eqnarray`, `gather`, `align`, and so on (e.g., you can use the `align*` environment).</div>\EndKnitrBlock{rmdcaution}

We demonstrate a few more math equation environments below. Here is an unnumbered equation using the `equation*` environment:

```latex
\begin{equation*} 
\frac{d}{dx}\left( \int_{a}^{x} f(u)\,du\right)=f(x)
\end{equation*} 
```

\begin{equation*}
\frac{d}{dx}\left( \int_{a}^{x} f(u)\,du\right)=f(x)
\end{equation*}

Below is an `align` environment \@ref(eq:align):

```latex
\begin{align} 
g(X_{n}) &= g(\theta)+g'({\tilde{\theta}})(X_{n}-\theta) \notag \\
\sqrt{n}[g(X_{n})-g(\theta)] &= g'\left({\tilde{\theta}}\right)
  \sqrt{n}[X_{n}-\theta ] (\#eq:align)
\end{align} 
```

\begin{align}
g(X_{n}) &= g(\theta)+g'({\tilde{\theta}})(X_{n}-\theta) \notag \\
\sqrt{n}[g(X_{n})-g(\theta)] &= g'\left({\tilde{\theta}}\right)
  \sqrt{n}[X_{n}-\theta ] (\#eq:align)
\end{align}

You can use the `split` environment inside `equation` so that all lines share the same number \@ref(eq:var-beta). By default, each line in the `align` environment will be assigned an equation number. We suppressed the number of the first line in the previous example using `\notag`. In this example, the whole `split` environment was assigned a single number.

```latex
\begin{equation} 
\begin{split}
\mathrm{Var}(\hat{\beta}) & =\mathrm{Var}((X'X)^{-1}X'y)\\
 & =(X'X)^{-1}X'\mathrm{Var}(y)((X'X)^{-1}X')'\\
 & =(X'X)^{-1}X'\mathrm{Var}(y)X(X'X)^{-1}\\
 & =(X'X)^{-1}X'\sigma^{2}IX(X'X)^{-1}\\
 & =(X'X)^{-1}\sigma^{2}
\end{split}
(\#eq:var-beta)
\end{equation} 
```

\begin{equation}
\begin{split}
\mathrm{Var}(\hat{\beta}) & =\mathrm{Var}((X'X)^{-1}X'y)\\
 & =(X'X)^{-1}X'\mathrm{Var}(y)((X'X)^{-1}X')'\\
 & =(X'X)^{-1}X'\mathrm{Var}(y)X(X'X)^{-1}\\
 & =(X'X)^{-1}X'\sigma^{2}IX(X'X)^{-1}\\
 & =(X'X)^{-1}\sigma^{2}
\end{split}
(\#eq:var-beta)
\end{equation}

### Theorems and proofs {#theorems}

Theorems\index{theorem} and proofs are commonly used in articles and books in mathematics. However, please do not be misled by the names: a "theorem" is just a numbered/labeled environment, and it does not have to be a mathematical theorem (e.g., it can be an example irrelevant to mathematics). Similarly, a "proof" is an unnumbered environment. In this section, we always use the _general_ meanings of a "theorem" and "proof" unless explicitly stated.

In **bookdown**, the types of theorem environments supported are in Table \@ref(tab:theorem-envs). To write a theorem, you can use the syntax below:

````markdown
```{theorem}
Here is my theorem.
```
````

(ref:theorem-envs) Theorem environments in **bookdown**.


Table: (\#tab:theorem-envs)(ref:theorem-envs)

Environment   Printed Name   Label Prefix 
------------  -------------  -------------
theorem       Theorem        thm          
lemma         Lemma          lem          
corollary     Corollary      cor          
proposition   Proposition    prp          
conjecture    Conjecture     cnj          
definition    Definition     def          
example       Example        exm          
exercise      Exercise       exr          

To write other theorem environments, replace ```` ```{theorem} ```` with other environment names in Table \@ref(tab:theorem-envs), e.g., ```` ```{lemma} ````.

A theorem can have a `name` option so its name will be printed, e.g.,

````markdown
```{theorem, name="Pythagorean theorem"}
For a right triangle, if $c$ denotes the length of the hypotenuse
and $a$ and $b$ denote the lengths of the other two sides, we have
$$a^2 + b^2 = c^2$$
```
````

If you want to refer to a theorem, you should label it. The label can be written after ```` ```{theorem````, e.g.,

````markdown
```{theorem, label="foo"}
A labeled theorem here.
```
````

The `label` option can be implicit, e.g., the following theorem has the label `bar`:

````markdown
```{theorem, bar}
A labeled theorem here.
```
````

After you label a theorem, you can refer to it using the syntax `\@ref(prefix:label)`.\index{cross-reference} See the column `Label Prefix` in Table \@ref(tab:theorem-envs) for the value of `prefix` for each environment. For example, we have a labeled and named theorem below, and `\@ref(thm:pyth)` gives us its theorem number \@ref(thm:pyth):

````markdown
```{theorem, pyth, name="Pythagorean theorem"}
For a right triangle, if $c$ denotes the length of the hypotenuse
and $a$ and $b$ denote the lengths of the other two sides, we have

$$a^2 + b^2 = c^2$$
```
````

\BeginKnitrBlock{theorem}\iffalse{-91-80-121-116-104-97-103-111-114-101-97-110-32-116-104-101-111-114-101-109-93-}\fi{}<div class="theorem"><span class="theorem" id="thm:pyth"><strong>(\#thm:pyth)  \iffalse (Pythagorean theorem) \fi{} </strong></span>For a right triangle, if $c$ denotes the length of the hypotenuse
and $a$ and $b$ denote the lengths of the other two sides, we have

$$a^2 + b^2 = c^2$$</div>\EndKnitrBlock{theorem}

The proof environments currently supported are `proof`, `remark`, and `solution`. The syntax is similar to theorem environments, and proof environments can also be named. The only difference is that since they are unnumbered, you cannot reference them.

We have tried to make all these theorem and proof environments work out of the box, no matter if your output is PDF, HTML, or EPUB. If you are a LaTeX or HTML expert, you may want to customize the style of these environments anyway (see Chapter \@ref(customization)). Customization in HTML is easy with CSS, and each environment is enclosed in `<div></div>` with the CSS class being the environment name, e.g., `<div class="lemma"></div>`. For LaTeX output, we have predefined the style to be `definition` for environments `definition`, `example`, and `exercise`, and `remark` for environments `proof` and `remark`. All other environments use the `plain` style. The style definition is done through the `\theoremstyle{}` command of the **amsthm** package.

Theorems are numbered by chapters by default. If there are no chapters in your document, they are numbered by sections instead. If the whole document is unnumbered (the output format option `number_sections = FALSE`), all theorems are numbered sequentially from 1, 2, ..., N. LaTeX supports numbering one theorem environment after another, e.g., let theorems and lemmas share the same counter. This is not supported for HTML/EPUB output in **bookdown**. You can change the numbering scheme in the LaTeX preamble by defining your own theorem environments, e.g.,

```latex
\newtheorem{theorem}{Theorem}
\newtheorem{lemma}[theorem]{Lemma}
```

When **bookdown** detects `\newtheorem{theorem}` in your LaTeX preamble, it will not write out its default theorem definitions, which means you have to define all theorem environments by yourself. For the sake of simplicity and consistency, we do not recommend that you do this. It can be confusing when your Theorem 18 in PDF becomes Theorem 2.4 in HTML.

Theorem and proof environments will be hidden if the chunk option `echo` is set to `FALSE`. To make sure they are always shown, you may add the chunk option `echo=TRUE`, e.g.,

````markdown
```{theorem, echo=TRUE}
Here is my theorem.
```
````

Below we show more examples^[Some examples are adapted from the Wikipedia page https://en.wikipedia.org/wiki/Characteristic_function_(probability_theory)] of the theorem and proof environments, so you can see the default styles in **bookdown**.

\BeginKnitrBlock{definition}<div class="definition"><span class="definition" id="def:unnamed-chunk-2"><strong>(\#def:unnamed-chunk-2) </strong></span>The characteristic function of a random variable $X$ is defined by

$$\varphi _{X}(t)=\operatorname {E} \left[e^{itX}\right], \; t\in\mathcal{R}$$</div>\EndKnitrBlock{definition}


\BeginKnitrBlock{example}<div class="example"><span class="example" id="exm:unnamed-chunk-3"><strong>(\#exm:unnamed-chunk-3) </strong></span>We derive the characteristic function of $X\sim U(0,1)$ with the probability density function $f(x)=\mathbf{1}_{x \in [0,1]}$.

\begin{equation*}
\begin{split}
\varphi _{X}(t) &= \operatorname {E} \left[e^{itX}\right]\\
 & =\int e^{itx}f(x)dx\\
 & =\int_{0}^{1}e^{itx}dx\\
 & =\int_{0}^{1}\left(\cos(tx)+i\sin(tx)\right)dx\\
 & =\left.\left(\frac{\sin(tx)}{t}-i\frac{\cos(tx)}{t}\right)\right|_{0}^{1}\\
 & =\frac{\sin(t)}{t}-i\left(\frac{\cos(t)-1}{t}\right)\\
 & =\frac{i\sin(t)}{it}+\frac{\cos(t)-1}{it}\\
 & =\frac{e^{it}-1}{it}
\end{split}
\end{equation*}

Note that we used the fact $e^{ix}=\cos(x)+i\sin(x)$ twice.</div>\EndKnitrBlock{example}

\BeginKnitrBlock{lemma}<div class="lemma"><span class="lemma" id="lem:chf-pdf"><strong>(\#lem:chf-pdf) </strong></span>For any two random variables $X_1$, $X_2$, they both have the same probability distribution if and only if

$$\varphi _{X_1}(t)=\varphi _{X_2}(t)$$</div>\EndKnitrBlock{lemma}

\BeginKnitrBlock{theorem}<div class="theorem"><span class="theorem" id="thm:chf-sum"><strong>(\#thm:chf-sum) </strong></span>If $X_1$, ..., $X_n$ are independent random variables, and $a_1$, ..., $a_n$ are some constants, then the characteristic function of the linear combination $S_n=\sum_{i=1}^na_iX_i$ is

$$\varphi _{S_{n}}(t)=\prod_{i=1}^n\varphi _{X_i}(a_{i}t)=\varphi _{X_{1}}(a_{1}t)\cdots \varphi _{X_{n}}(a_{n}t)$$</div>\EndKnitrBlock{theorem}

\BeginKnitrBlock{proposition}<div class="proposition"><span class="proposition" id="prp:unnamed-chunk-4"><strong>(\#prp:unnamed-chunk-4) </strong></span>The distribution of the sum of independent Poisson random variables $X_i \sim \mathrm{Pois}(\lambda_i),\: i=1,2,\cdots,n$ is $\mathrm{Pois}(\sum_{i=1}^n\lambda_i)$.</div>\EndKnitrBlock{proposition}

\BeginKnitrBlock{proof}<div class="proof">\iffalse{} <span class="proof"><em>Proof. </em></span>  \fi{}The characteristic function of $X\sim\mathrm{Pois}(\lambda)$ is $\varphi _{X}(t)=e^{\lambda (e^{it}-1)}$. Let $P_n=\sum_{i=1}^nX_i$. We know from Theorem \@ref(thm:chf-sum) that

\begin{equation*}
\begin{split}
\varphi _{P_{n}}(t) & =\prod_{i=1}^n\varphi _{X_i}(t) \\
& =\prod_{i=1}^n e^{\lambda_i (e^{it}-1)} \\
& = e^{\sum_{i=1}^n \lambda_i (e^{it}-1)}
\end{split}
\end{equation*}

This is the characteristic function of a Poisson random variable with the parameter $\lambda=\sum_{i=1}^n \lambda_i$. From Lemma \@ref(lem:chf-pdf), we know the distribution of $P_n$ is $\mathrm{Pois}(\sum_{i=1}^n\lambda_i)$.</div>\EndKnitrBlock{proof}

\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Remark. </em></span>  \fi{}In some cases, it is very convenient and easy to figure out the distribution of the sum of independent random variables using characteristic functions.</div>\EndKnitrBlock{remark}

\BeginKnitrBlock{corollary}<div class="corollary"><span class="corollary" id="cor:unnamed-chunk-7"><strong>(\#cor:unnamed-chunk-7) </strong></span>The characteristic function of the sum of two independent random variables $X_1$ and $X_2$ is the product of characteristic functions of $X_1$ and $X_2$, i.e.,

$$\varphi _{X_1+X_2}(t)=\varphi _{X_1}(t) \varphi _{X_2}(t)$$</div>\EndKnitrBlock{corollary}

\BeginKnitrBlock{exercise}\iffalse{-91-67-104-97-114-97-99-116-101-114-105-115-116-105-99-32-70-117-110-99-116-105-111-110-32-111-102-32-116-104-101-32-83-97-109-112-108-101-32-77-101-97-110-93-}\fi{}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-8"><strong>(\#exr:unnamed-chunk-8)  \iffalse (Characteristic Function of the Sample Mean) \fi{} </strong></span>Let $\bar{X}=\sum_{i=1}^n \frac{1}{n} X_i$ be the sample mean of $n$ independent and identically distributed random variables, each with characteristic function $\varphi _{X}$. Compute the characteristic function of $\bar{X}$. </div>\EndKnitrBlock{exercise}

\BeginKnitrBlock{solution}<div class="solution">\iffalse{} <span class="solution"><em>Solution. </em></span>  \fi{}Applying Theorem \@ref(thm:chf-sum), we have

$$\varphi _{\bar{X}}(t)=\prod_{i=1}^n \varphi _{X_i}\left(\frac{t}{n}\right)=\left[\varphi _{X}\left(\frac{t}{n}\right)\right]^n.$$</div>\EndKnitrBlock{solution}

### Special headers

There are a few special types of first-level headers that will be processed differently in **bookdown**. The first type is an unnumbered header that starts with the token `(PART)`. This kind of headers are translated to part titles\index{part}. If you are familiar with LaTeX, this basically means `\part{}`. When your book has a large number of chapters, you may want to organize them into parts, e.g.,

```
# (PART) Part I {-} 

# Chapter One

# Chapter Two

# (PART) Part II {-} 

# Chapter Three
```

A part title should be written right before the first chapter title in this part. You can use `(PART\*)` (the backslash before `*` is required) instead of `(PART)` if a part title should not be numbered.

The second type is an unnumbered header that starts with `(APPENDIX)`, indicating that all chapters after this header are appendices\index{appendix}, e.g.,

```
# Chapter One 

# Chapter Two

# (APPENDIX) Appendix {-} 

# Appendix A

# Appendix B
```

The numbering style of appendices will be automatically changed in LaTeX/PDF and HTML output (usually in the form A, A.1, A.2, B, B.1, ...). This feature is not available to e-books or Word output.

### Text references

You can assign some text to a label and reference the text using the label elsewhere in your document. This can be particularly useful for long figure/table captions (Section \@ref(figures) and \@ref(tables)), in which case you normally will have to write the whole character string in the chunk header (e.g., `fig.cap = "A long long figure caption."`) or your R code (e.g., `kable(caption = "A long long table caption.")`). It is also useful when these captions contain special HTML or LaTeX characters, e.g., if the figure caption contains an underscore, it works in the HTML output but may not work in LaTeX output because the underscore must be escaped in LaTeX.

The syntax for a text reference is `(ref:label) text`, where `label` is a unique label^[You may consider using the code chunk labels.] throughout the document for `text`. It must be in a separate paragraph with empty lines above and below it. The paragraph must not be wrapped into multiple lines, and should not end with a white space. For example,

```markdown
(ref:foo) Define a text reference **here**. 
```

Then you can use `(ref:foo)` in your figure/table captions. The text can contain anything that Markdown supports, as long as it is one single paragraph. Here is a complete example:

````markdown
A normal paragraph.

(ref:foo) A scatterplot of the data `cars` using **base** R graphics. 

```{r foo, fig.cap='(ref:foo)'}
plot(cars)  # a scatterplot
```
````

Text references can be used anywhere in the document (not limited to figure captions). It can also be useful if you want to reuse a fragment of text in multiple places.

## R code

There are two types of R code in R Markdown/**knitr** documents: R code chunks\index{code chunk}, and inline R code\index{inline R code}. The syntax for the latter is `` `r R_CODE` ``, and it can be embedded inline with other document elements. R code chunks look like plain code blocks, but have `{r}` after the three backticks and (optionally) chunk options inside `{}`, e.g.,

````markdown
```{r chunk-label, echo = FALSE, fig.cap = 'A figure caption.'}
1 + 1
rnorm(10)  # 10 random numbers
plot(dist ~ speed, cars)  # a scatterplot
```
````

To learn more about **knitr** chunk options, see @xie2015 or the web page <http://yihui.name/knitr/options>. For books, additional R code can be executed before/after each chapter; see `before_chapter_script` and `after_chapter_script` in Section \@ref(configuration).

## Figures {#figures}

By default, figures\index{figure} have no captions in the output generated by **knitr**, which means they will be placed wherever they were generated in the R code. Below is such an example.


```r
par(mar = c(4, 4, .1, .1))
plot(pressure, pch = 19, type = 'b')
```

<img src="index_files/figure-html/no-caption-1.png" width="70%" />

The disadvantage of typesetting figures in this way is that when there is not enough space on the current page to place a figure, it may either reach the bottom of the page (hence exceeds the page margin), or be pushed to the next page, leaving a large white margin at the bottom of the current page. That is basically why there are "floating environments"\index{floating environment} in LaTeX: elements that cannot be split over multiple pages (like figures) are put in floating environments, so they can float to a page that has enough space to hold them. There is also a disadvantage of floating things forward or backward, though. That is, readers may have to jump to a different page to find the figure mentioned on the current page. This is simply a natural consequence of having to typeset things on multiple pages of fixed sizes. This issue does not exist in HTML, however, since everything can be placed continuously on one single page (presumably with infinite height), and there is no need to split anything across multiple pages of the same page size.

If we assign a figure caption to a code chunk via the chunk option `fig.cap`, R plots will be put into figure environments, which will be automatically labeled and numbered, and can also be cross-referenced. The label of a figure environment is generated from the label of the code chunk, e.g., if the chunk label is `foo`, the figure label will be `fig:foo` (the prefix `fig:` is added before `foo`). To reference a figure\index{cross-reference}, use the syntax `\@ref(label)`,^[Do not forget the leading backslash! And also note the parentheses `()` after `ref`; they are not curly braces `{}`.] where `label` is the figure label, e.g., `fig:foo`.

To take advantage of Markdown formatting _within_ the figure caption, you will need to use text references (see Section \@ref(text-references)). For example, a figure caption that contains `_italic text_` will not work when the output format is LaTeX/PDF, since the underscore is a special character in LaTeX, but if you use text references, `_italic text_` will be translated to LaTeX code when the output is LaTeX.

\BeginKnitrBlock{rmdimportant}<div class="rmdimportant">If you want to cross-reference figures or tables generated from a code chunk, please make sure the chunk label only contains _alphanumeric_ characters (a-z, A-Z, 0-9), slashes (/), or dashes (-).</div>\EndKnitrBlock{rmdimportant}


The chunk option `fig.asp` can be used to set the aspect ratio of plots, i.e., the ratio of figure height/width. If the figure width is 6 inches (`fig.width = 6`) and `fig.asp = 0.7`, the figure height will be automatically calculated from `fig.width * fig.asp = 6 * 0.7 = 4.2`. Figure \@ref(fig:pressure-plot) is an example using the chunk options `fig.asp = 0.7`, `fig.width = 6`, and `fig.align = 'center'`, generated from the code below:


```r
par(mar = c(4, 4, .1, .1))
plot(pressure, pch = 19, type = 'b')
```

<div class="figure" style="text-align: center">
<img src="index_files/figure-html/pressure-plot-1.png" alt="A figure example with the specified aspect ratio, width, and alignment." width="90%" />
<p class="caption">(\#fig:pressure-plot)A figure example with the specified aspect ratio, width, and alignment.</p>
</div>

The actual size of a plot is determined by the chunk options `fig.width` and `fig.height` (the size of the plot generated from a graphical device), and we can specify the output size of plots via the chunk options `out.width` and `out.height`. The possible value of these two options depends on the output format of the document. For example, `out.width = '30%'` is a valid value for HTML output, but not for LaTeX/PDF output. However, **knitr** will automatically convert a percentage value for `out.width` of the form `x%` to `(x / 100) \linewidth`, e.g., `out.width = '70%'` will be treated as `.7\linewidth` when the output format is LaTeX. This makes it possible to specify a relative width of a plot in a consistent manner. Figure \@ref(fig:cars-plot) is an example of `out.width = 70%`.


```r
par(mar = c(4, 4, .1, .1))
plot(cars, pch = 19)
```

<div class="figure">
<img src="index_files/figure-html/cars-plot-1.png" alt="A figure example with a relative width 70\%." width="70%" />
<p class="caption">(\#fig:cars-plot)A figure example with a relative width 70\%.</p>
</div>

If you want to put multiple plots in one figure environment, you must use the chunk option `fig.show = 'hold'` to hold multiple plots from a code chunk and include them in one environment. You can also place plots side by side if the sum of the width of all plots is smaller than or equal to the current line width. For example, if two plots have the same width `50%`, they will be placed side by side. Similarly, you can specify `out.width = '33%'` to arrange three plots on one line. Figure \@ref(fig:multi-plots) is an example of two plots, each with a width of `50%`.


```r
par(mar = c(4, 4, .1, .1))
plot(pressure, pch = 19, type = 'b')
plot(cars, pch = 19)
```

<div class="figure">
<img src="index_files/figure-html/multi-plots-1.png" alt="Two plots placed side by side." width="50%" /><img src="index_files/figure-html/multi-plots-2.png" alt="Two plots placed side by side." width="50%" />
<p class="caption">(\#fig:multi-plots)Two plots placed side by side.</p>
</div>

Sometimes you may have certain images that are not generated from R code, and you can include them in R Markdown via the function `knitr::include_graphics()`. Figure \@ref(fig:knitr-logo) is an example of three **knitr** logos included in a figure environment. You may pass one or multiple image paths to the `include_graphics()`\index{knitr::include\_graphics()} function, and all chunk options that apply to normal R plots also apply to these images, e.g., you can use `out.width = '33%'` to set the widths of these images in the output document.


```r
knitr::include_graphics(rep('images/knit-logo.png', 3))
```

<div class="figure">
<img src="images/knit-logo.png" alt="Three knitr logos included in the document from an external PNG image file." width="32.8%" /><img src="images/knit-logo.png" alt="Three knitr logos included in the document from an external PNG image file." width="32.8%" /><img src="images/knit-logo.png" alt="Three knitr logos included in the document from an external PNG image file." width="32.8%" />
<p class="caption">(\#fig:knitr-logo)Three knitr logos included in the document from an external PNG image file.</p>
</div>

There are a few advantages of using `include_graphics()`:

1. You do not need to worry about the document output format, e.g., when the output format is LaTeX, you may have to use the LaTeX command `\includegraphics{}` to include an image, and when the output format is Markdown, you have to use `![]()`. The function `include_graphics()` in **knitr** takes care of these details automatically.
1. The syntax for controlling the image attributes is the same as when images are generated from R code, e.g., chunk options `fig.cap`, `out.width`, and `fig.show` still have the same meanings.
1. `include_graphics()` can be smart enough to use PDF graphics automatically when the output format is LaTeX and the PDF graphics files exist, e.g., an image path `foo/bar.png` can be automatically replaced with `foo/bar.pdf` if the latter exists. PDF images often have better qualities than raster images in LaTeX/PDF output. To make use of this feature, set the argument `auto_pdf = TRUE`, or set the global option `options(knitr.graphics.auto_pdf = TRUE)` to enable this feature globally in an R session.
1. You can easily scale these images proportionally using the same ratio. This can be done via the `dpi` argument (dots per inch), which takes the value from the chunk option `dpi` by default. If it is a numeric value and the chunk option `out.width` is not set, the output width of an image will be its actual width (in pixels) divided by `dpi`, and the unit will be inches. For example, for an image with the size 672 x 480, its output width will be 7 inches (`7in`) when `dpi = 96`. This feature requires the package **png** and/or **jpeg** to be installed. You can always override the automatic calculation of width in inches by providing a non-NULL value to the chunk option `out.width`, or use `include_graphics(dpi = NA)`.

## Tables {#tables}

For now, the most convenient way to generate a table\index{table} is the function `knitr::kable()`, because there are some internal tricks in **knitr** to make it work with **bookdown** and users do not have to know anything about these implementation details. We will explain how to use other packages and functions later in this section.

Like figures, tables with captions will also be numbered and can be referenced\index{cross-reference}. The `kable()` function will automatically generate a label for a table environment, which is the prefix `tab:` plus the chunk label. For example, the table label for a code chunk with the label `foo` will be `tab:foo`, and we can still use the syntax `\@ref(label)` to reference the table. Table \@ref(tab:table-single) is a simple example.


```r
knitr::kable(
  head(mtcars[, 1:8], 10), booktabs = TRUE,
  caption = 'A table of the first 10 rows of the mtcars data.'
)
```



Table: (\#tab:table-single)A table of the first 10 rows of the mtcars data.

                      mpg   cyl    disp    hp   drat      wt    qsec   vs
------------------  -----  ----  ------  ----  -----  ------  ------  ---
Mazda RX4            21.0     6   160.0   110   3.90   2.620   16.46    0
Mazda RX4 Wag        21.0     6   160.0   110   3.90   2.875   17.02    0
Datsun 710           22.8     4   108.0    93   3.85   2.320   18.61    1
Hornet 4 Drive       21.4     6   258.0   110   3.08   3.215   19.44    1
Hornet Sportabout    18.7     8   360.0   175   3.15   3.440   17.02    0
Valiant              18.1     6   225.0   105   2.76   3.460   20.22    1
Duster 360           14.3     8   360.0   245   3.21   3.570   15.84    0
Merc 240D            24.4     4   146.7    62   3.69   3.190   20.00    1
Merc 230             22.8     4   140.8    95   3.92   3.150   22.90    1
Merc 280             19.2     6   167.6   123   3.92   3.440   18.30    1

If you want to put multiple tables in a single table environment, wrap the data objects (usually data frames in R) into a list. See Table \@ref(tab:table-multi) for an example. Please note that this feature is only available in HTML and PDF output.


```r
knitr::kable(
  list(
    head(iris[, 1:2], 3),
    head(mtcars[, 1:3], 5)
  ),
  caption = 'A Tale of Two Tables.', booktabs = TRUE
)
```



<table class="kable_wrapper">
<caption>(\#tab:table-multi)A Tale of Two Tables.</caption>
<tbody>
  <tr>
   <td> 

 Sepal.Length   Sepal.Width
-------------  ------------
          5.1           3.5
          4.9           3.0
          4.7           3.2

 </td>
   <td> 

                      mpg   cyl   disp
------------------  -----  ----  -----
Mazda RX4            21.0     6    160
Mazda RX4 Wag        21.0     6    160
Datsun 710           22.8     4    108
Hornet 4 Drive       21.4     6    258
Hornet Sportabout    18.7     8    360

 </td>
  </tr>
</tbody>
</table>

When you do not want a table to float in PDF, you may use the LaTeX package [**longtable**,](https://www.ctan.org/pkg/longtable)\index{longtable} which can break a table across multiple pages. To use **longtable**, pass `longtable = TRUE` to `kable()`, and make sure to include `\usepackage{longtable}` in the LaTeX preamble (see Section \@ref(yaml-options) for how to customize the LaTeX preamble). Of course, this is irrelevant to HTML output, since tables in HTML do not need to float.


```r
knitr::kable(
  iris[1:55, ], longtable = TRUE, booktabs = TRUE,
  caption = 'A table generated by the longtable package.'
)
```



Table: (\#tab:longtable)A table generated by the longtable package.

 Sepal.Length   Sepal.Width   Petal.Length   Petal.Width  Species    
-------------  ------------  -------------  ------------  -----------
          5.1           3.5            1.4           0.2  setosa     
          4.9           3.0            1.4           0.2  setosa     
          4.7           3.2            1.3           0.2  setosa     
          4.6           3.1            1.5           0.2  setosa     
          5.0           3.6            1.4           0.2  setosa     
          5.4           3.9            1.7           0.4  setosa     
          4.6           3.4            1.4           0.3  setosa     
          5.0           3.4            1.5           0.2  setosa     
          4.4           2.9            1.4           0.2  setosa     
          4.9           3.1            1.5           0.1  setosa     
          5.4           3.7            1.5           0.2  setosa     
          4.8           3.4            1.6           0.2  setosa     
          4.8           3.0            1.4           0.1  setosa     
          4.3           3.0            1.1           0.1  setosa     
          5.8           4.0            1.2           0.2  setosa     
          5.7           4.4            1.5           0.4  setosa     
          5.4           3.9            1.3           0.4  setosa     
          5.1           3.5            1.4           0.3  setosa     
          5.7           3.8            1.7           0.3  setosa     
          5.1           3.8            1.5           0.3  setosa     
          5.4           3.4            1.7           0.2  setosa     
          5.1           3.7            1.5           0.4  setosa     
          4.6           3.6            1.0           0.2  setosa     
          5.1           3.3            1.7           0.5  setosa     
          4.8           3.4            1.9           0.2  setosa     
          5.0           3.0            1.6           0.2  setosa     
          5.0           3.4            1.6           0.4  setosa     
          5.2           3.5            1.5           0.2  setosa     
          5.2           3.4            1.4           0.2  setosa     
          4.7           3.2            1.6           0.2  setosa     
          4.8           3.1            1.6           0.2  setosa     
          5.4           3.4            1.5           0.4  setosa     
          5.2           4.1            1.5           0.1  setosa     
          5.5           4.2            1.4           0.2  setosa     
          4.9           3.1            1.5           0.2  setosa     
          5.0           3.2            1.2           0.2  setosa     
          5.5           3.5            1.3           0.2  setosa     
          4.9           3.6            1.4           0.1  setosa     
          4.4           3.0            1.3           0.2  setosa     
          5.1           3.4            1.5           0.2  setosa     
          5.0           3.5            1.3           0.3  setosa     
          4.5           2.3            1.3           0.3  setosa     
          4.4           3.2            1.3           0.2  setosa     
          5.0           3.5            1.6           0.6  setosa     
          5.1           3.8            1.9           0.4  setosa     
          4.8           3.0            1.4           0.3  setosa     
          5.1           3.8            1.6           0.2  setosa     
          4.6           3.2            1.4           0.2  setosa     
          5.3           3.7            1.5           0.2  setosa     
          5.0           3.3            1.4           0.2  setosa     
          7.0           3.2            4.7           1.4  versicolor 
          6.4           3.2            4.5           1.5  versicolor 
          6.9           3.1            4.9           1.5  versicolor 
          5.5           2.3            4.0           1.3  versicolor 
          6.5           2.8            4.6           1.5  versicolor 

Pandoc supports several types of [Markdown tables,](http://pandoc.org/MANUAL.html#tables) such as simple tables, multiline tables, grid tables, and pipe tables. What `knitr::kable()` generates is a simple table like this:

```markdown
Table: A simple table in Markdown.

 Sepal.Length   Sepal.Width   Petal.Length   Petal.Width
-------------  ------------  -------------  ------------
          5.1           3.5            1.4           0.2
          4.9           3.0            1.4           0.2
          4.7           3.2            1.3           0.2
          4.6           3.1            1.5           0.2
          5.0           3.6            1.4           0.2
          5.4           3.9            1.7           0.4
```

You can use any types of Markdown tables in your document. To be able to cross-reference a Markdown table, it must have a labeled caption of the form `Table: (\#label) Caption here`, where `label` must have the prefix `tab:`, e.g., `tab:simple-table`.

If you decide to use other R packages to generate tables, you have to make sure the label for the table environment appears in the beginning of the table caption in the form `(\#label)` (again, `label` must have the prefix `tab:`). You have to be very careful about the _portability_ of the table generating function: it should work for both HTML and LaTeX output automatically, so it must consider the output format internally (check `knitr::opts_knit$get('rmarkdown.pandoc.to')`). When writing out an HTML table, the caption must be written in the `<caption></caption>` tag. For simple tables, `kable()` should suffice. If you have to create complicated tables (e.g., with certain cells spanning across multiple columns/rows), you will have to take the aforementioned issues into consideration.

## Cross-references

We have explained how cross-references\index{cross-reference} work for equations (Section \@ref(equations)), theorems (Section \@ref(theorems)), figures (Section \@ref(figures)), and tables (Section \@ref(tables)). In fact, you can also reference sections using the same syntax `\@ref(label)`, where `label` is the section ID. By default, Pandoc will generate an ID for all section headers, e.g., a section `# Hello World` will have an ID `hello-world`. We recommend you to manually assign an ID to a section header to make sure you do not forget to update the reference label after you change the section header. To assign an ID to a section header, simply add `{#id}` to the end of the section header.  Further attributes of section headers can be set using standard [Pandoc syntax](http://pandoc.org/MANUAL.html#header-identifiers).

When a referenced label cannot be found, you will see two question marks like \@ref(fig:does-not-exist), as well as a warning message in the R console when rendering the book.

You can also create text-based links using explicit or automatic section IDs or even the actual section header text.

- If you are happy with the section header as the link text, use it inside a single set of square brackets:
    - `[Section header text]`: example "[A single document]" via `[A single document]`

- There are two ways to specify custom link text:
    - `[link text][Section header text]`, e.g., "[non-English books][Internationalization]" via `[non-English books][Internationalization]`
    - `[link text](#ID)`, e.g., "[Table stuff](#tables)" via `[Table stuff](#tables)`

The Pandoc documentation provides more details on [automatic section IDs](http://pandoc.org/MANUAL.html#extension-auto_identifiers) and [implicit header references.](http://pandoc.org/MANUAL.html#extension-implicit_header_references)

Cross-references still work even when we refer to an item that is not on the current page of the PDF or HTML output. For example, see Equation \@ref(eq:binom) and Figure \@ref(fig:knitr-logo).

## Custom blocks

You can generate custom blocks\index{custom block} using the `block` engine in **knitr**, i.e., the chunk option `engine = 'block'`, or the more compact syntax ```` ```{block} ````. This engine should be used in conjunction with the chunk option `type`, which takes a character string. When the `block` engine is used, it generates a `<div>` to wrap the chunk content if the output format is HTML, and a LaTeX environment if the output is LaTeX. The `type` option specifies the class of the `<div>` and the name of the LaTeX environment. For example, the HTML output of this chunk

````markdown
```{block, type='FOO'}
Some text for this block.
```
````

will be this:

```html
<div class="FOO">
Some text for this block.
</div>
```

and the LaTeX output will be this:

```latex
\begin{FOO}
Some text for this block.
\end{FOO}
```

It is up to the book author how to define the style of the block. You can define the style of the `<div>` in CSS and include it in the output via the `includes` option in the YAML metadata. Similarly, you may define the LaTeX environment via `\newenvironment` and include the definition in the LaTeX output via the `includes` option. For example, we may save the following style in a CSS file, say, `style.css`:

```css
div.FOO {
  font-weight: bold;
  color: red;
}
```

And the YAML metadata of the R Markdown document can be:

```yaml
---
output:
  bookdown::html_book:
    includes:
      in_header: style.css
---
```

We have defined a few types of blocks for this book to show notes, tips, and warnings, etc. Below are some examples:

\BeginKnitrBlock{rmdnote}<div class="rmdnote">R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under the terms of the
GNU General Public License versions 2 or 3.
For more information about these matters see
http://www.gnu.org/licenses/.</div>\EndKnitrBlock{rmdnote}

\BeginKnitrBlock{rmdcaution}<div class="rmdcaution">R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under the terms of the
GNU General Public License versions 2 or 3.
For more information about these matters see
http://www.gnu.org/licenses/.</div>\EndKnitrBlock{rmdcaution}


\BeginKnitrBlock{rmdimportant}<div class="rmdimportant">R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under the terms of the
GNU General Public License versions 2 or 3.
For more information about these matters see
http://www.gnu.org/licenses/.</div>\EndKnitrBlock{rmdimportant}

\BeginKnitrBlock{rmdtip}<div class="rmdtip">R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under the terms of the
GNU General Public License versions 2 or 3.
For more information about these matters see
http://www.gnu.org/licenses/.</div>\EndKnitrBlock{rmdtip}

\BeginKnitrBlock{rmdwarning}<div class="rmdwarning">R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under the terms of the
GNU General Public License versions 2 or 3.
For more information about these matters see
http://www.gnu.org/licenses/.</div>\EndKnitrBlock{rmdwarning}

The **knitr** `block` engine was designed to display simple content (typically a paragraph of plain text). You can use simple formatting syntax such as making certain words bold or italic, but more advanced syntax such as citations and cross-references will not work. However, there is an alternative engine named `block2` that supports arbitrary Markdown syntax, e.g.,

````markdown
```{block2, type='FOO'}
Some text for this block [@citation-key].

- a list item
- another item

More text.
```
````

The `block2` engine should also be faster than the `block` engine if you have a lot of custom blocks in the document, but its implementation was based on [a hack,](https://github.com/jgm/pandoc/issues/2453) so we are not 100% sure if it is always going to work in the future. We have not seen problems with Pandoc v1.17.2 yet.

One more caveat for the `block2` engine: if the last element in the block is not an ordinary paragraph, you must leave a blank line at the end, e.g.,

````markdown
```{block2, type='FOO'}
Some text for this block [@citation-key].

- a list item
- another item
- end the list with a blank line

```
````

The theorem and proof environments in Section \@ref(theorems) are actually implemented through the `block2` engine.

For all custom blocks based on the `block` or `block2` engine, there is one chunk option `echo` that you can use to show (`echo = TRUE`) or hide (`echo = FALSE`) the blocks.

## Citations {#citations}

Although Pandoc supports multiple ways of writing citations\index{citation}, we recommend you to use BibTeX\index{BibTeX} databases because they work best with LaTeX/PDF output. Pandoc can process other types of bibliography databases with the utility `pandoc-citeproc` (<https://github.com/jgm/pandoc-citeproc>), but it may not render certain bibliography items correctly (especially in case of multiple authors per item), and BibTeX can do a better job when the output format is LaTeX. With BibTeX databases, you will be able to define the bibliography style if it is required by a certain publisher or journal.

A BibTeX database is a plain-text file (with the conventional filename extension `.bib`) that consists of bibliography entries like this:

```bibtex
@Manual{R-base,
  title = {R: A Language and Environment for Statistical
    Computing},
  author = {{R Core Team}},
  organization = {R Foundation for Statistical Computing},
  address = {Vienna, Austria},
  year = {2016},
  url = {https://www.R-project.org/},
}
```

A bibliography entry starts with `@type{`, where `type` may be `article`, `book`, `manual`, and so on.^[The type name is case-insensitive, so it does not matter if it is `manual`, `Manual`, or `MANUAL`.] Then there is a citation key, like `R-base` in the above example. To cite an entry, use `@key` or `[@key]` (the latter puts the citation in braces), e.g., `@R-base` is rendered as @R-base, and `[@R-base]` generates "[@R-base]". If you are familiar with the **natbib** package in LaTeX, `@key` is basically `\citet{key}`, and `[@key]` is equivalent to `\citep{key}`.

There are a number of fields in a bibliography entry, such as `title`, `author`, and `year`, etc. You may see https://en.wikipedia.org/wiki/BibTeX for possible types of entries and fields in BibTeX.

There is a helper function `write_bib()` in **knitr** to generate BibTeX entries automatically for R packages. Note that it only generates one BibTeX entry for the package itself at the moment, whereas a package may contain multiple entries in the `CITATION` file, and some entries are about the publications related to the package. These entries are ignored by `write_bib()`.


```r
# the second argument can be a .bib file
knitr::write_bib(c('knitr', 'stringr'), '', width = 60)
```

```
@Manual{R-knitr,
  title = {knitr: A General-Purpose Package for Dynamic Report
    Generation in R},
  author = {Yihui Xie},
  year = {2019},
  note = {R package version 1.23},
  url = {https://CRAN.R-project.org/package=knitr},
}
@Manual{R-stringr,
  title = {stringr: Simple, Consistent Wrappers for Common
    String Operations},
  author = {Hadley Wickham},
  year = {2019},
  note = {R package version 1.4.0},
  url = {https://CRAN.R-project.org/package=stringr},
}
```

Once you have one or multiple `.bib` files, you may use the field `bibliography` in the YAML metadata of your first R Markdown document (which is typically `index.Rmd`), and you can also specify the bibliography style via `biblio-style` (this only applies to PDF output), e.g.,

```yaml
---
bibliography: ["one.bib", "another.bib", "yet-another.bib"]
biblio-style: "apalike"
link-citations: true
---
```

The field `link-citations` can be used to add internal links from the citation text of the author-year style to the bibliography entry in the HTML output.

When the output format is LaTeX, citations will be automatically put in a chapter or section. For non-LaTeX output, you can add an empty chapter as the last chapter of your book. For example, if your last chapter is the Rmd file `06-references.Rmd`, its content can be an inline R expression:

```markdown
`r if (knitr::is_html_output()) '# References {-}'`
```

## Index {#latex-index}

Currently the index\index{index} is only supported for LaTeX/PDF output. To print an index after the book, you can use the LaTeX package **makeidx** in the preamble (see Section \@ref(yaml-options)):

```latex
\usepackage{makeidx}
\makeindex
```

Then insert `\printindex` at the end of your book through the YAML option `includes -> after_body`. An index entry can be created via the `\index{}` command in the book body, e.g., `\index{GIT}`.

## HTML widgets

Although one of R's greatest strengths is data visualization, there are a large number of JavaScript libraries for much richer data visualization. These libraries can be used to build interactive applications that can easily render in web browsers, so users do not need to install any additional software packages to view the visualizations. One way to bring these JavaScript libraries into R is through the [**htmlwidgets**](http://htmlwidgets.org) package [@R-htmlwidgets]\index{HTML widget}. 

HTML widgets can be rendered as a standalone web page (like an R plot), or embedded in R Markdown documents and Shiny applications. They were originally designed for HTML output only, and they require the availability of JavaScript, so they will not work in non-HTML output formats, such as LaTeX/PDF. Before **knitr** v1.13, you will get an error when you render HTML widgets to an output format that is not HTML. Since **knitr** v1.13, HTML widgets will be rendered automatically as screenshots taken via the **webshot** package [@R-webshot]. Of course, you need to install the **webshot** package. Additionally, you have to install PhantomJS (http://phantomjs.org), since it is what **webshot** uses to capture screenshots. Both **webshot** and PhantomJS can be installed automatically from R:


```r
install.packages('webshot')
webshot::install_phantomjs()
```

The function `install_phantomjs()` works for Windows, OS X, and Linux. You may also choose to download and install PhantomJS by yourself, if you are familiar with modifying the system environment variable `PATH`.

When **knitr** detects an HTML widget object in a code chunk, it either renders the widget normally when the current output format is HTML, or saves the widget as an HTML page and calls **webshot** to capture the screen of the HTML page when the output format is not HTML. Here is an example of a table created from the **DT** package [@R-DT]:


```r
DT::datatable(iris)
```

<div class="figure">
<!--html_preserve--><div id="htmlwidget-0f3a1b4252bfd8a68b6b" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-0f3a1b4252bfd8a68b6b">{"x":{"filter":"none","data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100","101","102","103","104","105","106","107","108","109","110","111","112","113","114","115","116","117","118","119","120","121","122","123","124","125","126","127","128","129","130","131","132","133","134","135","136","137","138","139","140","141","142","143","144","145","146","147","148","149","150"],[5.1,4.9,4.7,4.6,5,5.4,4.6,5,4.4,4.9,5.4,4.8,4.8,4.3,5.8,5.7,5.4,5.1,5.7,5.1,5.4,5.1,4.6,5.1,4.8,5,5,5.2,5.2,4.7,4.8,5.4,5.2,5.5,4.9,5,5.5,4.9,4.4,5.1,5,4.5,4.4,5,5.1,4.8,5.1,4.6,5.3,5,7,6.4,6.9,5.5,6.5,5.7,6.3,4.9,6.6,5.2,5,5.9,6,6.1,5.6,6.7,5.6,5.8,6.2,5.6,5.9,6.1,6.3,6.1,6.4,6.6,6.8,6.7,6,5.7,5.5,5.5,5.8,6,5.4,6,6.7,6.3,5.6,5.5,5.5,6.1,5.8,5,5.6,5.7,5.7,6.2,5.1,5.7,6.3,5.8,7.1,6.3,6.5,7.6,4.9,7.3,6.7,7.2,6.5,6.4,6.8,5.7,5.8,6.4,6.5,7.7,7.7,6,6.9,5.6,7.7,6.3,6.7,7.2,6.2,6.1,6.4,7.2,7.4,7.9,6.4,6.3,6.1,7.7,6.3,6.4,6,6.9,6.7,6.9,5.8,6.8,6.7,6.7,6.3,6.5,6.2,5.9],[3.5,3,3.2,3.1,3.6,3.9,3.4,3.4,2.9,3.1,3.7,3.4,3,3,4,4.4,3.9,3.5,3.8,3.8,3.4,3.7,3.6,3.3,3.4,3,3.4,3.5,3.4,3.2,3.1,3.4,4.1,4.2,3.1,3.2,3.5,3.6,3,3.4,3.5,2.3,3.2,3.5,3.8,3,3.8,3.2,3.7,3.3,3.2,3.2,3.1,2.3,2.8,2.8,3.3,2.4,2.9,2.7,2,3,2.2,2.9,2.9,3.1,3,2.7,2.2,2.5,3.2,2.8,2.5,2.8,2.9,3,2.8,3,2.9,2.6,2.4,2.4,2.7,2.7,3,3.4,3.1,2.3,3,2.5,2.6,3,2.6,2.3,2.7,3,2.9,2.9,2.5,2.8,3.3,2.7,3,2.9,3,3,2.5,2.9,2.5,3.6,3.2,2.7,3,2.5,2.8,3.2,3,3.8,2.6,2.2,3.2,2.8,2.8,2.7,3.3,3.2,2.8,3,2.8,3,2.8,3.8,2.8,2.8,2.6,3,3.4,3.1,3,3.1,3.1,3.1,2.7,3.2,3.3,3,2.5,3,3.4,3],[1.4,1.4,1.3,1.5,1.4,1.7,1.4,1.5,1.4,1.5,1.5,1.6,1.4,1.1,1.2,1.5,1.3,1.4,1.7,1.5,1.7,1.5,1,1.7,1.9,1.6,1.6,1.5,1.4,1.6,1.6,1.5,1.5,1.4,1.5,1.2,1.3,1.4,1.3,1.5,1.3,1.3,1.3,1.6,1.9,1.4,1.6,1.4,1.5,1.4,4.7,4.5,4.9,4,4.6,4.5,4.7,3.3,4.6,3.9,3.5,4.2,4,4.7,3.6,4.4,4.5,4.1,4.5,3.9,4.8,4,4.9,4.7,4.3,4.4,4.8,5,4.5,3.5,3.8,3.7,3.9,5.1,4.5,4.5,4.7,4.4,4.1,4,4.4,4.6,4,3.3,4.2,4.2,4.2,4.3,3,4.1,6,5.1,5.9,5.6,5.8,6.6,4.5,6.3,5.8,6.1,5.1,5.3,5.5,5,5.1,5.3,5.5,6.7,6.9,5,5.7,4.9,6.7,4.9,5.7,6,4.8,4.9,5.6,5.8,6.1,6.4,5.6,5.1,5.6,6.1,5.6,5.5,4.8,5.4,5.6,5.1,5.1,5.9,5.7,5.2,5,5.2,5.4,5.1],[0.2,0.2,0.2,0.2,0.2,0.4,0.3,0.2,0.2,0.1,0.2,0.2,0.1,0.1,0.2,0.4,0.4,0.3,0.3,0.3,0.2,0.4,0.2,0.5,0.2,0.2,0.4,0.2,0.2,0.2,0.2,0.4,0.1,0.2,0.2,0.2,0.2,0.1,0.2,0.2,0.3,0.3,0.2,0.6,0.4,0.3,0.2,0.2,0.2,0.2,1.4,1.5,1.5,1.3,1.5,1.3,1.6,1,1.3,1.4,1,1.5,1,1.4,1.3,1.4,1.5,1,1.5,1.1,1.8,1.3,1.5,1.2,1.3,1.4,1.4,1.7,1.5,1,1.1,1,1.2,1.6,1.5,1.6,1.5,1.3,1.3,1.3,1.2,1.4,1.2,1,1.3,1.2,1.3,1.3,1.1,1.3,2.5,1.9,2.1,1.8,2.2,2.1,1.7,1.8,1.8,2.5,2,1.9,2.1,2,2.4,2.3,1.8,2.2,2.3,1.5,2.3,2,2,1.8,2.1,1.8,1.8,1.8,2.1,1.6,1.9,2,2.2,1.5,1.4,2.3,2.4,1.8,1.8,2.1,2.4,2.3,1.9,2.3,2.5,2.3,1.9,2,2.3,1.8],["setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","setosa","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","versicolor","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica","virginica"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>Sepal.Length<\/th>\n      <th>Sepal.Width<\/th>\n      <th>Petal.Length<\/th>\n      <th>Petal.Width<\/th>\n      <th>Species<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[{"className":"dt-right","targets":[1,2,3,4]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->
<p class="caption">(\#fig:DT-demo)A table widget rendered via the DT package.</p>
</div>

If you are reading this book as web pages now, you should see an interactive table generated from the above code chunk, e.g., you may sort the columns and search in the table. If you are reading a non-HTML version of this book, you should see a screenshot of the table. The screenshot may look a little different with the actual widget rendered in the web browser, due to the difference between a real web browser and PhantomJS's virtual browser.

There are a number of **knitr** chunk options related to screen-capturing. First, if you are not satisfied with the quality of the automatic screenshots, or want a screenshot of the widget of a particular state (e.g., after you click and sort a certain column of a table), you may capture the screen manually, and provide your own screenshot via the chunk option `screenshot.alt` (alternative screenshots). This option takes the paths of images. If you have multiple widgets in a chunk, you can provide a vector of image paths. When this option is present, **knitr** will no longer call **webshot** to take automatic screenshots.

Second, sometimes you may want to force **knitr** to use static screenshots instead of rendering the actual widgets even on HTML pages. In this case, you can set the chunk option `screenshot.force = TRUE`, and widgets will always be rendered as static images. Note that you can still choose to use automatic or custom screenshots.

Third, **webshot** has some options to control the automatic screenshots, and you may specify these options via the chunk option `screenshot.opts`, which takes a list like `list(delay = 2, cliprect = 'viewport')`. See the help page `?webshot::webshot` for the full list of possible options, and the [package vignette](https://cran.rstudio.com/web/packages/webshot/vignettes/intro.html) `vignette('intro', package = 'webshot')` illustrates the effect of these options. Here the `delay` option can be important for widgets that take long time to render: `delay` specifies the number of seconds to wait before PhantomJS takes the screenshot. If you see an incomplete screenshot, you may want to specify a longer delay (the default is 0.2 seconds).

Fourth, if you feel it is slow to capture the screenshots, or do not want to do it every time the code chunk is executed, you may use the chunk option `cache = TRUE` to cache the chunk. Caching works for both HTML and non-HTML output formats.

Screenshots behave like normal R plots in the sense that many chunk options related to figures also apply to screenshots, including `fig.width`, `fig.height`, `out.width`, `fig.cap`, and so on. So you can specify the size of screenshots in the output document, and assign figure captions to them as well. The image format of the automatic screenshots can be specified via the chunk option `dev`, and possible values are `pdf`, `png`, and `jpeg`. The default for PDF output is `pdf`, and it is `png` for other types of output. Note that `pdf` may not work as faithfully as `png`: sometimes there are certain elements on an HTML page that fail to render to the PDF screenshot, so you may want to use `dev = 'png'` even for PDF output. It depends on specific cases of HTML widgets, and you can try both `pdf` and `png` (or `jpeg`) before deciding which format is more desirable.

## Web pages and Shiny apps

Similar to HTML widgets, arbitrary web pages can be embedded in the book. You can use the function `knitr::include_url()` to include a web page through its URL. When the output format is HTML, an `iframe` is used;^[An `iframe` is basically a box on one web page to embed another web page.] in other cases, **knitr** tries to take a screenshot of the web page (or use the custom screenshot you provided). All chunk options are the same as those for HTML widgets. One option that may require your special attention is the `delay` option: HTML widgets are rendered locally, so usually they are fast to load for PhantomJS to take screenshots, but an arbitrary URL may take longer to load, so you may want to use a larger `delay` value, e.g., use the chunk option `screenshot.opts = list(delay = 5)`.

A related function is `knitr::include_app()`, which is very similar to `include_url()`, and it was designed for embedding Shiny apps\index{Shiny application} via their URLs in the output. Its only difference with `include_url()` is that it automatically adds a query parameter `?showcase=0` to the URL, if no other query parameters are present in the URL, to disable the Shiny showcase mode, which is unlikely to be useful for screenshots or iframes. If you do want the showcase mode, use `include_url()` instead of `include_app()`. Below is a Shiny app example (Figure \@ref(fig:miniUI)):

\let\ooldhref\href
\let\href\oldhref


```r
knitr::include_app('https://yihui.shinyapps.io/miniUI/', height = '600px')
```

<div class="figure" style="text-align: center">
<iframe src="https://yihui.shinyapps.io/miniUI/?showcase=0" width="768" height="600px"></iframe>
<p class="caption">(\#fig:miniUI)A Shiny app created via the miniUI package; you can see a live version at https://yihui.shinyapps.io/miniUI/.</p>
</div>

# Before session

#### Red Callout {.bs-callout .bs-callout-red}

<div class="FOO">
<p>Some text for this block.</p>
</div>


{: .box-note} **Note:** If you can add a few images to the image folder

{: .box-note}
**Note:** And add an explaination to the introduction chapter

{: .box-note}
**Note:** Add some key papers in the resources folder and add info to literature section

Have a go at loading and running the files (`.rmd`) here. To begin with you will need the following packages:




```r
# install.packages("car")
# car
# compute.es
# effects
# ggplot2
# multcomp
# pastecs
# WRS2
```



### Info needed

I have added notes usin these labels from `markdown`. If you can add your notes under these comments I can easily add them.

#### Boxes
You can add notification, warning and error boxes like this:

#### Notification

{: .box-note}
**Note:** This is a notification box.

#### Warning

{: .box-warning}
**Warning:** This is a warning box.

#### Error

{: .box-error}
**Error:** This is an error box.
