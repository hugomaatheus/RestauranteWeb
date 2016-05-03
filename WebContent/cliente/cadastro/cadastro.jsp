<html>
	<head>
		<title>Cadastro de Cliente</title>
		<meta charset="utf-8" />
		<link rel="stylesheet" type="text/css" href="style.css">
		<script type="text/javascript" src="../plugins/jquery-1.12.2.min.js"></script>
		<script type="text/javascript" src="../plugins/Projeto.js"></script>
	</head>
	<body>
		<formid = "form">
			<header><!-- Cabeça da pagina -->
				<ul class="tabs">
				<li><a href="#Read">Cadastro de Usuario</a></li>
				</ul>
			</header>

			<section>
				<form action="CadastroCliente" method="post">
					<article class="cont_tab" id="Read">
						<fieldset><legend>Cadastrar Usuario</legend>
							<article class="tab_Cadastro" id="caixa_1">
								<tbody>
									<tr>
										<td align="right">
											<label id="labellogin"><em>Login:</em></label>
										</td>
										<td align="left">
											<input id="txtlogin" name="login" type="text" required=""></input>
										</td>
										<td align="right">
											<label id="labelsenha"><em>Senha:</em></label>
										</td>
										<td align="left">
											<input id="txtsenha" name="senha" type="password" required="" />
										</td>
										<td align="right">
											<label id="labelNome"><em>Nome:</em></label>
										</td>
										<td align="left">
											<input id="txtNome" name="nome" type="text" required="" />
										</td>
										<td align="right">
											<label id="labeltelefone"><em>Telefone:</em></label>
										</td>
										<td align="left">
											<input id="txttelefone" name="telefone" type="tel"  maxlength="15" name="phone" pattern="\([0-9]{2}\)[0-9]{4,6}-[0-9]{3,4}$" title="Digite no seguinte formato (xx) xxxxx-xxxx" />
										<td>
										<td align="right">
											<label id="labelemail"><em>Email:</em></label>
										</td>
										<td align="left">
											<input id="txtemail" type="email" required="" name="email" pattern="[a-z0-9._%+-]+@[a-0-9.-]+\.[a-z]{2,4}$" />											
										</td>
									</tr>
								</tbody>
							</article>
							<article class="tab_Cadastro" id="caixa_2">
								<tbody>
									<tr>
										<td align="right">
											<label id="labelrua"><em>Rua:</em></label>
										</td>											
										<td align="left">
											<input id="txtrua" type="text"  name="rua"/>
										</td>											
										<td align="right">
											<label id="labelnumero"><em>Numero:</em></label>
										</td>											
										<td align="left">
											<input id="txtnumero" type="text" name="numero"  pattern="[0-9]+$" />
										</td>											
										<td align="right">
											<label id="labelcomplemento"><em>Complemento:</em></label>
										</td>											
										<td align="left">
											<input id="txtcomplemento" name="complemento"/>
										</td>
										<td align="right">
											<label id="labelbairro"><em>Bairro:</em></label>
										</td>											
										<td align="left">
											<input id="txtbairro" name="bairro"/>
										</td>
										<td align="right">
											<label id="labelcep"><em>CEP:</em></label>
										</td>											
										<td align="left">
											<input id="txtcep" name="cep" maxlength="9" pattern="\d{5}-\d{3}$" />
										</td>
									</tr>
								</tbody>
							</article>
							<article id= caixa_3>
								<tr>
									<td align="right">
										<input id="btnsalvar"  type="submit" value="Salvar" />
									</td>
								</tr>
								<tr>
									<td align="right">
										<input id="btnvoltar" type="button" onclick="window.location.href='/RestauranteWeb/login/login.jsp'" value="Voltar" />
									</td>
								</tr>
							</article>
						</fieldset>
					</article>
				</form>
			</section>

			<footer><!-- cabeçalho da pagina -->
				
			</footer>
		</form> 
	</body>
</html>