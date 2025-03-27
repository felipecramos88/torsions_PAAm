using Pkg; Pkg.activate("julia")
using Plots
using LaTeXStrings
using DataFrames
using CSV
using PDBTools

default(fontfamily      = "Computer Modern",
        grid            = false,
        xtickfontsize   = 12,
        ytickfontsize   = 12,
        xguidefontsize  = 14,
        yguidefontsize  = 14,
        legendfontsize  = 10,
        framestyle      = :box,
        line            = :solid,
	linewidth       = 2.0,
        ticks           = true,
        margin          = 0.5Plots.Measures.cm
)

polymer = PDBTools.read_pdb("output.pdb","resname AAMD")
residues = collect(eachresidue(polymer))
res = length(residues)

if length(ARGS) < 1
    println("Error: Provide 'intra' ou 'inter' strings as argument")
    exit(1)
end

dihedral = ARGS[1]

data = CSV.read("$dihedral.csv", DataFrame; delim=',', header=false)

x = 1:size(data, 1)
y = data[:,1]

stp = res/4

plot!(x,y,
      title  = "",
      color  = :black,
      label  = "$dihedral-monomer",
      xaxis  = (L"\mathrm{Dihedral \ index}",0:stp:res),
      yaxis  = (L"\mathrm{Dihedral} \ \mathrm{(Degrees)}",-180:60:180),
      xlim   = [0,res],
      ylim   = [-180,180]
)

hline!([0.0], color=:black, linestyle=:dash, lw=1.0, label  = "")

savefig("plot_$dihedral.png")

