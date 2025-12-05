# lifegamer


Lifegame implementation in R without `if`-expressions and `for`-loops.\`

## Examples

### 10-pixels segment

``` r
animate(lifegame(first_generation("segment10", 20, 30), 25), ncol = 5)
```

![](README_files/figure-commonmark/segment10-1.png)

### Octagon

``` r
animate(lifegame(first_generation("octagon", 20, 30), 10), ncol = 5)
```

![](README_files/figure-commonmark/octagon-1.png)
