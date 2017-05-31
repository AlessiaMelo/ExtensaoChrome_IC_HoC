CREATE TABLE alunos ( 
idmaquina INT NOT NULL,
data DATE NOT NULL, 
hora TIME NOT NULL 
) 

ALTER TABLE alunos
  ADD PRIMARY KEY (idmaquina, data)

CREATE TABLE atividades ( 
nomeativ VARCHAR(50) NOT NULL PRIMARY KEY,
descricao VARCHAR(250)
) 

CREATE TABLE gabaritos ( 
nomeativ VARCHAR(50) NOT NULL,
fase INT NOT NULL,
conceito VARCHAR(250),
gabarito VARCHAR(500)
) 

ALTER TABLE gabaritos
  ADD PRIMARY KEY (nomeativ, fase)

CREATE TABLE fases ( 
idmaquina INT NOT NULL,
data DATE NOT NULL, 
nomeativ VARCHAR(50) NOT NULL,
fase INT NOT NULL,
dicas INT NOT NULL,
tentativas INT NOT NULL
) 

ALTER TABLE fases
  ADD PRIMARY KEY (idmaquina, data, nomeativ, fase)

CREATE TABLE versoes ( 
idmaquina INT NOT NULL,
data DATE NOT NULL, 
nomeativ VARCHAR(50) NOT NULL,
fase INT NOT NULL,
versao INT NOT NULL,
codigo VARCHAR(500),
hora TIME NOT NULL 
) 

ALTER TABLE versoes
  ADD PRIMARY KEY (idmaquina, data, nomeativ, fase, versao)

ALTER TABLE gabaritos
  ADD FOREIGN KEY (nomeativ) REFERENCES atividades (nomeativ);

ALTER TABLE fases
  ADD FOREIGN KEY (idmaquina, data) REFERENCES alunos (idmaquina, data),
  ADD FOREIGN KEY (nomeativ) REFERENCES atividades (nomeativ);  

ALTER TABLE versoes
  ADD FOREIGN KEY (idmaquina, data) REFERENCES alunos (idmaquina, data),
  ADD FOREIGN KEY (nomeativ,fase) REFERENCES gabaritos (nomeativ,fase);  

ALTER TABLE gabaritos ADD obs VARCHAR(200)