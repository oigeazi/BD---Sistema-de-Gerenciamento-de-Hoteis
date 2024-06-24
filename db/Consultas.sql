-- a. Listar todos os hotéis e seus respectivos quartos, apresentando os seguintes campos: para hotel, nome e cidade; para quarto, tipo e preco_diaria;
SELECT h.nome AS hotel_nome, h.cidade, q.tipo, q.preco_diaria
FROM Hotel h
JOIN Quarto q ON h.hotel_id = q.hotel_id;

--b. ​Listar todos os clientes que já realizaram hospedagens (status_hosp igual á “finalizada”), e os respectivos quartos e hotéis;
SELECT c.nome AS cliente_nome, q.tipo AS quarto_tipo, h.nome AS hotel_nome
FROM Cliente c
JOIN Hospedagem hs ON c.cliente_id = hs.cliente_id
JOIN Quarto q ON hs.quarto_id = q.quarto_id
JOIN Hotel h ON q.hotel_id = h.hotel_id
WHERE hs.status_hosp = 'finalizada';

--c. ​Mostrar o histórico de hospedagens em ordem cronológica de um determinado cliente;
SELECT hs.*
FROM Hospedagem hs
JOIN Cliente c ON hs.cliente_id = c.cliente_id
WHERE c.cliente_id = 1 -- Substitua pelo ID do cliente desejado
ORDER BY hs.dt_checkin;
