package com.br.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.br.controller.ClienteController;
import com.br.model.Cliente;
import com.br.model.Endereco;
import com.br.model.Usuario;

@WebServlet("/cliente/cadastro/CadastroCliente")
public class CadastraClienteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public CadastraClienteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/cliente/cadastro/cadastro.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nome = request.getParameter("nome");
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		String telefone = request.getParameter("telefone");
		String email = request.getParameter("email");
		String rua = request.getParameter("rua");
		String numero = request.getParameter("numero");
		String complemento = request.getParameter("complemento");
		String bairro = request.getParameter("bairro");
		String cep = request.getParameter("cep");
		
		
		try {
				Endereco endereco = new Endereco(rua, bairro, numero, complemento, telefone, cep);
				Usuario cliente = new Cliente(login, senha, email, nome, endereco);
				ClienteController.cadastrarUsuario(cliente);
		}catch(Exception e) {
				JOptionPane.showMessageDialog(null, e.getMessage());
		}
		
		response.sendRedirect("/RestauranteWeb/login/login.jsp");
	}

}
