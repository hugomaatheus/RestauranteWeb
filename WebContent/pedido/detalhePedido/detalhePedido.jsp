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
					<input id="btnSair" type="submit" value="Sair"/>
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
											<label id="labelnumero"><em>Numero:</em></label>
										</td>
										<td align="right">
											<label id="labelstatus"><em>Status:</em></label>
										</td>
										<td align="right">
											<label id="labelqtd"><em>Quantidade:</em></label>
										</td>
										<td align="right">
											<label id="labeltroco"><em>Troco para:</em></label>
										</td>
									</tr>
								</tbody>
							</article>
							<article class="tabContainer" id="lista">
								<table border="0px">
									<thead>
										<tr>
											<th class="tabela-coluna"><span>Codigo</span></th>
											<th class="tabela-coluna"><span>Descricao</span></th>
											<th class="tabela-coluna"><span>Quantidade</span></th>
											<th class="tabela-coluna"><span>Total(R$)</span></th>
										</tr>
									</thead>
								</table>
								<article class="scrollContainer">
									<table border="0">
										<tbody>
											<tr>
												<td class="tabela-coluna"><span>123456</span></td>
												<td class="tabela-coluna"><span>Suco de Laranja</span></td>
												<td class="tabela-coluna"><span>1</span></td>
												<td class="tabela-coluna"><span>4,00</span></td>
											</tr>
										</tbody>
									</table>
								</article>
							</article>
							<article>
								<td align="right">
									<input id="btnAtender" type="button" value="Atender" />
								</td>
								<td align="right">
									<input id="btnCancelar" type="button" value="Cancelar" />
								</td>
								<td align="right">
									<input id="btnVoltar" type="button" onclick="window.location.href='../Tela-Pedidos-Cliente/Tela-Pedido-Cliente.html'" value="Voltar" />
								</td>
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