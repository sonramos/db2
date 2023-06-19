DROP TABLE IF EXISTS Aluno CASCADE;
DROP TABLE IF EXISTS Avaliacao CASCADE;
DROP TABLE IF EXISTS Professor CASCADE;
DROP TABLE IF EXISTS Turma CASCADE;
DROP TABLE IF EXISTS Especializacao CASCADE;
DROP TABLE IF EXISTS Curso CASCADE;
DROP TABLE IF EXISTS Area CASCADE;
DROP TABLE IF EXISTS Matricula CASCADE;

CREATE TABLE Aluno (
	aluno_id Serial PRIMARY KEY,
	matricula Varchar(10) Unique NOT Null,
	CPF Varchar(20) NOT Null,
	Nome Varchar(255),
	Data_nasc Date NOT Null
);


Create Table Professor (
	professor_id Serial PRIMARY KEY,
	matricula Varchar(10) Unique NOT Null,
	CPF Varchar(20) NOT Null,
	Nome Varchar(255),
	Data_nasc Date NOT Null,
	especializacao_id Integer
);


Create Table Turma (
	turma_id Serial PRIMARY KEY,
	descricao Varchar(40),
	ano Integer NOT Null,
	turno Varchar(20),
	vagas Integer NOT Null,
	professor_id Integer NOT NULL,
	curso_id Integer NOT NULL	
);


Create Table Curso (
	curso_id Serial PRIMARY KEY,
	descricao Varchar(40) NOT Null,
	conceito Smallint,
	area_id Integer
);


CREATE TABLE Area (
    area_id Serial PRIMARY KEY,
    descricao VARCHAR(40) NOT Null
);


CREATE TABLE Especializacao (
    especializacao_id Serial PRIMARY KEY,
    descricao VARCHAR(40) NOT Null
);

CREATE TABLE Matricula (
    Aluno_id INTEGER,
    Turma_id INTEGER,
    matric_id INTEGER,
    PRIMARY KEY (matric_id, Aluno_id, Turma_id)
);

CREATE TABLE avaliacao (
    Aluno_id INTEGER,
    Turma_id INTEGER,
    aval_id INTEGER,
    descricao VARCHAR(50),
    PRIMARY KEY (aval_id, Aluno_id, Turma_id)
);


ALTER TABLE Professor ADD CONSTRAINT fk_prof_especializacao
	FOREIGN KEY(especializacao_id)
	REFERENCES especializacao
	ON UPDATE CASCADE
	ON DELETE SET Null;

ALTER TABLE Turma ADD CONSTRAINT fk_turma_professor
	FOREIGN KEY(professor_id)
	REFERENCES Professor;

ALTER TABLE Turma ADD CONSTRAINT fk_turma_curso
	FOREIGN KEY(curso_id)
	REFERENCES Curso
	ON UPDATE CASCADE;

ALTER TABLE Curso ADD CONSTRAINT FK_Curso_area
    FOREIGN KEY (area_id)
    REFERENCES area
    ON DELETE CASCADE;
 
ALTER TABLE matricula ADD CONSTRAINT FK_matricula_aluno
    FOREIGN KEY (aluno_id)
    REFERENCES Aluno
    ON DELETE RESTRICT;
 
ALTER TABLE matricula ADD CONSTRAINT FK_matricula_turma
    FOREIGN KEY (Turma_id)
    REFERENCES Turma
    ON DELETE RESTRICT;
 
ALTER TABLE avaliacao ADD CONSTRAINT FK_avaliacao_aluno
    FOREIGN KEY (Aluno_id)
    REFERENCES Aluno
    ON DELETE RESTRICT;
 
ALTER TABLE avaliacao ADD CONSTRAINT FK_avaliacao_turma
    FOREIGN KEY (Turma_id)
    REFERENCES Turma
    ON DELETE RESTRICT;

--

INSERT INTO aluno (aluno_id,matricula,cpf,nome,data_nasc)
VALUES
  (default,20230201,'502.520.582-03','Ivor Williamson','07/04/1972'),
  (default,20230202,'550.185.568-83','Hakeem Maddox','05/02/1962'),
  (default,20230203,'285.281.374-53','Xenos Wood','28/02/1982'),
  (default,20230204,'163.820.478-17','Emerson Burton','19/03/1968'),
  (default,20230205,'104.649.236-24','Madeline Bauer','11/03/1986'),
  (default,20230206,'492.257.588-10','Lane Tyson','20/03/1965'),
  (default,20230207,'006.202.495-81','Vera Strong','08/04/1973'),
  (default,20230208,'565.004.310-19','Hyatt Brennan','27/12/1979'),
  (default,20230209,'862.417.590-14','Nina Newton','22/09/1994'),
  (default,20230210,'343.892.580-38','Kennedy Aguilar','09/05/2004'),
  (default,20230211,'443.624.221-31','Ezra Austin','18/11/1975'),
  (default,20230212,'876.514.956-06','Charles Peck','10/08/1995'),
  (default,20230213,'751.787.736-64','Gray Jones','29/06/1973'),
  (default,20230214,'531.629.599-73','Jin Ochoa','15/01/1969'),
  (default,20230215,'369.579.714-43','Pascale Sloan','29/10/1972'),
  (default,20230216,'678.721.527-33','Zelenia Carpenter','20/01/1967'),
  (default,20230217,'948.235.877-35','Graiden Phillips','19/01/1970'),
  (default,20230218,'571.310.660-22','Lamar Lara','21/08/1998'),
  (default,20230219,'551.118.711-74','Juliet Knox','25/12/1975'),
  (default,20230220,'160.623.214-76','Kamal Kennedy','10/07/1999'),
  (default,20230221,'421.375.715-13','Amber Coleman','07/10/1977'),
  (default,20230222,'888.778.422-03','Jaime Sloan','30/01/2002'),
  (default,20230223,'472.132.937-08','Celeste Baldwin','23/10/1981'),
  (default,20230224,'836.745.742-72','Forrest Hicks','15/10/1981'),
  (default,20230225,'403.106.793-33','Indira Franklin','04/10/2001'),
  (default,20230226,'521.762.469-99','Tad Justice','26/08/1961'),
  (default,20230227,'547.462.249-63','Jordan Hunter','26/12/1988'),
  (default,20230228,'753.583.514-25','Nash Rios','30/11/2000'),
  (default,20230230,'409.548.584-53','Keely Sears','27/06/2004'),
  (default,20230229,'442.296.588-52','Wynter Albert','31/01/1993');

