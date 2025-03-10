using GLM: crossmodelmatrix
using LinearAlgebra: diag

"""
    standardized_residuals(obj::LinearModel)

Compute the standardized residuals of a linear model, defined for the `i`-th observation as
```
r[i] / (std(r) * sqrt(1 - h[i]),
```
where `r` are the residuals of the model, ``s`` is the empirical standard deviation of the residuals and ``h[i]`` is the leverage of observation `i`.
"""
function standardized_residuals(obj::LinearModel)
    r = residuals(obj)
    h = leverage(obj)
    return r ./(std(r) .* sqrt.(1 .- h))
end

function leverage(obj::LinearModel)
    X = modelmatrix(obj)
    XtX = crossmodelmatrix(obj)
    wts = obj.rr.wts
    if isempty(wts)
        hii = diag(X * inv(XtX) * X')
    else
        throw(ArgumentError("Weighted models are not currently supported."))
    end
    return hii
end
