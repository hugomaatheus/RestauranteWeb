<html>
	<head>
		<title>titulo da pagina</title>
		<meta charset="utf-8" />
		<link rel="stylesheet" type="text/css" href="style.css">
		<script type="text/javascript" src="../Plugin js/jquery-1.12.2.min.js"></script>
		<script type="text/javascript" src="../Plugin js/Projeto.js"></script>
	</head>
	<body>
		<form id="form">
			<header><!-- Cabeça da pagina -->
				<ul class="tabs">
					<li><a href="#Create">Pedidos</a></li>
					<li><a href="#Read">Pedido Tradicional</a></li>
					<input id="btnSair" type="submit" value="Sair" />
				</ul>
			</header>
			
			<section>
				<div class="tab_container">
					<article class= "cont_tab" id= "Create"><!-- Centro da pagina -->
						<fieldset><legend>Pedidos</legend>
							<article class="tab_container" id="pesquisa">
								<tbody>
									<tr> 
										<td align="right">
											<label id="labelnumero"><em>Numero do Pedido:</em></label>
										</td>
										<td align="left">
											<input id="caixa_Numero" title="Digite apenas numeros" type="text" pattern="[0-9]+$" autofocus="" required="" />
										</td>
										<td align="right">
											<label id="labeltipo"><em>Tipo:</em></label>
										</td>
										<td align="left">
												<SELECT name = "menuTipo" size=1>
													<OPTION>
													<OPTION>Todos os Tipos
												</SELECT>
										</td>
										<td align="right">
											<label id="labelstatus"><em>Status:</em></label>
										</td>
										<td align="left">
												<SELECT name = "menuStatus" size=1>
													<OPTION>
													<OPTION>Atendido
													<OPTION>Pendente
													<OPTION>Cancelado
												</SELECT>
										</td>
										<td align="right"></td>
										<td align="left">
											<input id="btnPesquisar" type="submit" value="Pesquisar" />
										</td>
									</tr>
								</tbody>
							</article>	
							<article class="tabContainer" id="lista">
								<table border="0px">
									<thead>
										<tr>
											<th class="tabela-coluna"><span>Numero</span></th>
											<th class="tabela-coluna"><span>Data</span></th>
											<th class="tabela-coluna"><span>Total(R$)</span></th>
											<th class="tabela-coluna"><span>Status</span></th>
											<th class="tabela-coluna"><span>Acoes</span></th>
										</tr>
									</thead>
								</table>
								<article class="scrollContainer">
									<table border="0">
										<tbody>
											<tr>
												<td class="tabela-coluna"><span>123456</span></td>
												<td class="tabela-coluna"><span>08/04/2016</span></td>
												<td class="tabela-coluna"><span>20,00</span></td>
												<td class="tabela-coluna"><span>ATIVO</span></td>
												<td class="tabela-coluna">
													<span>
													<a href="Comando para excluir"> [excluir]</a>
													<a href="Detalhar Pedido/Detalhe pedido.html" >[Detalhar]</a>
													</span>
												</td>
											</tr>
										</tbody>
									</table>
								</article>
							</article>
						</fieldset>
					</div>
				</section>
				
			<section>
				<article class="cont_tab" id="Read">
					<fieldset><legend>Pedido Tradicional</legend>
						<article class="tab_container" id="Pesquisa">
							<tbody>
								<tr>
								<td align="right">
										<label id="labelmesa"><em>Mesa:</em></label>
									</td>
									<td align="left">
											<SELECT class = "menuCardapio" name = "menuCardapio" size=1>
												<OPTION>
												<OPTION>mesas Cadastradas
											</SELECT>
									</td>
									<td align="right">
										<label id="labelStatus"><em>Status:</em></label>
									</td>
									<td align="left">
											<SELECT class = "menuCardapio" name = "menuCardapio" size=1>
												<OPTION>
												<OPTION>Atendido
												<OPTION>Pendente
												<OPTION>Cancelado
											</SELECT>
									</td>
									<td align="right">
										<label id="labelStatus"><em>Item:</em></label>
									</td>
									<td align="left">
											<SELECT class = "menuCardapio" name = "menuCardapio" size=1>
												<OPTION>
												<OPTION>Listagem de todos os Cardapios
											</SELECT>
									</td>
									<td align="right">
										<label id="labelQtd"><em>Quantidade:</em></label>
									</td>
									<td align="left">
										<input id="txtQtd" title="Digite apenas numeros" type="text" pattern="[0-9]+$" required="" />
									</td>
									<td align="right">
										<input id="btnInserir" type="submit" value="Adicionar Item" />
									</td>
								</tr>
							</tbody>
						</article>
							<article class="tabContainer" id="lista">
								<table border="0px">
									<thead>
										<tr>
											<th class="tabela-coluna"><span>Produto</span></th>
											<th class="tabela-coluna"><span>Quantidade</span></th>
											<th class="tabela-coluna"><span>Total(R$)</span></th>
											<th class="tabela-coluna"><span>Acoes</span></th>
										</tr>
									</thead>
								</table>
								<article class="scrollContainer">
									<table border="0">
										<tbody>
											<tr>
												<td class="tabela-coluna"><span>coca</span></td>
												<td class="tabela-coluna"><span>2</span></td>
												<td class="tabela-coluna"><span>5,00</span></td>
												<td class="tabela-coluna"><span>[excluir]</span></td>
											</tr>
										</tbody>
									</table>
								</article>
							</article>
						<table class="TotalParcial">
							<td align="right">Total Parcial</td>
						</table>
						</td>
						<td align="left">
							<input id="btnConfirmar" type="submit" value="Salvar Pedido" />
						</td>
					</fieldset>
				</article>
			</section>
			
			
			<footer><!-- cabeçalho da pagina -->
				
			</footer>
		</form>
	</body>
</html>