-- 5. Efetue a criação dos seguintes procedimentos usando PL/MySQL:
-- a. Criar uma procedure chamada "RegistrarCheckIn" que aceita hospedagem_id e data_checkin como parâmetros. A procedure deve atualizar a data de check-in na tabela "Hospedagem" e mudar o status_hosp para "hospedado".​
DELIMITER //

CREATE PROCEDURE RegistrarCheckIn(IN hospedagem_id INT, IN data_checkin DATE)
BEGIN
    UPDATE Hospedagem
    SET dt_checkin = data_checkin,
        status_hosp = 'hospedado'
    WHERE hospedagem_id = hospedagem_id;
END //

DELIMITER ;

-- b. Criar uma procedure chamada "CalcularTotalHospedagem" que aceita hospedagem_id como parâmetro. A procedure deve calcular o valor total da hospedagem com base na diferença de dias entre check-in e check-out e o preço da diária do quarto reservado. O valor deve ser atualizado na coluna valor_total_hosp.​
DELIMITER //

CREATE PROCEDURE CalcularTotalHospedagem(IN hospedagem_id INT)
BEGIN
    DECLARE preco_diaria DECIMAL(10,2);
    DECLARE dias_hospedagem INT;

    SELECT q.preco_diaria, DATEDIFF(hs.dt_checkout, hs.dt_checkin) AS duracao_hospedagem
    INTO preco_diaria, dias_hospedagem
    FROM Hospedagem hs
    JOIN Quarto q ON hs.quarto_id = q.quarto_id
    WHERE hs.hospedagem_id = hospedagem_id;

    UPDATE Hospedagem
    SET valor_total_hosp = preco_diaria * dias_hospedagem
    WHERE hospedagem_id = hospedagem_id;
END //

DELIMITER ;

-- c. Criar uma procedure chamada "RegistrarCheckout" que aceita hospedagem_id e data_checkout como parâmetros. A procedure deve atualizar a data de check-out na tabela "Hospedagem" e mudar o status_hosp para "finalizada".​
DELIMITER //

CREATE PROCEDURE RegistrarCheckout(IN hospedagem_id INT, IN data_checkout DATE)
BEGIN
    UPDATE Hospedagem
    SET dt_checkout = data_checkout,
        status_hosp = 'finalizada'
    WHERE hospedagem_id = hospedagem_id;
END //

DELIMITER ;
