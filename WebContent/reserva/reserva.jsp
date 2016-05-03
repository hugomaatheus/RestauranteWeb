<%@page import="java.nio.charset.CodingErrorAction"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, com.br.model.Reserva, com.br.model.Mesa"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
				<li><a href="#Create">Reservas</a></li>
				<li><a href="#Read">Cadastrar Reserva</a></li>
				<input id="btnSair" type="submit" value="Sair" />
				</ul>
			</header>
			
			<section>
				<article class="tab_container">
					<article class="cont_tab" id="Create">
						<fieldset ><legend>Reservas</legend>
							<article class="tab_container" id="pesquisa"><!-- Centro da pagina -->
								<article>
									<td align="right">
										<label for="labelfiltrar"><em>Filtrar por:</em></label>
									</td>
								</article>
								<tbody>
									<tr> 
										<td>
											<label for="labelinicio"><em>Data Inicio:</em></label>
										</td>
										<td align="left">
											<input for="txtinicio" type="date" autofocus="" required="" maxlength="10" pattern="[0-9]{2}\/[0-9]{2}\/[0-9]{4}$"/>
										</td>
										<label for="labelfim"><em>Data Fim:</em></label>
										</td>
										<td align="left">
											<input for="txtfim" type="date" autofocus="" required="" maxlength="10" pattern="[0-9]{2}\/[0-9]{2}\/[0-9]{4}$"/>
										</td>
										<td>
											<label for="labelmesa"><em>Mesa:</em></label>
										</td>
										<td align="left">
											<SELECT id="OpCategoria" class = "categoria" name = "categoria" size=1>
												<OPTION>
												<OPTION>Lista de mesas
											</SELECT>
										</td>
										<label id="labelresponsavel"><em>Responsavel:</em></label>
										</td>
										<td align="left">
											<input id="txtresponsavel" type="text" autofocus="" required="" />
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
											<th class="tabela-coluna"><span>Data Inicio</span></th>
											<th class="tabela-coluna"><span>Data Fim</span></th>
											<th class="tabela-coluna"><span>Mesa</span></th>
											<th class="tabela-coluna"><span>responsavel</span></th>
											<th class="tabela-coluna"><span>Acoes</span></th>
										</tr>
									</thead>
								</table>
								<article class="scrollContainer">
									<table border="0">
										<tbody>
										<%List<Reserva> reservas = (List<Reserva>) request.getAttribute("reservas");
										for (Reserva reserva : reservas) {%>
											<tr>
												<td class="tabela-coluna"><span><%=reserva.getDataInicial().toInstant()%> </span></td>
												<td class="tabela-coluna"><span><%=reserva.getDataFinal().toInstant()%></span></td>
												<td class="tabela-coluna"><span><%=reserva.getMesa().getNumero()%></span></td>
												<td class="tabela-coluna"><span><%=reserva.getNome_Responsavel()%></span></td>
												<td class="tabela-coluna">
													<span>
													<a href='removerReserva?id=<%=reserva.getId()%>'> [excluir]</a>
													<a href="Comando para inativar"> [Inativar]</a>
													</span>
												</td>
											</tr>
										<%} %>
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
					<fieldset><legend>Cadastrar Reserva</legend>
						<article class="tab_container" id="criar">
							<form method="post" action="cadastraReserva">
								<tbody>
									<tr>
										<td align="right">
											<label for="txtinicio" id="labelinicio"><em>Data Inicio:</em></label>
										</td>
										<td align="left">
										<input id="txtinicio" type="date" required="required" maxlength="10" name="dataInicio" pattern="[0-9]{2}\/[0-9]{2}\/[0-9]{4}$"/>
										</td>
										<td align="right">
											<label for="txtfim" id="labelfim"><em>Data Fim:</em></label>
										</td>
										<td align="left">
											<input id="txtfim" type="date" autofocus="" required="" maxlength="10" name="dataFim" pattern="[0-9]{2}\/[0-9]{2}\/[0-9]{4}$"/>
										</td>
										<td align="right">
											<label for="txtrespon" id="labelrespon"><em>Responsavel:</em></label>
										</td>
										<td align="left">
											<input id="txtrespon" type="text" name="responsavel" autofocus="" required="" />
										</td>
										<td align="right">
											<label for="Opmesa" id="labelmesa"><em>Mesa</em></label>
										</td>
										<%List<Mesa> mesas = (List<Mesa>) request.getAttribute("mesas");%>
										<td align="left">
												<SELECT id="Opmesa" class = "categoria" name="mesa" size=1>
													<OPTION>
													<%for (Mesa mesa : mesas) {%>
													<OPTION><%=mesa.getNumero() %>
													<%} %>
												</SELECT>
										</td>
										<td align="right">
											<input id="btnreservar" type="submit" value="Reservar" />
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