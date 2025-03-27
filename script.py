
from chimerax.core.commands import run

run(session, "open input.pdb")

torsion_commands = [
'torsion :1@C2:2@C1@C2:3@C1 180',
'torsion :2@C2:3@C1@C2:4@C1 180',
'torsion :3@C2:4@C1@C2:5@C1 180',
'torsion :4@C2:5@C1@C2:6@C1 180',
'torsion :5@C2:6@C1@C2:7@C1 180',
'torsion :6@C2:7@C1@C2:8@C1 180',
'torsion :7@C2:8@C1@C2:9@C1 180',
'torsion :8@C2:9@C1@C2:10@C1 180',
'torsion :9@C2:10@C1@C2:11@C1 180',
'torsion :10@C2:11@C1@C2:12@C1 180',
'torsion :11@C2:12@C1@C2:13@C1 180',
'torsion :12@C2:13@C1@C2:14@C1 180',
'torsion :13@C2:14@C1@C2:15@C1 180',
'torsion :14@C2:15@C1@C2:16@C1 180',
'torsion :15@C2:16@C1@C2:17@C1 180',
'torsion :16@C2:17@C1@C2:18@C1 180',
'torsion :17@C2:18@C1@C2:19@C1 180',
'torsion :18@C2:19@C1@C2:20@C1 180',
'torsion :1@CF@C1@C2:2@C1 180',
'torsion :19@C2:20@C1@C2@CZ 180',
'torsion :1@C1@C2:2@C1@C2 -60',
'torsion :2@C1@C2:3@C1@C2 -60',
'torsion :3@C1@C2:4@C1@C2 -60',
'torsion :4@C1@C2:5@C1@C2 -60',
'torsion :5@C1@C2:6@C1@C2 -60',
'torsion :6@C1@C2:7@C1@C2 -60',
'torsion :7@C1@C2:8@C1@C2 -60',
'torsion :8@C1@C2:9@C1@C2 -60',
'torsion :9@C1@C2:10@C1@C2 -60',
'torsion :10@C1@C2:11@C1@C2 -60',
'torsion :11@C1@C2:12@C1@C2 -60',
'torsion :12@C1@C2:13@C1@C2 -60',
'torsion :13@C1@C2:14@C1@C2 -60',
'torsion :14@C1@C2:15@C1@C2 -60',
'torsion :15@C1@C2:16@C1@C2 -60',
'torsion :16@C1@C2:17@C1@C2 -60',
'torsion :17@C1@C2:18@C1@C2 -60',
'torsion :18@C1@C2:19@C1@C2 -60',
'torsion :19@C1@C2:20@C1@C2 -60'
]

for cmd in torsion_commands:
    run(session, cmd)

run(session, "save output.pdb")
run(session, "exit")

