package com.br.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.controller.FuncionarioController;

@WebServlet("/reserva/removerReserva")
public class RemoverReservaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RemoverReservaServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		FuncionarioController funcionario = new FuncionarioController();
		
		String id = request.getParameter("id");
		funcionario.cancelarReserva(new Long(id));
		response.sendRedirect("/RestauranteWeb/reserva/listarReserva");
		
	}
}
