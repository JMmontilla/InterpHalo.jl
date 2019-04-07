"""
This functions gives the state inside the Halo orbit given by its
position inside the orbit (first argument), the orbit in the family
(second argument) and the family (third argument)

```julia
intH(x::Real,orb::Real,family::Int)
```

The first and second argument must be between 0 and 1,
and the third argument a 1 or a 2 (H1 or H2), this function
gives back an array of 6 elements, the position and velocity.
"""
function intH(x::Real,orb::Real,family::Int)

    if 0 > x || 1 < x
        error("first argument 'x' must be 0<=x<=1")
    elseif 0 > orb || 1 < orb
        error("second argument 'orb' must be 0<=orb<=1")
    end

    if family == 1 # H1
        i = 1 + x*(size(ORB1,1)-1)
        j = 1 + orb*(size(ORB1,3)-1)
        return interpH1(i,2:7,j)
    elseif family == 2 # H2
        i = 1 + x*(size(ORB2,1)-1)
        j = 1 + orb*(size(ORB2,3)-1)
        return interpH2(i,2:7,j)
    else
        error("last argument has to be either 1 (H1 family) or 2 (H2 family)")
    end

end
