-- 4. Escreva as seguintes consultas e comandos SQL:
-- a. Listar todos os hotéis e seus respectivos quartos, apresentando os seguintes campos: para hotel, nome e cidade; para quarto, tipo e preco_diaria;
SELECT h.nome AS hotel_nome, h.cidade, q.tipo, q.preco_diaria
FROM Hotel h
JOIN Quarto q ON h.hotel_id = q.hotel_id;

-- b. Listar todos os clientes que já realizaram hospedagens (status_hosp igual á “finalizada”), e os respectivos quartos e hotéis;
SELECT c.nome AS cliente_nome, q.tipo AS quarto_tipo, h.nome AS hotel_nome
FROM Cliente c
JOIN Hospedagem hs ON c.cliente_id = hs.cliente_id
JOIN Quarto q ON hs.quarto_id = q.quarto_id
JOIN Hotel h ON q.hotel_id = h.hotel_id
WHERE hs.status_hosp = 'finalizada';

-- c. Mostrar o histórico de hospedagens em ordem cronológica de um determinado cliente;
SELECT hs.*
FROM Hospedagem hs
JOIN Cliente c ON hs.cliente_id = c.cliente_id
WHERE c.cliente_id = 1
ORDER BY hs.dt_checkin;

-- d. Apresentar o cliente com maior número de hospedagens (não importando o tempo em que ficou hospedado);
SELECT c.nome, COUNT(hs.hospedagem_id) AS total_hospedagens
FROM Cliente c
JOIN Hospedagem hs ON c.cliente_id = hs.cliente_id
GROUP BY c.cliente_id
ORDER BY total_hospedagens DESC
LIMIT 1;

-- e. Apresentar clientes que tiveram hospedagem “cancelada”, os respectivos quartos e hotéis.
SELECT c.nome AS cliente_nome, q.tipo AS quarto_tipo, h.nome AS hotel_nome
FROM Cliente c
JOIN Hospedagem hs ON c.cliente_id = hs.cliente_id
JOIN Quarto q ON hs.quarto_id = q.quarto_id
JOIN Hotel h ON q.hotel_id = h.hotel_id
WHERE hs.status_hosp = 'cancelada';

-- f. Calcular a receita de todos os hotéis (hospedagem com status_hosp igual a “finalizada”), ordenado de forma decrescente;
SELECT h.nome AS hotel_nome, SUM(hs.valor_total_hosp) AS receita_total
FROM Hospedagem hs
JOIN Quarto q ON hs.quarto_id = q.quarto_id
JOIN Hotel h ON q.hotel_id = h.hotel_id
WHERE hs.status_hosp = 'finalizada'
GROUP BY h.hotel_id
ORDER BY receita_total DESC;

-- g. Listar todos os clientes que já fizeram uma reserva em um hotel específico;
SELECT DISTINCT c.nome AS cliente_nome
FROM Cliente c
JOIN Hospedagem hs ON c.cliente_id = hs.cliente_id
JOIN Quarto q ON hs.quarto_id = q.quarto_id
JOIN Hotel h ON q.hotel_id = h.hotel_id
WHERE h.hotel_id = 1;

-- h. Listar o quanto cada cliente que gastou em hospedagens (status_hosp igual a “finalizada”), em ordem decrescente por valor gasto.
SELECT c.nome AS cliente_nome, SUM(hs.valor_total_hosp) AS total_gasto
FROM Cliente c
JOIN Hospedagem hs ON c.cliente_id = hs.cliente_id
WHERE hs.status_hosp = 'finalizada'
GROUP BY c.cliente_id
ORDER BY total_gasto DESC;

-- i. Listar todos os quartos que ainda não receberam hóspedes.
SELECT q.*
FROM Quarto q
LEFT JOIN Hospedagem hs ON q.quarto_id = hs.quarto_id
WHERE hs.hospedagem_id IS NULL;

-- j. Apresentar a média de preços de diárias em todos os hotéis, por tipos de quarto.
SELECT q.tipo, AVG(q.preco_diaria) AS media_preco
FROM Quarto q
GROUP BY q.tipo;

-- l. Criar a coluna checkin_realizado do tipo booleano na tabela Hospedagem (via código). E atribuir verdadeiro para as Hospedagens com status_hosp “finalizada” e “hospedado”, e como falso para Hospedagens com status_hosp “reserva” e “cancelada”.
ALTER TABLE Hospedagem ADD COLUMN checkin_realizado BOOLEAN;

UPDATE Hospedagem
SET checkin_realizado = CASE
    WHEN status_hosp IN ('finalizada', 'hospedado') THEN TRUE
    ELSE FALSE
END;

-- m. Mudar o nome da coluna “classificacao” da tabela Hotel para “ratting” (via código).
ALTER TABLE Hotel CHANGE classificacao ratting INT;