INSERT INTO area(descricao) Values
	('Ciências Humanas'),
	('Tecnologia'),
	('Ciências Exatas'),
	('Saúde');
	
INSERT INTO especializacao(descricao) Values
	('Banco de Dados'),
	('Estrutura de Dados'),
	('Interação Humano-computador'),
	('Programação Orientada a Ojetos'),
	('Fisioterapia'),
	('Medicina'),
	('Psicologia'),
	('Matemática'),
	('Física'),
	('Estatística'),
	('Inglês'),
	('Português');
	
INSERT INTO professor (matricula,cpf,nome,data_nasc,especializacao_id) VALUES
  (12301,'581.697.415-16','Dieter Hansen','21/03/2001',10),
  (12302,'966.601.389-21','Cyrus Fernandez','28/09/1966',9),
  (12303,'201.535.754-55','Eliana Mcfadden','15/02/2000',9),
  (12304,'784.363.297-53','Ivana Blanchard','30/08/1970',5),
  (12305,'560.087.650-72','Palmer Hess','08/09/1997',8),
  (12306,'305.115.558-72','Kato Mann','16/03/1978',2),
  (12307,'234.332.558-74','Bryar Glenn','30/08/1977',4),
  (12308,'975.386.353-91','Mia Acevedo','06/04/1973',9),
  (12309,'415.772.272-25','Alvin Ruiz','03/01/1986',11),
  (12310,'278.538.356-83','Kiayada Nixon','06/03/1970',9);

INSERT INTO curso (descricao,conceito,area_id) VALUES
  ('Ciências de dados',5,3),
  ('Fisioterapia',5,3),
  ('Odontologia',3,4),
  ('Fisioterapia',4,2),
  ('Psicologia',2,3),
  ('Ciências da computação',3,3),
  ('Medicina',2,2),
  ('Odontologia',4,2),
  ('Psicologia',3,2),
  ('Ciências de dados',4,4);

INSERT INTO turma (descricao,ano,turno,vagas,professor_id,curso_id)
VALUES
  ('Anatomia',2023,'Matutino',40,9,5),
  ('Português Instrumental',2023,'Integral',40,4,4),
  ('Saúde coletiva',2023,'Matutino',40,10,1),
  ('Banco de Dados I',2023,'Integral',40,9,5),
  ('Banco de Dados I',2023,'Integral',40,8,6),
  ('Anatomia',2023,'Integral',40,1,4),
  ('Introdução à programação',2023,'Matutino',40,6,7),
  ('Banco de Dados I',2023,'Vespertino',40,10,6),
  ('Saúde coletiva',2023,'Integral',40,1,9),
  ('Banco de Dados I',2023,'Vespertino',40,9,2),
  ('Saúde coletiva',2023,'Integral',40,9,4),
  ('Anatomia',2023,'Matutino',40,7,1),
  ('Saúde coletiva',2023,'Matutino',40,7,3),
  ('Português Instrumental',2023,'Vespertino',40,6,8),
  ('Introdução à programação',2023,'Vespertino',40,9,3),
  ('Segurança de Dados',2023,'Matutino',40,4,5),
  ('Português Instrumental',2023,'Matutino',40,7,10),
  ('Bioquímica',2023,'Integral',40,4,9),
  ('Português Instrumental',2023,'Integral',40,5,6),
  ('Saúde coletiva',2023,'Matutino',40,9,9),
  ('Bioquímica',2023,'Integral',40,5,9),
  ('Banco de Dados I',2023,'Vespertino',40,3,2),
  ('Português Instrumental',2023,'Matutino',40,8,8),
  ('Introdução à programação',2023,'Integral',40,8,6),
  ('Introdução à programação',2023,'Vespertino',40,9,5),
  ('Português Instrumental',2023,'Integral',40,9,1),
  ('Bioquímica',2023,'Matutino',40,7,6),
  ('Banco de Dados I',2023,'Matutino',40,6,4),
  ('Banco de Dados I',2023,'Vespertino',40,9,8),
  ('Bioquímica',2023,'Matutino',40,4,9),
  ('Anatomia',2023,'Vespertino',40,2,10),
  ('Introdução à programação',2023,'Integral',40,2,9),
  ('Saúde coletiva',2023,'Vespertino',40,1,8),
  ('Saúde coletiva',2023,'Vespertino',40,8,2),
  ('Português Instrumental',2023,'Vespertino',40,3,2),
  ('Saúde coletiva',2023,'Vespertino',40,9,9),
  ('Saúde coletiva',2023,'Vespertino',40,9,4),
  ('Segurança de Dados',2023,'Integral',40,7,9),
  ('Segurança de Dados',2023,'Matutino',40,6,7),
  ('Banco de Dados I',2023,'Integral',40,9,3);

Select * from turma order by turma_id;


