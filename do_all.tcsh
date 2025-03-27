#!/usr/bin/tcsh

set script = "script.py"

if (-e $script) then
  echo "The $script script exist. Excluding..."
  rm $script
endif

# Checks if the correct number of arguments was provided
if ($# != 2) then
  echo "Usage: $0 <angle_intra> <angle_inter>"
  exit 1
endif

# Assigns the arguments to numeric variables
set intra = $1 # x,phi
set inter = $2 # y,psi

# Iterate through the angles using a foreach loop
foreach angle ($1 $2)
  # Check if the angle is within the valid range
  if ($angle < -180 || $angle > 180) then
    echo "Error: angle $angle out of range [-180, 180]."
    exit 1 # Exit with an error if any angle is invalid
  endif
end

# If we reach here, the angles are valid
echo "Angle intra: $intra"
echo "Angle inter: $inter"

cat << EOF > $script

from chimerax.core.commands import run

run(session, "open input.pdb")

torsion_commands = [
'torsion :1@C2:2@C1@C2:3@C1 $intra',
'torsion :2@C2:3@C1@C2:4@C1 $intra',
'torsion :3@C2:4@C1@C2:5@C1 $intra',
'torsion :4@C2:5@C1@C2:6@C1 $intra',
'torsion :5@C2:6@C1@C2:7@C1 $intra',
'torsion :6@C2:7@C1@C2:8@C1 $intra',
'torsion :7@C2:8@C1@C2:9@C1 $intra',
'torsion :8@C2:9@C1@C2:10@C1 $intra',
'torsion :9@C2:10@C1@C2:11@C1 $intra',
'torsion :10@C2:11@C1@C2:12@C1 $intra',
'torsion :11@C2:12@C1@C2:13@C1 $intra',
'torsion :12@C2:13@C1@C2:14@C1 $intra',
'torsion :13@C2:14@C1@C2:15@C1 $intra',
'torsion :14@C2:15@C1@C2:16@C1 $intra',
'torsion :15@C2:16@C1@C2:17@C1 $intra',
'torsion :16@C2:17@C1@C2:18@C1 $intra',
'torsion :17@C2:18@C1@C2:19@C1 $intra',
'torsion :18@C2:19@C1@C2:20@C1 $intra',
'torsion :1@CF@C1@C2:2@C1 $intra',
'torsion :19@C2:20@C1@C2@CZ $intra',
'torsion :1@C1@C2:2@C1@C2 $inter',
'torsion :2@C1@C2:3@C1@C2 $inter',
'torsion :3@C1@C2:4@C1@C2 $inter',
'torsion :4@C1@C2:5@C1@C2 $inter',
'torsion :5@C1@C2:6@C1@C2 $inter',
'torsion :6@C1@C2:7@C1@C2 $inter',
'torsion :7@C1@C2:8@C1@C2 $inter',
'torsion :8@C1@C2:9@C1@C2 $inter',
'torsion :9@C1@C2:10@C1@C2 $inter',
'torsion :10@C1@C2:11@C1@C2 $inter',
'torsion :11@C1@C2:12@C1@C2 $inter',
'torsion :12@C1@C2:13@C1@C2 $inter',
'torsion :13@C1@C2:14@C1@C2 $inter',
'torsion :14@C1@C2:15@C1@C2 $inter',
'torsion :15@C1@C2:16@C1@C2 $inter',
'torsion :16@C1@C2:17@C1@C2 $inter',
'torsion :17@C1@C2:18@C1@C2 $inter',
'torsion :18@C1@C2:19@C1@C2 $inter',
'torsion :19@C1@C2:20@C1@C2 $inter'
]

for cmd in torsion_commands:
    run(session, cmd)

run(session, "save output.pdb")
run(session, "exit")

EOF

chimerax --nogui --script $script

vmd -dispdev text -e get_dihedrals.tcl

julia -t auto plot.jl intra
julia -t auto plot.jl inter

