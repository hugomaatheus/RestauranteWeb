package com.br.model;


import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;

@Entity
@PrimaryKeyJoinColumn(name="usuario_id")
public class Cliente extends Usuario {
	
	
	public Cliente(String login, String senha, String email, String nome, Endereco endereco) {
		super(login, senha, email, nome, endereco);
	}
	
	public Cliente() {
		
	}

	@Override
	public String toString() {
		return "getId()=" + getId() + ", getLogin()=" + getLogin() + ", getSenha()="
				+ getSenha() + ", getEmail()=" + getEmail() + ", getNome()=" + getNome() + ", getStatus()="
				+ getStatus() + ", getTipo()=" + getTipo() + ", getEndereco()=" + getEndereco() + "]";
	}
	
}
