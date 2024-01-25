--exemplo do professor
   SELECT corretor.codcorr, nome, licenca, codalu, dataalu, codimo, codinq, valoraluguel 
   FROM corretor, aluguel 
   WHERE corretor.codcorr = aluguel.codcorr
   AND; 


--1. Selecione todos os dados dos corretores.

Select * from corretor;
------------------------------------------------------------------
--2. Selecione o nome do corretor, licença do 
--corretor e todos os dados dos alugues negociados 
--pelos seus respectivos corretores. 

SELECT c.nome,
       c.licenca,
       a.codalu,
       a.codinq,
       a.codimo,
       a.codcorr,
       a.dataalug,  
       a.datavenc,
       a.valorauguel 
FROM corretor c
JOIN aluguel a ON c.codcorr = a.codcorr;


-----------------------------------------------------------------
--3. Busque a descricao do Imovel, valor do aluguel,
-- e situação do imovel (se est=a alugado ou não) e o 
--nome e telefone dos respectivos proprietarios.

SELECT 
    imovel.descricao AS DescricaoImovel,
    imovel.valorauguel AS ValorAluguel,
    imovel.alugado AS SituacaoImovel,
    proprietario.nome AS NomeProprietario,
    proprietario.telefone AS TelefoneProprietario
FROM 
    imovel
JOIN 
    proprietario ON imovel.codprop = proprietario.codprop;

--outro jeito de fazer

    SELECT 
    imovel.descricao AS DescricaoImovel,
    imovel.valorauguel AS ValorAluguel,
    imovel.alugado AS SituacaoImovel,
    (SELECT proprietario.nome FROM proprietario WHERE proprietario.codprop = imovel.codprop) AS NomeProprietario,
    (SELECT proprietario.telefone FROM proprietario WHERE proprietario.codprop = imovel.codprop) AS TelefoneProprietario
FROM 
    imovel;

------------------------------------------------------------------
--4. Busque os Alugueis(codAlu, dataAlu e valorAluguel), 
--com os respectivos nomes dos inquilinos e nome do corretor.

SELECT 
    imovel.descricao AS DescricaoImovel,
    imovel.valorauguel AS ValorAluguel,
    imovel.alugado AS SituacaoImovel,
    proprietario.nome AS NomeProprietario,
    proprietario.telefone AS TelefoneProprietario
FROM 
    imovel
JOIN 
    proprietario ON imovel.codprop = proprietario.codprop;

--outro jeito de fazer

SELECT 
    imovel.descricao AS DescricaoImovel,
    imovel.valorauguel AS ValorAluguel,
    imovel.alugado AS SituacaoImovel,
    p.nome AS NomeProprietario,
    p.telefone AS TelefoneProprietario
FROM 
    imovel,
    (SELECT codprop, nome, telefone FROM proprietario) AS p
WHERE 
    imovel.codprop = p.codprop;

----------------------------------------------------------------

--5. Selecione a quantidade de imoveis alugados pelo corretor 
--cuja licença é 'LC587'. 

SELECT 
    COUNT(a.codalu)
FROM 
    (SELECT aluguel.codalu, aluguel.codcorr FROM aluguel) AS a,
    (SELECT corretor.codcorr FROM corretor WHERE licenca = 'LC587') AS c
WHERE 
    a.codcorr = c.codcorr;

    SELECT * FROM aluguel WHERE codcorr = 3;

------------------------------------------------------------------
--6. Selecione os dados de todos os imóveis do
-- Bill Gates que estão alugados. 

--primeiro identifique o codprop de "Bill Gates"
SELECT codprop FROM proprietario WHERE nome = 'Bill Gates';

--depois a pesquisa principal
SELECT 
    imovel.*
FROM 
    imovel
WHERE 
    imovel.codprop = 2 AND imovel.alugado = true;

--ex do professor
    SELECT 
    p.nome AS NomeProprietario,
    i.descricao AS DescricaoImovel,
    i.valorauguel AS ValorAluguel,
    i.alugado AS SituacaoImovel
FROM 
    imovel i, proprietario p
WHERE 
    p.codprop = i.codprop
    AND p.nome = 'Bill Gates'
    AND i.alugado = true;


-----------------------------------------------------------------
--7. Selecione o nome do proprietario cujo contrato 
--de aluguel está registrado sob o codigo (codAlu) = 6. 

SELECT 
    proprietario.nome AS NomeProprietario
FROM 
    aluguel
JOIN 
    imovel ON aluguel.codimo = imovel.codimo
JOIN 
    proprietario ON imovel.codprop = proprietario.codprop
WHERE 
    aluguel.codalu = 6;
    
--outro jeito
SELECT 
    (SELECT nome FROM proprietario WHERE codprop = 
        (SELECT codprop FROM imovel WHERE codimo = 
            (SELECT codimo FROM aluguel WHERE codalu = 6)
        )
    ) AS NomeProprietario;

----------------------------------------------------------------------------------

--8. Quais são os proprietarios atendidos pelo corretor 'Alan Moore'? 

--encontrar o codigo do alan
SELECT codcorr FROM corretor WHERE nome = 'Alan Moore';

--pesquisa principal
SELECT 
    proprietario.nome AS NomeProprietario
FROM 
    corrprop
JOIN 
    proprietario ON corrprop.codprop = proprietario.codprop
WHERE 
    corrprop.codcorr = 4;

--outro jeito

SELECT 
    p.nome AS NomeProprietario
FROM 
    corrprop, proprietario p
WHERE 
    corrprop.codprop = p.codprop
    AND corrprop.codcorr = 4;


----------------------------------------------------------------------------
  --9. Quem sao os inquilinos que pagam um aluguel superior a R$5000,00?

SELECT 
    i.nome
FROM 
    inquilino i
WHERE 
    i.codinq IN (SELECT codinq FROM aluguel WHERE valorauguel > 5000);



