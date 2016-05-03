package com.br.model;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;


@Entity
@PrimaryKeyJoinColumn(name="usuario_id")
public class Gerente extends Usuario {

	public Gerente(String login, String senha, String email, String nome, Endereco endereco) {
		super(login, senha, email, nome, endereco);
	}
	
	public Gerente() {
		super();
	}

	@Override
	public String toString() {
		return "Gerente [getId()=" + getId() + ", getLogin()=" + getLogin() + ", getSenha()="
				+ getSenha() + ", getEmail()=" + getEmail() + ", getNome()=" + getNome() + ", getStatus()="
				+ getStatus() + ", getTipo()=" + getTipo() + ", getEndereco()=" + getEndereco() + "]";
	}
	
}
