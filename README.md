# InterpHalo

The function is `intH` and is called with

```julia
intH(x::Real,orb::Real,family::Int) -> Array
```
The first argument maps the position along the orbit (0 first point and 1 last point, which are the same), the second argument maps to the orbit along the family (0 the first and 1 the last) and the last argument is either 1 (H1 family) or 2 (H2 family). The function gives back an array with the positions and velocities, in Cartesian coordinates, given in a synodic frame of reference adimensionalized with the distant between the primaries (`384403e3` `m` in the Earth-Moon system), and the turning ratio of the f.r (`2.664985235455133e-6` `rad/s` in the Earth-Moon system).

# H1 family orbit

![H1](https://raw.githubusercontent.com/JMmontilla/InterpHalo.jl/master/H1.png)

# H2 family orbit

![H2](https://raw.githubusercontent.com/JMmontilla/InterpHalo.jl/master/H2.png)
