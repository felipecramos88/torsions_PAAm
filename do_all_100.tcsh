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
'torsion :19@C2:20@C1@C2:21@C1 $intra',
'torsion :20@C2:21@C1@C2:22@C1 $intra',
'torsion :21@C2:22@C1@C2:23@C1 $intra',
'torsion :22@C2:23@C1@C2:24@C1 $intra',
'torsion :23@C2:24@C1@C2:25@C1 $intra',
'torsion :24@C2:25@C1@C2:26@C1 $intra',
'torsion :25@C2:26@C1@C2:27@C1 $intra',
'torsion :26@C2:27@C1@C2:28@C1 $intra',
'torsion :27@C2:28@C1@C2:29@C1 $intra',
'torsion :28@C2:29@C1@C2:30@C1 $intra',
'torsion :29@C2:30@C1@C2:31@C1 $intra',
'torsion :30@C2:31@C1@C2:32@C1 $intra',
'torsion :31@C2:32@C1@C2:33@C1 $intra',
'torsion :32@C2:33@C1@C2:34@C1 $intra',
'torsion :33@C2:34@C1@C2:35@C1 $intra',
'torsion :34@C2:35@C1@C2:36@C1 $intra',
'torsion :35@C2:36@C1@C2:37@C1 $intra',
'torsion :36@C2:37@C1@C2:38@C1 $intra',
'torsion :37@C2:38@C1@C2:39@C1 $intra',
'torsion :38@C2:39@C1@C2:40@C1 $intra',
'torsion :39@C2:40@C1@C2:41@C1 $intra',
'torsion :40@C2:41@C1@C2:42@C1 $intra',
'torsion :41@C2:42@C1@C2:43@C1 $intra',
'torsion :42@C2:43@C1@C2:44@C1 $intra',
'torsion :43@C2:44@C1@C2:45@C1 $intra',
'torsion :44@C2:45@C1@C2:46@C1 $intra',
'torsion :45@C2:46@C1@C2:47@C1 $intra',
'torsion :46@C2:47@C1@C2:48@C1 $intra',
'torsion :47@C2:48@C1@C2:49@C1 $intra',
'torsion :48@C2:49@C1@C2:50@C1 $intra',
'torsion :49@C2:50@C1@C2:51@C1 $intra',
'torsion :50@C2:51@C1@C2:52@C1 $intra',
'torsion :51@C2:52@C1@C2:53@C1 $intra',
'torsion :52@C2:53@C1@C2:54@C1 $intra',
'torsion :53@C2:54@C1@C2:55@C1 $intra',
'torsion :54@C2:55@C1@C2:56@C1 $intra',
'torsion :55@C2:56@C1@C2:57@C1 $intra',
'torsion :56@C2:57@C1@C2:58@C1 $intra',
'torsion :57@C2:58@C1@C2:59@C1 $intra',
'torsion :58@C2:59@C1@C2:60@C1 $intra',
'torsion :59@C2:60@C1@C2:61@C1 $intra',
'torsion :60@C2:61@C1@C2:62@C1 $intra',
'torsion :61@C2:62@C1@C2:63@C1 $intra',
'torsion :62@C2:63@C1@C2:64@C1 $intra',
'torsion :63@C2:64@C1@C2:65@C1 $intra',
'torsion :64@C2:65@C1@C2:66@C1 $intra',
'torsion :65@C2:66@C1@C2:67@C1 $intra',
'torsion :66@C2:67@C1@C2:68@C1 $intra',
'torsion :67@C2:68@C1@C2:69@C1 $intra',
'torsion :68@C2:69@C1@C2:70@C1 $intra',
'torsion :69@C2:70@C1@C2:71@C1 $intra',
'torsion :70@C2:71@C1@C2:72@C1 $intra',
'torsion :71@C2:72@C1@C2:73@C1 $intra',
'torsion :72@C2:73@C1@C2:74@C1 $intra',
'torsion :73@C2:74@C1@C2:75@C1 $intra',
'torsion :74@C2:75@C1@C2:76@C1 $intra',
'torsion :75@C2:76@C1@C2:77@C1 $intra',
'torsion :76@C2:77@C1@C2:78@C1 $intra',
'torsion :77@C2:78@C1@C2:79@C1 $intra',
'torsion :78@C2:79@C1@C2:80@C1 $intra',
'torsion :79@C2:80@C1@C2:81@C1 $intra',
'torsion :80@C2:81@C1@C2:82@C1 $intra',
'torsion :81@C2:82@C1@C2:83@C1 $intra',
'torsion :82@C2:83@C1@C2:84@C1 $intra',
'torsion :83@C2:84@C1@C2:85@C1 $intra',
'torsion :84@C2:85@C1@C2:86@C1 $intra',
'torsion :85@C2:86@C1@C2:87@C1 $intra',
'torsion :86@C2:87@C1@C2:88@C1 $intra',
'torsion :87@C2:88@C1@C2:89@C1 $intra',
'torsion :88@C2:89@C1@C2:90@C1 $intra',
'torsion :89@C2:90@C1@C2:91@C1 $intra',
'torsion :90@C2:91@C1@C2:92@C1 $intra',
'torsion :91@C2:92@C1@C2:93@C1 $intra',
'torsion :92@C2:93@C1@C2:94@C1 $intra',
'torsion :93@C2:94@C1@C2:95@C1 $intra',
'torsion :94@C2:95@C1@C2:96@C1 $intra',
'torsion :95@C2:96@C1@C2:97@C1 $intra',
'torsion :96@C2:97@C1@C2:98@C1 $intra',
'torsion :97@C2:98@C1@C2:99@C1 $intra',
'torsion :98@C2:99@C1@C2:100@C1 $intra',
'torsion :1@CF@C1@C2:2@C1 $intra',
'torsion :99@C2:100@C1@C2@CZ $intra',
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
'torsion :19@C1@C2:20@C1@C2 $inter',
'torsion :20@C1@C2:21@C1@C2 $inter',
'torsion :21@C1@C2:22@C1@C2 $inter',
'torsion :22@C1@C2:23@C1@C2 $inter',
'torsion :23@C1@C2:24@C1@C2 $inter',
'torsion :24@C1@C2:25@C1@C2 $inter',
'torsion :25@C1@C2:26@C1@C2 $inter',
'torsion :26@C1@C2:27@C1@C2 $inter',
'torsion :27@C1@C2:28@C1@C2 $inter',
'torsion :28@C1@C2:29@C1@C2 $inter',
'torsion :29@C1@C2:30@C1@C2 $inter',
'torsion :30@C1@C2:31@C1@C2 $inter',
'torsion :31@C1@C2:32@C1@C2 $inter',
'torsion :32@C1@C2:33@C1@C2 $inter',
'torsion :33@C1@C2:34@C1@C2 $inter',
'torsion :34@C1@C2:35@C1@C2 $inter',
'torsion :35@C1@C2:36@C1@C2 $inter',
'torsion :36@C1@C2:37@C1@C2 $inter',
'torsion :37@C1@C2:38@C1@C2 $inter',
'torsion :38@C1@C2:39@C1@C2 $inter',
'torsion :39@C1@C2:40@C1@C2 $inter',
'torsion :40@C1@C2:41@C1@C2 $inter',
'torsion :41@C1@C2:42@C1@C2 $inter',
'torsion :42@C1@C2:43@C1@C2 $inter',
'torsion :43@C1@C2:44@C1@C2 $inter',
'torsion :44@C1@C2:45@C1@C2 $inter',
'torsion :45@C1@C2:46@C1@C2 $inter',
'torsion :46@C1@C2:47@C1@C2 $inter',
'torsion :47@C1@C2:48@C1@C2 $inter',
'torsion :48@C1@C2:49@C1@C2 $inter',
'torsion :49@C1@C2:50@C1@C2 $inter',
'torsion :50@C1@C2:51@C1@C2 $inter',
'torsion :51@C1@C2:52@C1@C2 $inter',
'torsion :52@C1@C2:53@C1@C2 $inter',
'torsion :53@C1@C2:54@C1@C2 $inter',
'torsion :54@C1@C2:55@C1@C2 $inter',
'torsion :55@C1@C2:56@C1@C2 $inter',
'torsion :56@C1@C2:57@C1@C2 $inter',
'torsion :57@C1@C2:58@C1@C2 $inter',
'torsion :58@C1@C2:59@C1@C2 $inter',
'torsion :59@C1@C2:60@C1@C2 $inter',
'torsion :60@C1@C2:61@C1@C2 $inter',
'torsion :61@C1@C2:62@C1@C2 $inter',
'torsion :62@C1@C2:63@C1@C2 $inter',
'torsion :63@C1@C2:64@C1@C2 $inter',
'torsion :64@C1@C2:65@C1@C2 $inter',
'torsion :65@C1@C2:66@C1@C2 $inter',
'torsion :66@C1@C2:67@C1@C2 $inter',
'torsion :67@C1@C2:68@C1@C2 $inter',
'torsion :68@C1@C2:69@C1@C2 $inter',
'torsion :69@C1@C2:70@C1@C2 $inter',
'torsion :70@C1@C2:71@C1@C2 $inter',
'torsion :71@C1@C2:72@C1@C2 $inter',
'torsion :72@C1@C2:73@C1@C2 $inter',
'torsion :73@C1@C2:74@C1@C2 $inter',
'torsion :74@C1@C2:75@C1@C2 $inter',
'torsion :75@C1@C2:76@C1@C2 $inter',
'torsion :76@C1@C2:77@C1@C2 $inter',
'torsion :77@C1@C2:78@C1@C2 $inter',
'torsion :78@C1@C2:79@C1@C2 $inter',
'torsion :79@C1@C2:80@C1@C2 $inter',
'torsion :80@C1@C2:81@C1@C2 $inter',
'torsion :81@C1@C2:82@C1@C2 $inter',
'torsion :82@C1@C2:83@C1@C2 $inter',
'torsion :83@C1@C2:84@C1@C2 $inter',
'torsion :84@C1@C2:85@C1@C2 $inter',
'torsion :85@C1@C2:86@C1@C2 $inter',
'torsion :86@C1@C2:87@C1@C2 $inter',
'torsion :87@C1@C2:88@C1@C2 $inter',
'torsion :88@C1@C2:89@C1@C2 $inter',
'torsion :89@C1@C2:90@C1@C2 $inter',
'torsion :90@C1@C2:91@C1@C2 $inter',
'torsion :91@C1@C2:92@C1@C2 $inter',
'torsion :92@C1@C2:93@C1@C2 $inter',
'torsion :93@C1@C2:94@C1@C2 $inter',
'torsion :94@C1@C2:95@C1@C2 $inter',
'torsion :95@C1@C2:96@C1@C2 $inter',
'torsion :96@C1@C2:97@C1@C2 $inter',
'torsion :97@C1@C2:98@C1@C2 $inter',
'torsion :98@C1@C2:99@C1@C2 $inter',
'torsion :99@C1@C2:100@C1@C2 $inter',
]

for cmd in torsion_commands:
    run(session, cmd)

run(session, "save output.pdb")
run(session, "exit")

EOF

chimerax --nogui --script $script

# vmd -dispdev text -e get_dihedrals.tcl

# julia -t auto plot.jl intra
# julia -t auto plot.jl inter

