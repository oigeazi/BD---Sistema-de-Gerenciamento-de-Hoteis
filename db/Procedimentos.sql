--5. Efetue a criação dos seguintes procedimentos usando PL/MySQL:
--a. Criar uma procedure chamada "RegistrarCheckIn" que aceita hospedagem_id e data_checkin como parâmetros. A procedure deve atualizar a data de check-in na tabela "Hospedagem" e mudar o status_hosp para "hospedado".​
CREATE OR REPLACE PROCEDURE RegistrarCheckIn(hospedagem_id INT, data_checkin DATE)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Hospedagem
    SET dt_checkin = data_checkin,
        status_hosp = 'hospedado'
    WHERE Hospedagem.hospedagem_id = RegistrarCheckIn.hospedagem_id;
END;
$$;

--b. Criar uma procedure chamada "CalcularTotalHospedagem" que aceita hospedagem_id como parâmetro. A procedure deve calcular o valor total da hospedagem com base na diferença de dias entre check-in e check-out e o preço da diária do quarto reservado. O valor deve ser atualizado na coluna valor_total_hosp.​
CREATE OR REPLACE PROCEDURE CalcularTotalHospedagem(hospedagem_id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    preco_diaria DECIMAL;
    dias_hospedagem INT;
BEGIN
    SELECT q.preco_diaria, (hs.dt_checkout - hs.dt_checkin) AS duracao_hospedagem
    INTO preco_diaria, dias_hospedagem
    FROM Hospedagem hs
    JOIN Quarto q ON hs.quarto_id = q.quarto_id
    WHERE hs.hospedagem_id = CalcularTotalHospedagem.hospedagem_id;

    UPDATE Hospedagem
    SET valor_total_hosp = preco_diaria * dias_hospedagem
    WHERE Hospedagem.hospedagem_id = CalcularTotalHospedagem.hospedagem_id;
END;
$$;

--c. Criar uma procedure chamada "RegistrarCheckout" que aceita hospedagem_id e data_checkout como parâmetros. A procedure deve atualizar a data de check-out na tabela "Hospedagem" e mudar o status_hosp para "finalizada".​
CREATE OR REPLACE PROCEDURE RegistrarCheckout(hospedagem_id INT, data_checkout DATE)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Hospedagem
    SET dt_checkout = data_checkout,
        status_hosp = 'finalizada'
    WHERE Hospedagem.hospedagem_id = RegistrarCheckout.hospedagem_id;
END;
$$;