<html>
	<head>
		<title>titulo da pagina</title>
		<meta charset="utf-8" />
		<link rel="stylesheet" type="text/css" href="style.css">
		<script type="text/javascript" src="../plugins/jquery-1.12.2.min.js"></script>
		<script type="text/javascript" src="../plugins/Projeto.js"></script>
	</head>
	<body>
		<form id="form">
			<header><!-- Cabeça da pagina -->
				<ul class="tabs">
					<li><a href="#Create">Tela Gerente</a></li>
					<a href='${pageContext.request.contextPath}/logout'>sair</a>
				</ul>
			</header>
			
			<section>
				<div class="tab_container">
					<article class= "cont_tab" id= "Create">
						<fieldset><legend>Menu</legend>
							<article class="tab_container" id="Pedidos-gerente">
								<tr>
									<td>
										<input class="botao" type="button" onclick="window.open('/RestauranteWeb/pedido/funcionarioPedido/funcionarioPedido.jsp')" value="Pagina Pedido"></input>
									</td>
								</tr>
							</article>
							<article class="tabContainer" id="Reserva">
								<tr>
									<td>
										<input class="botao" type="button" onclick="window.open('/RestauranteWeb/reserva/reserva.jsp')" value="Pagina Reserva"></input>
									</td>
								</tr>
							</article>
							<article class="tab_container" id="Categoria">
								<tr>
									<td>
										<input class="botao" type="button" onclick="window.open('/RestauranteWeb/categoria/categoria.jsp')" value="Pagina Categoria"></input>
									</td>
								</tr>
							</article>
							<article class="tabContainer" id="Cardapio">
								<tr>
									<td>
										<input class="botao" type="button" onclick="window.open('/RestauranteWeb/cardapio/cardapio.jsp')" value="Pagina Cardapio"></input>
									</td>
								</tr>
							</article>
							<article class="tab_container" id="Mesa">
								<tr>
									<td>
										<input class="botao" type="button" onclick="window.open('/RestauranteWeb/mesa/mesa.jsp')" value="Pagina Mesa"></input>
									</td>
								</tr>
							</article>
							<article class="tabContainer" id="Funcionario">
								<tr>
									<td>
										<input class="botao" type="button" onclick="window.open('/RestauranteWeb/funcionario/func/funcionario.jsp')" value="Pagina Funcionario"></input>
									</td>
								</tr>
							</article>
							<article class="tabContainer" id="Cliente">
								<tr>
									<td>
										<input class="botao" type="button" onclick="window.open('/RestauranteWeb/cliente/listarClientes.jsp')" value="Pagina Cliente"></input>
									</td>
								</tr>
							</article>
						</fieldset>
					</article>
				</div>		
			</section>
			<footer><!-- cabeçalho da pagina -->
				
			</footer>
		</form>
	</body>
</html>