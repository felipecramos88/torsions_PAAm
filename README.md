# tortions_PAAm
Files for applying torsions to a 20-residue polyacrylamide polymer chain, starting from a linear backbone structure.

Compartilho aqui os arquivos que usei para gerar as estruturas omega (mais comum em água) e gamma (mais comum em glicose):

https://github.com/felipecramos88/torsions_PAAm

É preciso também ter o chimerax instalado, para isso é só baixar o instalador aqui:
https://www.cgl.ucsf.edu/chimerax/download.html

Uma nova estrutura (partindo da estrutura 180, 180) pode ser gerada apenas executando o script `do_all.tcsh`:

> ./do_all.tcsh <angulo_intra> <angulo_inter>

Tendo em vista que:
intra, x, phi (Φ) - diedro interno de cada monômero
inter, y , phi (Ψ) - diedro entre os monômero



Então para a gamma eu fiz:

> ./do_all.tcsh 180 -60

Com esse comando, é gerado um script de comandos para o chimerax alterar as torções do polímero. Depois que o chimerax modifica os diedros da estrutura inicial, um script VMD (`get_dihedrals.tcl`) calcula os diedros da nova estrutura, e um script Julia (`plot.jl`) plota esses valores para cada resíduo.

Existe também um script `view.py` que é um estado de visualização do chimerax para verificar visualmente os diedros, para isso basta fazer (depois de já ter rodado o `do_all.tcsh`):

> chimerax --script view.py

O resultado para a gamma será:

[gamma.png](/user_uploads/56884/RYC_ENwFXD0F9cH94qgdTvMq/gamma.png)

Esse script abre apenas uma parte do início da cadeia do polímero, para facilitar a análise dos diedros.

A referência é o último átomo do diedro, ele fica na origem e o ângulo diedro é o menor ângulo formado entre ele e o primeiro átomo. O truque para medir o ângulo corretamente é colocar o primeiro átomo do diedro em primeiro plano, sendo assim teremos:

[gamma.png](/user_uploads/56884/KfYJ9QNvkxIBVsMJvOhkZQRU/gamma.png)
[omega.png](/user_uploads/56884/GLhnzl23Cq8JReKVlBzHKfaB/omega.png)

Seguem as duas estruturas completas novamente (com 20 monômeros):

omega_60_180 (mais comum em água):
[omega.pdb](/user_uploads/56884/IZIaRUIU6n6x7JDehyHTQAdp/omega.pdb)

gamma_180_-60 (mais comum em glucose):
[gamma.pdb](/user_uploads/56884/2BQcQozZgeuXbv7vRMYhoXTv/gamma.pdb)


O `view.py` carrega a estrutura `output.pdb`, para mudar a estrutura a ser lida basta editar o script:

```python

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
]

for cmd in torsion_commands:
    run(session, cmd)

```
