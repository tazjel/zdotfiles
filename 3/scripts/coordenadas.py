# coding: utf-8

coordenadas = []
chaves = ["x", "y", "z"]

with open("dados.txt", "r") as dados:
    for linha in dados:
        valores = linha.split(";")
        assert len(valores) >= 6, "Cada linha deve ter 5 elementos"
        # no assert acima consideramos o \n, por isso 6
        # neste momento valores teria
        # ['0.000029', '12', '0.333329', '0.212606', '1.808901', '\n']
        coordenada = zip(chaves, valores[2:])
        # na linha acima juntamos as chaves e a fatia de valores
        # pegamos do item 2 até o fim da lista
        # neste momento coordenada é
        # [('x', '0.333276'), ('y', '0.224863'), ('z', '1.792157')]
        coordenada = dict(coordenada)
        # transformamos a lista de tuplas em um dict
        # {'y': '0.224863', 'x': '0.333276', 'z': '1.792157'}
        coordenadas.append(coordenada)
        # inserimos a coordenada na lista geral

print coordenadas
# aqui a lista geral coordenadas será algo como:
# [{'y': '0.224863', 'x': '0.333276', 'z': '1.792157'},
#  {'y': '0.212606', 'x': '0.333329', 'z': '1.808901'},...]

for item in coordenadas:
    # iteramos cada item da lista de coordenadas
    print item["x"], item["y"], item["z"]
    # aqui você pode usar os valores separadamente
    # ou pode desempacotar
    # ax.plot_wireframe(*item.values(), rstride=10, cstride=10)
    