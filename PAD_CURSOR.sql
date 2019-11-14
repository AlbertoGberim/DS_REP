



-----Utilizando cursores, crie um procedimento que atualize o salário dos funcionários 
 ----quando passado seu código e o percentual de aumento (20%)-----
 
 
 
 
 CREATE TABLE FUNCIONARO(
 
 IDFUNCIONARIO INT PRIMARY KEY AUTO_INCREMENT,
 NOME VARCHAR(30),
 SEXO ENUM('M','F'),
 SALARIO FLOAT(10,2)
 );
 
 CREATE TABLE SALARIO_ATUAL(
 
IDFUNCIONARIO INT,
NOME VARCHAR(30),
SALARIO FLOAT(10,2),
AUMENTO VARCHAR(4),
SALARIO_ATUALIZADO FLOAT (10,2)
);


DELIMITER $


CREATE PROCEDURE INSERE_SALARIO()
BEGIN

           DECLARE FIM INT DEFAULT 0;
           DECLARE VSAL, VSALAT FLOAT(10,2);
		   DECLARE VNOME VARCHAR(30);
		   DECLARE VAUMENTO VARCHAR(4);
           DECLARE VID INT;
  
           DECLARE SAL CURSOR FOR(SELECT IDFUNCIONARIO, NOME, SALARIO FROM FUNCIONARIO);
		   
		   DECLARE CONTINUE HANDLER FOR NOT FOUND SET FIM = 1;
		   
		   OPEN SAL;
		   
		   REPEAT
		   
		   FETCH SAL INTO VID, VNOME, VSAL;
		   IF NOT FIM THEN
		   
		      SET VAUMENTO = '20%';
              SET VSALAT = (1.2 * VSAL);
  
              INSERT INTO SALARIO_ATUAL VALUES(VID, VNOME, VSAL, VAUMENTO, VSALAT);
			  
			  END IF;
  
  
           UNTIL FIM END REPEAT;

            CLOSE SAL;
  
  END
  $
  
  
  DELIMITER ;
  
  CALL INSERE_SALARIO();
  
  
  SELECT * FROM SALARIO_ATUAL;
  
+---------------+---------+----------+---------+--------------------+
| IDFUNCIONARIO | NOME    | SALARIO  | AUMENTO | SALARIO_ATUALIZADO |
+---------------+---------+----------+---------+--------------------+
|             1 | CARLOS  |  8000.00 | 20%     |            9600.00 |
|             2 | ANDREIA |  9500.00 | 20%     |           11400.00 |
|             3 | LUCAS   |  7000.00 | 20%     |            8400.00 |
|             4 | BRUNA   |  8500.00 | 20%     |           10200.00 |
|             5 | FELIPE  | 10000.00 | 20%     |           12000.00 |
+---------------+---------+----------+---------+--------------------+
  




  INSERT INTO FUNCIONARIO VALUES(NULL, 'CARLOS', 'M', 8000);
  INSERT INTO FUNCIONARIO VALUES(NULL, 'ANDREIA', 'F', 9500);
  INSERT INTO FUNCIONARIO VALUES(NULL, 'LUCAS', 'M', 7000);
  INSERT INTO FUNCIONARIO VALUES(NULL, 'BRUNA', 'F', 8500);
  INSERT INTO FUNCIONARIO VALUES(NULL, 'FELIPE', 'M', 10000);
   

   
   