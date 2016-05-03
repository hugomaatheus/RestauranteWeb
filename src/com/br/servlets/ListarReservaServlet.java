package com.br.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.controller.FuncionarioController;
import com.br.controller.GerenteController;
import com.br.model.Mesa;
import com.br.model.Reserva;

@WebServlet("/reserva/listarReserva")
public class ListarReservaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListarReservaServlet() {
        super();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		FuncionarioController funcionario = new FuncionarioController();
		
		List<Reserva> reservas = funcionario.listarTodasReservas();
			req.setAttribute("reservas", reservas);

		List<Mesa> mesas = GerenteController.consultarTodosMesas();
			req.setAttribute("mesas", mesas);
			
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/reserva/reserva.jsp");
			requestDispatcher.forward(req, resp);
			
	}

}
