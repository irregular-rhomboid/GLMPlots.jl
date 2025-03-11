# GLMPlots.jl

[![Build Status](https://github.com/irregular-rhomboid/GLMPlots.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/irregular-rhomboid/GLMPlots.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/irregular-rhomboid/GLMPlots.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/irregular-rhomboid/GLMPlots.jl)

Summary Plots for `GLM.jl` using Plots.

This package implements the equivalent of R's `plot.lm` function for GLM' `LinearModels` objects, using Plots Recipes.

## Installation

```
] add https://github.com/irregular-rhomboid/GLMPlots.jl.git
```

## Usage

```julia
using GLM
using RDatasets
using StatsPlots
using GLMPlots

data = dataset("datasets", "trees")

@time l = lm(@formula(Height ~ Girth + Volume), data)

# the main plot function displays a figure with four summary plots
lmplot(l; size = (700,500))
```

![](img/plots.png)

Functions for the individual plots are available.

```julia
residualplot(l)
qqplot(l)
scalelocationplot(l)
residualsleverageplot(l)
cooksleverageplot(l)
```
