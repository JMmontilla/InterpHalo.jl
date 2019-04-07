using InterpHalo, Plots

points = range(0, stop = 1, length = 201)
orbits = range(0, stop = 1, length = 100)
P       = zeros(201,6,100)

for (valE,indE) in enumerate(orbits)
    for (val,ind) in enumerate(points)
        P[val,:,valE] = intH(ind,indE,2)
    end
end
plotlyjs()
plot(P[:,1,1],P[:,2,1],P[:,3,1], leg = false)
for valE in 2:length(orbits)
    plot!(P[:,1,valE],P[:,2,valE],P[:,3,valE])
end

gui()
