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
					<li><a href="#Create">Listar Clientes</a></li>
					<a href='${pageContext.request.contextPath}/logout'>sair</a>
				</ul>
			</header>
			
			<section>
				<div class="tab_container">
					<article class= "cont_tab" id= "Create"><!-- Centro da pagina -->
						<fieldset><legend>Lista de Clientes</legend>
							<article class="tabContainer" id="lista">
								<table border="0px">
									<thead>
										<tr>
											<th class="tabela-coluna"><span>Nome</span></th>
											<th class="tabela-coluna"><span>E-mail</span></th>
											<th class="tabela-coluna"><span>Rua</span></th>
											<th class="tabela-coluna"><span>Status</span></th>
										</tr>
									</thead>
								</table>
								<article class="scrollContainer">
							
							<c:forEach var="cliente" items="${clientes}">
								
									<table border="0">
										<tbody>
											<tr>
												<td class="tabela-coluna"><span>${cliente.nome}</span></td>
												<td class="tabela-coluna"><span>${cliente.email}</span></td>
												<td class="tabela-coluna"><span>${cliente.rua}</span></td>
												<td class="tabela-coluna"><span>${cliente.status}</span></td>
											</tr>
										</tbody>
									</table>
								</article>
							</c:forEach>
							</article>
							<article>
								<td align="right">
									<input id="btnVoltar" type="button" onclick="javascript:history.back(); self.location.reload();" value="Voltar" />
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