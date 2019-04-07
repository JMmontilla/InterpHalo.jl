__precompile__()

module InterpHalo

using JLD, Interpolations

export intH
path = @__DIR__
H1 = load(path*"/H1Data.jld")
H2 = load(path*"/H2Data.jld")

const ORB1 = H1["ORB"]

const ORB2 = H2["ORB"]

intORB1 = interpolate(ORB1, BSpline(Quadratic(Reflect(OnCell()))))
intORB2 = interpolate(ORB2, BSpline(Quadratic(Reflect(OnCell()))))

interpH1(x,y,z) = intORB1(x,y,z)
interpH2(x,y,z) = intORB2(x,y,z)

include("functions_interp.jl")

end # module
