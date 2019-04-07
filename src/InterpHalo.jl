__precompile__()

module InterpHalo

using JLD, Interpolations

export intH

H1 = load("~/.julia/packages/InterpHalo/src/H1Data.jld")
H2 = load("~/.julia/packages/InterpHalo/src/H2Data.jld")

ORB1 = H1["ORB"]
T1   = H1["T"]

ORB2 = H2["ORB"]
T2   = H2["T"]

intORB1 = interpolate(ORB1, BSpline(Quadratic(Reflect(OnCell()))))
intORB2 = interpolate(ORB2, BSpline(Quadratic(Reflect(OnCell()))))

interpH1(x,y,z) = intORB1(x,y,z)
interpH2(x,y,z) = intORB2(x,y,z)

function intH(x::Real,orb::Real,family::Int)

    if 0 > x || 1 < x
        error("first argument 'x' must be 0<=x<=1")
    elseif 0 > orb || 1 < orb
        error("second argument 'orb' must be 0<=orb<=1")
    end

    if family == 1 # H1
        i = 1 + x*(size(ORB1,1)-1)
        j = 1 + x*(size(ORB1,3)-1)
        return interpH1(i,2:7,j)
    elseif family == 2 # H2
        i = 1 + x*(size(ORB2,1)-1)
        j = 1 + x*(size(ORB2,3)-1)
        return interpH2(i,2:7,j)
    else
        error("last argument has to be either 1 (H1 family) or 2 (H2 family)")
    end

end

end # module
