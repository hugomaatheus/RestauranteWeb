package com.br.model;


import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;


@Entity
@PrimaryKeyJoinColumn(name="usuario_id")
public class Funcionario extends Usuario {	
	
	private Double salario;
	private String cpf;
	private String cargo;

	public Funcionario(Double salario, String cpf, String cargo, String nome, String login, String senha, String email, Endereco endereco) {
		super(login, senha, email, nome, endereco);
		this.salario = salario;
		this.cpf = cpf;
		this.cargo = cargo;
	}
	
	public Funcionario() {
		
	}

	public String getCargo() {
		return cargo;
	}

	public void setCargo(String cargo) {
		this.cargo = cargo;
	}

	public Double getSalario() {
		return salario;
	}

	public void setSalario(Double salario) {
		this.salario = salario;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	@Override
	public String toString() {
		return "Funcionario [salario=" + salario + ", cpf=" + cpf + ", cargo=" + cargo + ", getId()=" + getId()
				+ ", getLogin()=" + getLogin() + ", getSenha()=" + getSenha() + ", getEmail()=" + getEmail()
				+ ", getNome()=" + getNome() + ", getStatus()=" + getStatus() + ", getTipo()=" + getTipo()
				+ ", getEndereco()=" + getEndereco() + "]";
	}
	
}
