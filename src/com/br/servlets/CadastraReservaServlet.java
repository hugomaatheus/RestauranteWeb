package com.br.servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.controller.FuncionarioController;
import com.br.controller.GerenteController;
import com.br.model.Mesa;
import com.br.model.Reserva;

@WebServlet("/reserva/cadastraReserva")
public class CadastraReservaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CadastraReservaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/reserva/listarReserva").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dataInicio = request.getParameter("dataInicio");
		String dataFim = request.getParameter("dataFim");
		String responsavel = request.getParameter("responsavel");
		String Imesa = request.getParameter("mesa");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendarInicio = Calendar.getInstance();
		Calendar calendarFim = Calendar.getInstance();
		
		try {
			calendarInicio.setTime(sdf.parse(dataInicio));
			calendarFim.setTime(sdf.parse(dataFim));
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		
		int numMesa = Integer.parseInt(Imesa);
		
		Mesa mesa = GerenteController.buscar(numMesa);
		System.out.println(mesa);
		
		Reserva reserva = new Reserva();
		reserva.setDataInicial(calendarInicio);
		reserva.setDataFinal(calendarFim);
		reserva.setNome_Responsavel(responsavel);
		reserva.setMesa(mesa);
		
		try {
			reserva.setMesa(mesa);
			FuncionarioController funcionario = new FuncionarioController();
			funcionario.cadastrarReserva(reserva, null);
			
		}catch(Exception e) {
			System.out.println("Erro :=" + e);
		}
		response.sendRedirect("/RestauranteWeb/reserva/listarReserva");
	}
}
