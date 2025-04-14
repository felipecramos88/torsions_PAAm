from chimerax.core.commands import run

run(session, "open system.pdb")

torsion_commands = [
'select :AAM & @CF @H*',
'hide sel atoms',
'select :AAM & :3-999999',
'hide sel atoms',
'select :AAM & :3@C1',
'show sel atoms',
'select :AAM & :1',
'color sel red',
'select :AAM & :2',
'color sel blue',
'select :AAM & :3',
'color sel green',
'select clear',
'select :AAM & :1,2@C1,C2 :3@C1',
'style sel ball',
'select :AAM & :1-3',
'select ~sel',
'hide sel target a',
'select clear',
'cofr frontCenter',
'set bgColor white',
'lighting depthCue false',
'view'
]

for cmd in torsion_commands:
    run(session, cmd)
