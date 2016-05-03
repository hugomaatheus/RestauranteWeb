<html>
	<head>
		<title>titulo da pagina</title>
		<meta charset="utf-8" />
		<link rel="stylesheet" type="text/css" href="style.css">
		<script type="text/javascript" src="../plugins/jquery-1.12.2.min.js"></script>
		<script type="text/javascript" src="../plugins/Projeto.js"></script>
	</head>
	<body>
		<formid = "form">
			<header><!-- Cabeça da pagina -->
				<ul class="tabs">
				<li><a href="#Create">Mesa</a></li>
				<li><a href="#Read">Cadastrar Mesa</a></li>
				<a href='${pageContext.request.contextPath}/logout'>sair</a>
				</ul>
			</header>
			
			<section>
				<article class="tab_container">
					<article class="cont_tab" id="Create">
						<fieldset ><legend>Mesas</legend>
							<article class="tab_container" id="pesquisa"><!-- Centro da pagina -->
								<article>
									<td align="right">
										<label for="txtNumero"><em>Filtrar por:</em></label>
									</td>
								</article>
								<tbody>
									<tr> 
										<td>
											<label for="txtNome"><em>nome:</em></label>
										</td>
										<td align="left">
											<input id="filtro" type="text" autofocus="" required="" />
										</td>
										<td>
											<label for="txtreserva"><em>De reserva:</em></label>
										</td>
										<td align="left">
											<SELECT id="OpCategoria" class = "categoria" name = "categoria" size=1>
												<OPTION>
												<OPTION>Sim
												<OPTION>Nao
											</SELECT>
										</td>
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
											<th class="tabela-coluna"><span>Codigo</span></th>
											<th class="tabela-coluna"><span>Descricao</span></th>
											<th class="tabela-coluna"><span>Capacidade</span></th>
											<th class="tabela-coluna"><span>De reserva?</span></th>
											<th class="tabela-coluna"><span>Acoes</span></th>
										</tr>
									</thead>
								</table>
								<article class="scrollContainer">
									<table border="0">
										<tbody>
											<tr>
												<td class="tabela-coluna"><span>001</span></td>
												<td class="tabela-coluna"><span>mesa 1</span></td>
												<td class="tabela-coluna"><span>4</span></td>
												<td class="tabela-coluna"><span>Nao</span></td>
												<td class="tabela-coluna">
													<span>
													<a href="Comando para excluir"> [excluir]</a>
													<a href="Comando para inativar">[Inativar]</a>
													</span>
												</td>
											</tr>
										</tbody>
									</table>
								</article>
							</article>
						</article>
					</fieldset>
				</article>
			</section>
			
			<section>
				<article class="cont_tab" id="Read">
					<fieldset><legend>Cadastrar Mesa</legend>
						<article class="tab_container" id="criar">
							<form>
								<tbody>
									<tr>
										<td align="right">
											<label id="labelnome"><em>Nome:</em></label>
										</td>
										<td align="left">
											<input id="txtnome" type="text" autofocus="" required="" />
										</td>
										<td align="right">
											<label id="labeldescricao"><em>Descricao:</em></label>
										</td>
										<td align="left">
											<input id="txtdescricao" type="text" autofocus="" required="" />
										</td>
										<td align="right">
											<label id="labelcapacidade"><em>Capacidade:</em></label>
										</td>
										<td align="left">
											<input id="txtcapacidade" type="text" pattern="[0-9]+$" autofocus="" required="" />
										</td>
										<td align="right">
											<label id="labelreserva"><em>De reserva?</em></label>
										</td>
										<td align="left">
												<SELECT id="Opreserva" class = "categoria" name = "categoria" size=1>
													<OPTION>
													<OPTION>Sim
													<OPTION>Nao
												</SELECT>
										</td>
										<td align="right">
											<input id="btnAdicionar" type="submit" value="Adicionar" />
										</td>
									</tr>
								</tbody>
							</form>
						</article>
					</fieldset>
				</article>
			</section>
			
			<footer><!-- cabeçalho da pagina -->
				
			</footer>
		</form> 
	</body>
</html>