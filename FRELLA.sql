CREATE TEMPORARY TABLE ANALISE AS
SELECT
	P.*,
    H.motivo_emp,
    H.valor_emp,
    H.emp_ativo,
    H.tx_emp
from pessoas P
LEFT JOIN historico_emp H
ON H.ID = P.ID

/* 
	MENOR IDADE OK
    MENOR TRAB OK
    MAIOR IDADE ACIMA DE 100 ANOS ?
    MAIOR ANOS TRAB ACIMA DE 100 ANOS ?
    238 CLIENTES SEM BUSCA DE EMPRESTIMO
    25805 CLIENTES SEM DADOS DE CONTATO
    5520 CLIENTES ENTRE 18 E 65 ANOS COM DADOS
    31004 CLIENTES (valor_emp / renda_ano) <= 0.4 
					AND emp_ativo = 0
                    OR
                     (valor_emp / renda_ano) <= 0.2 
                     AND emp_ativo = 1 OR emp_ativo IS NULL
                    
*/

-- CHECAR IDADE E ANO DE TRABALHO
SELECT 
 MIN(IDADE) MENOR_IDADE,
 MAX(IDADE) MAIOR_IDADE,
 MAX(anos_trabalho_atual) MAIOR_TRAB,
 MIN(anos_trabalho_atual) TRAB
FROM ANALISE

-- CONTAR CLIENTES SEM EMPRESTIMOS
SELECT 
	count(*)
FROM ANALISE
WHERE ANALISE.motivo_emp is NULL and ANALISE.valor_emp is NULL and ANALISE.emp_ativo IS NULL

-- CLEINTES SEM DADOS
SELECT 
	COUNT(*)
from ANALISE
WHERE dados_contato = 0
AND idade BETWEEN 18 and 60

-- CLIENTES ENTRE 18 E 65 ANOS COM DADOS
SELECT 
	COUNT(*)
from ANALISE
WHERE dados_contato = 1
AND idade BETWEEN 18 and 60



SELECT 
	COUNT(*)
from ANALISE
WHERE
(
  (valor_emp / renda_ano) <= 0.4 
	AND emp_ativo = 0
)
OR
(
  (valor_emp / renda_ano) <= 0.2 
  AND emp_ativo = 1 OR emp_ativo IS NULL
)



