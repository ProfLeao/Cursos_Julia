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

# ╔═╡ 583ffec9-04f9-4ef6-9a1c-0c614c64ac2b
using Plots; gr();

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

Obviamente este problema possui uma restrição, o volume da lata deve ser 473 ml.
Assim o problema fica completamente expresso por:

$$Minimize \qquad (2 \pi r h + 2 \pi r^2); \quad \pi r^2 h = 473,00$$

"""

# ╔═╡ a33e2be8-20c7-4126-8a62-699ec3d90cd3
md"""
As variáveis empregadas para a otimização são denominadas **variáveis de design**, para a solução do problema, empregaremos um método gráfico. 

Para tanto, cria-se dois vetores para representar as variáveis de *design*, digamos com valores entre 1 e 200 mm cada.
"""

# ╔═╡ 33c8710e-0e24-47ac-b517-68fb790b83e7
vec_r = vec_h = collect(1:0.1:20);

# ╔═╡ c3d2c514-fa75-42cf-b38f-c57f58167771
md"Em seguida modelamos a função objetivo e a restrição como funções computacioanais."

# ╔═╡ b550caba-d6ff-4ae1-a531-04287d5c8a4b
begin
	f_obj(r, h) = 2 * pi * r * h + 2 * pi * r^2;
	f_rest(r, h) = pi * r^2 * h;
end

# ╔═╡ 54205f98-9cf1-4fd8-95e2-2632563929ff
md"Agora faz-se a plotagem de tais funções para avaliar seu comportamento."

# ╔═╡ 16023e12-b552-45c5-9331-14a085fee7a9
g1 = contour(
		vec_r, 
		vec_h, 
		f_obj.(vec_r', vec_h), 
		color=:turbo, 
		clabels=true, 
		cbar=false, 
		lw=1
)

# ╔═╡ 7a2cec34-242f-4078-93c1-506549ac74d0
contour!(
		vec_r, 
		vec_h, 
		f_rest.(vec_r', vec_h), 
		color=:plasma, 
		clabels=true, 
		cbar=false, 
		lw=1
)

# ╔═╡ 7dbe2ca8-5728-4515-b17b-2728e84ddacf
begin
	xlabel!("Raio [cm]")
	ylabel!("Altura [cm]")
end

# ╔═╡ 3040221d-63ef-4abd-816a-9f95031181ef


# ╔═╡ Cell order:
# ╠═5c8e93ea-87ce-11ee-0b9e-6965d5c57e4a
# ╟─4802438b-5d6c-4757-a240-835a634a81c9
# ╠═7c010593-bfd4-4877-80d9-29ada6cbe805
# ╠═7b77a24b-5f5d-4c21-9eea-1b12dc2732df
# ╠═5b82a89e-3a6d-463e-8924-c668add4a2de
# ╠═3f91b108-572b-47e6-ad0d-4786481aaf60
# ╠═a33e2be8-20c7-4126-8a62-699ec3d90cd3
# ╠═33c8710e-0e24-47ac-b517-68fb790b83e7
# ╠═c3d2c514-fa75-42cf-b38f-c57f58167771
# ╠═b550caba-d6ff-4ae1-a531-04287d5c8a4b
# ╠═54205f98-9cf1-4fd8-95e2-2632563929ff
# ╠═583ffec9-04f9-4ef6-9a1c-0c614c64ac2b
# ╠═16023e12-b552-45c5-9331-14a085fee7a9
# ╠═7a2cec34-242f-4078-93c1-506549ac74d0
# ╠═7dbe2ca8-5728-4515-b17b-2728e84ddacf
# ╠═3040221d-63ef-4abd-816a-9f95031181ef
