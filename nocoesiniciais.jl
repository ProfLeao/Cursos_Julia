### A Pluto.jl notebook ###
# v0.19.32

using Markdown
using InteractiveUtils

# ╔═╡ c849873f-223e-475f-9f21-5f478b00a2c9
begin
	# Ativação do ambiente de desenvolvimento
	using Pkg
	Pkg.activate("./env")
end

# ╔═╡ e1e619b7-f29d-4c8f-a62f-105bc0189fcf
begin
	using Plots
	plotly()
end

# ╔═╡ c9dfb2ba-5710-11ee-3f3b-ad0d7a9832cc
md"""
# Curso de fundamentos de otimização com Optimization.jl
## Autor: Prof. Dr. Reginaldo Gonçalves Leão Junior
### E-mail: reginaldo.junior@ifmg.edu.br
"""

# ╔═╡ bfbdfcc8-4c0e-4055-aa76-139b61635178
md"""
### Noções básicas de modelagem computacional com Julia

Este primeiro notebook apresenta noções fundamentais de modelagem computacional utilizando Julia, seu principal objetivo é apresentar as formas de declaração de uma função matemática compatível com os métodos de otimização que utilizaremos e como plotá-las para avaliar quantitativamente nossos resultados. 

Para começarmos iniciaremos com a modelagem de uma função matemática muito importante para o estudo de métodos de otimização, a função de Rosenbrok.

$$f(x,y) = (1 - x)^2 + 100(y - x^2)^2$$

Vamos escrever essa função computacionalmente. 
"""

# ╔═╡ b4ef11f9-6724-44e0-a0c3-38eba9f547ea
rosen(x::Float64, y::Float64) = (1 - x)^2 + 100(y - x^2)^2

# ╔═╡ 2239da30-8402-4f9f-9859-88e135fa9236
md"""
A função receber dois valores do tipo ponto flutuante de 64 bits e realiza a operação sobre eles.

Note que os tipos de `x` e `y` foram informados, ainda que a tipagem não seja extritamente necessária, isto é importante para garantir que a linguagem saiba antecipadamente com que tipo de dado ela irá trabalhar e permite que seja *compilada* uma versão otimizada da função. Isso mesmo, Julia é uma linguagem compilada em tempo de execução.

Feito isso, deviniremos o intervalo de variação de `x` e `y` para o estudo da função, criado dois vetores para esses valores. 

Trabalharemos com vetores entre -10 e 10 e um incremente de 0.001.

Parece muito, mas na verdade não é. 
"""

# ╔═╡ 6fae4fa7-92fa-4af4-bcd5-3b18fa9d492a
rg_xy = -5.:0.01:5.

# ╔═╡ d26d9c9a-0eea-48ba-a5ab-8aa988e2dfb6
md"""
Usamos um elemento importante da linguagem Julia, um *range*. Trata-se de uma sequência virtual de valores que não existe completamente na memória RAM, mas que pode ser criada no momento de seu uso com o auxílio de uma função chamada `collect()`. 

Seu formato é `inicio:incremento:fim` em nosso caso, com início em -10, incremento de 1 milésimo e fim em 10.

Como desejo que o intervalo de x e y sejam o mesmo criei apenas um *range* para ambas variáveis.

Para transformar este elemento em um vetor basta fazer.
"""

# ╔═╡ c32c0172-108c-46a1-9245-8e846fc97bd4
vec_xy = collect(rg_xy)

# ╔═╡ 936f38ce-c5de-45b6-ab12-e9f443f97f71
md"""
É sabido que o mínimo global dessa função está em $(x=1, y=1)$. Vamos avaliar essa característica graficamente. 

Para isso primeiramente é preciso avaliar os valores de $f(x,y)$ em todo o intervalo dessas variáveis. É claro que é preciso notar que se o comprimento dos vetores $x$ e $y$ for $n$, teremos um valor de $f(x,y)$ para cada possível par ordenado $(x_i, y_j)$ com $i$ e $j$ tomados de $n$ a $n$. Logo $f(x,y)$ será uma matriz $n \times n$.

Para a aplicação da função elemento-a-elemnto (*elementwise*), aplica-se o operador *broadcast* para a função. Na forma `rosen.(parametros)`.
"""

# ╔═╡ e636ae77-77dd-414d-9eae-b6c1aff8583c
vec_z = @. rosen(vec_xy', vec_xy);

# ╔═╡ 4fe859f9-fc9a-4f9a-8a93-62308da20a3d
md"Finalmente representações gráficas podem ser construídas, primeiramente na forma de um contorno 2D."

# ╔═╡ 68c3f09d-6e5c-43d2-a5ad-64e59184e456
# ╠═╡ disabled = true
#=╠═╡

  ╠═╡ =#

# ╔═╡ e0c78be0-dc34-4f4d-a8b6-cdb9c8f8a1fe
plot(contourf(vec_xy, vec_xy, log.(vec_z), color=:viridis))

# ╔═╡ 85be93ac-f1a5-464c-936e-bcab792a5b95
md"Em seguida como uma superfície tridimensional."

# ╔═╡ 6b02ca19-ee6e-4442-94cf-58ed9ab2ca96
surface(vec_xy, vec_xy, log.(vec_z), color=:viridis)

# ╔═╡ b3ff1ab6-0ef3-44fb-b8f6-162315e973f2


# ╔═╡ Cell order:
# ╠═c849873f-223e-475f-9f21-5f478b00a2c9
# ╠═c9dfb2ba-5710-11ee-3f3b-ad0d7a9832cc
# ╠═bfbdfcc8-4c0e-4055-aa76-139b61635178
# ╠═b4ef11f9-6724-44e0-a0c3-38eba9f547ea
# ╠═2239da30-8402-4f9f-9859-88e135fa9236
# ╠═6fae4fa7-92fa-4af4-bcd5-3b18fa9d492a
# ╠═d26d9c9a-0eea-48ba-a5ab-8aa988e2dfb6
# ╠═c32c0172-108c-46a1-9245-8e846fc97bd4
# ╠═936f38ce-c5de-45b6-ab12-e9f443f97f71
# ╠═e636ae77-77dd-414d-9eae-b6c1aff8583c
# ╠═e1e619b7-f29d-4c8f-a62f-105bc0189fcf
# ╠═4fe859f9-fc9a-4f9a-8a93-62308da20a3d
# ╠═68c3f09d-6e5c-43d2-a5ad-64e59184e456
# ╠═e0c78be0-dc34-4f4d-a8b6-cdb9c8f8a1fe
# ╠═85be93ac-f1a5-464c-936e-bcab792a5b95
# ╠═6b02ca19-ee6e-4442-94cf-58ed9ab2ca96
# ╠═b3ff1ab6-0ef3-44fb-b8f6-162315e973f2
