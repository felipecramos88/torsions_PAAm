from chimerax.core.commands import run

run(session, "open output.pdb")

torsion_commands = [

'select @CF @H* :3-20',
'hide sel atoms',
'select :3@C1',
'show sel atoms',
'select :1',
'color sel red',
'select :2',
'color sel blue',
'select :3',
'color sel green',
'select clear',
'view',
'cofr frontCenter'
'set bgColor white',
'lighting depthCue false'
]

for cmd in torsion_commands:
    run(session, cmd)

