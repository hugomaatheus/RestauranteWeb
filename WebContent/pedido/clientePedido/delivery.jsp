<%@ page import="java.util.*"%>
<%@ page import="com.br.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- para estruturas de controle e repetição e setar variáveis -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %> <!-- para formatações -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  <!-- para funções -->
 

<html>
	<head>
		<title>titulo da pagina</title>
		<meta charset="utf-8" />
		<link rel="stylesheet" type="text/css" href="style.css">
		<script type="text/javascript" src="../../plugins/jquery-1.12.2.min.js"></script>
		<script type="text/javascript" src="../../plugins/Projeto.js"></script>
	</head>

	<body>	
		<!-- <form method="post" action="PedidoDelivery" id="form"> --><!--A tag ul contem os titulos das abas-->
			<ul class="tabs">
				<li><a href="#Create">Meus Pedidos</a></li>
				<li><a href="#Read">Realizar Pedidos</a></li>
				<input id="btnSair" type="submit" value="Sair" />
			</ul>
			
			<div class="tab_container">
				<div class="cont_tab" id="Create">
					<fieldset ><legend>Meus Pedidos</legend>
						<div class="tab_container" id="pesquisa">
							<tbody>
								<tr> 
									<td align="right">
										<label for="txtNumero"><em>Numero do Pedido:</em></label>
									</td>
									<td align="left">
										<input id="caixa_Numero" title="Digite apenas numeros" type="text" pattern="[0-9]+$" autofocus="" required="" />
									</td>
									<td align="right">
										<label for="txtStatus"><em>Status:</em></label>
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
						</div>	
							<div class="tabContainer" id="lista">
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
								<div class="scrollContainer">
									<table border="0">
										<tbody>
											<tr>
												<td class="tabela-coluna"><span>123456</span></td>
												<td class="tabela-coluna"><span>08/04/2016</span></td>
												<td class="tabela-coluna"><span>20,00</span></td>
												<td class="tabela-coluna"><span>ATIVO</span></td>
												<td class="tabela-coluna">
													<span>
													<a href="../Tela-Detalhar Pedido/detalhe pedido.html">[Detalhar]</a>
													<a href="Comando para excluir">[Excluir]</a>
													</span>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
					</fieldset>
				</div>
				
				<div class="cont_tab" id="Read">
					<fieldset><legend>Cadastrar Pedido</legend>
						<div class="tab_container" id="Pesquisa">
							<form method="post" action="PedidoDelivery">
								<tr>
									<td align="right">
										<label for="txtStatus"><em>Item:</em></label>
									</td>
									<td align="left">
											<SELECT class = "menuCardapio" name = "menuCardapio" size=1>
												<OPTION>Selecione</OPTION>
												<c:forEach var="cardapio" items="${cardapios}">
													<OPTION value="${cardapio.id}"> ${cardapio.nome}</OPTION>
												</c:forEach>
											</SELECT>
									</td>
									<td align="right">
										<label for="labelQtd"><em>Quantidade:</em></label>
									</td>
									<td align="left">
										<input id="qtd" name="qtde" title="Digite apenas numeros" type="text" pattern="[0-9]+$" required="" />
									</td>
									<td align="right">
										
										<input id="btnInserir" type="submit" value="Adicionar Item"/>
									</td>
								</tr>
							</form>
						</div>
							<div class="tabContainer" id="lista">
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
								<div class="scrollContainer">
									<table border="0">
										<tbody>
											
											<c:forEach var="item" items="${itens}">
												<tr>
												<td class="tabela-coluna"><span>${item.Cardapio.nome}</span></td>										
												<td class="tabela-coluna"><span>${item.qtd}</span></td>
												<td class="tabela-coluna"><span>${item.qtd*item.Cardapio.preco}</span></td>
													<span>
													<a href="Comando para excluir">[Excluir]</a>
													</span>
												</td>											
											</tr>
											</c:forEach>												 
											
										</tbody>
									</table>
								</div>
							</div>
						<table class="TotalDoPedido">
						<td align="right">Total do pedido</td>
						</table>
						</td>
						<td align="left">
							<input id="btnConfirmar" type="submit" value="Confirmar" />
						</td>
					</fieldset>
				</div>
			</div>
<!-- 		</form> -->
	</body>
</html>