### A Pluto.jl notebook ###
# v0.19.32

using Markdown
using InteractiveUtils

# ╔═╡ 5c8e93ea-87ce-11ee-0b9e-6965d5c57e4a
begin
	# Ativação do ambiente de desenvolvimento
	using Pkg
	Pkg.activate("./env")
end

# ╔═╡ 4802438b-5d6c-4757-a240-835a634a81c9
md"""
# Curso de fundamentos de otimização
## Autor: Prof. Dr. Reginaldo Gonçalves Leão Junior
### E-mail: reginaldo.junior@ifmg.edu.br
"""

# ╔═╡ 7c010593-bfd4-4877-80d9-29ada6cbe805
md"""
### Modelagem de problemas para otimização

Na grande maioria dos problemas de otimização, o processo de obtenção de valores de máximo e mínimo estarão necessariamente associados à expressão do problema em uma forma matemática consistente, pelo menos em um nível aceitável de aproximação, com o sistema real. Esta expressão matemática do problema corresponderá ao **modelo matemático** utilizado, enquanto o processo de sua construção é denominado modelagem. 

Em muitos dos casos, conhecer o modelo matemático correspoderá de forma direta ou indereta ao conhecimento próprio da função a ser otimizada, ou seja a função objetivo. 

Não é objetivo deste curso tratar de técnicas de modelagem, por isso, suporemos em todos os casos que os modelos ou funções objetivo já são previamente conhecidas. Ainda assim, neste primeiro momento veremos alguns exemplos de modelagem que podem ser especialmente instrutivos aos mais leigos no assunto.
"""

# ╔═╡ 7b77a24b-5f5d-4c21-9eea-1b12dc2732df
md"""
#### Exemplo 1 
Suponha que um fabricante de latas de alumínio para bebidas precise determinar o diâmetro $r$ e a altura $h$ ótimas para o projeto de uma lata cujo o volume deve ser 473 ml. Neste caso, o objetivo do estudo é que a menor área de folhas de alumínio sejam empregadas para a construção de um cilíndro com esse volume.
"""

# ╔═╡ 5b82a89e-3a6d-463e-8924-c668add4a2de
html"""
<p>Geometria do problema</p>

<img src="https://i.ibb.co/TBWDp3J/Captura-de-tela-2023-11-21-172456.png"
	width="250"
	alt="Mostra um cilindro desenhado computacionalmente com a indicação de sua altura h e raio r">
"""

# ╔═╡ 3f91b108-572b-47e6-ad0d-4786481aaf60
md"""
Existem três superfícies da geometria do problema: (i) a "tampa e o fundo" cuja área individual é $\pi r^2$, e a lateral cuja a área é $2 \pi r h$.

Como se deseja minimizar a área de folhas de alumínio para a construção da lata o problema pode ser escrito como:

$$Minimize \qquad (2 \pi r h + 2 \pi r^2)$$
"""

# ╔═╡ Cell order:
# ╠═5c8e93ea-87ce-11ee-0b9e-6965d5c57e4a
# ╟─4802438b-5d6c-4757-a240-835a634a81c9
# ╠═7c010593-bfd4-4877-80d9-29ada6cbe805
# ╠═7b77a24b-5f5d-4c21-9eea-1b12dc2732df
# ╠═5b82a89e-3a6d-463e-8924-c668add4a2de
# ╠═3f91b108-572b-47e6-ad0d-4786481aaf60
