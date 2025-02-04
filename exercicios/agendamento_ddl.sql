CREATE TABLE pessoa (
    cpf CHAR(11) PRIMARY KEY,
    email VARCHAR(50) NOT NULL,
    nome VARCHAR(150) NOT NULL,
    data_nasc DATE NOT NULL,
    endereco VARCHAR(300) NOT NULL,
    telefone VARCHAR(15)
);

CREATE TABLE medico (
  	cpf_pessoa CHAR(11) PRIMARY KEY REFERENCES pessoa(cpf),
  	crm CHAR(10) NOT NULL,
);

CREATE TABLE paciente (
    cpf_pessoa CHAR(11) PRIMARY KEY REFERENCES pessoa(cpf),
    senha VARCHAR(10) NOT NULL CHECK (LENGTH(senha) BETWEEN 5 AND 10),
    plano_saude BOOLEAN NOT NULL
);

CREATE TABLE especialidade (
  	id CHAR(2) PRIMARY KEY,
  	descricao VARCHAR(100) NOT NULL
);

CREATE TABLE medico_especialidade (
  	cpf_medico CHAR(11) PRIMARY KEY REFERENCES medico(cpf_pessoa),
  	id_especialidade CHAR(4) PRIMARY KEY REFERENCES especialidade(id)
);
  
CREATE TABLE agendamento (
  	cpf_paciente CHAR(11) PRIMARY KEY REFERENCES paciente(cpf_pessoa),
  	cpf_medico CHAR(11) PRIMARY KEY REFERENCES medico(cpf_pessoa),
  	dh_consulta DATE NOT NULL,
  	dh_agendamento DATE NOT NULL,
  	valor_consulta DECIMAL(10, 2) NOT NULL,
);