--6. Efetue a criação das seguintes funções utilizando PL/MySQL:
--a. Criar uma function chamada "TotalHospedagensHotel" que aceita hotel_id como parâmetro. A função deve retornar o número total de hospedagens realizadas em um determinado hotel.​
CREATE OR REPLACE FUNCTION TotalHospedagensHotel(hotel_id INT)
RETURNS INT LANGUAGE plpgsql
AS $$
DECLARE
    total_hospedagens INT;
BEGIN
    SELECT COUNT(*)
    INTO total_hospedagens
    FROM Hospedagem hs
    JOIN Quarto q ON hs.quarto_id = q.quarto_id
    WHERE q.hotel_id = TotalHospedagensHotel.hotel_id;

    RETURN total_hospedagens;
END;
$$;

--b. Criar uma function chamada "ValorMedioDiariasHotel" que aceita hotel_id como parâmetro. A função deve calcular e retornar o valor médio das diárias dos quartos deste hotel.
CREATE OR REPLACE FUNCTION ValorMedioDiariasHotel(hotel_id INT)
RETURNS DECIMAL LANGUAGE plpgsql
AS $$
DECLARE
    valor_medio DECIMAL;
BEGIN
    SELECT AVG(q.preco_diaria)
    INTO valor_medio
    FROM Quarto q
    WHERE q.hotel_id = ValorMedioDiariasHotel.hotel_id;

    RETURN valor_medio;
END;
$$;

--c. Criar uma function chamada "VerificarDisponibilidadeQuarto" que aceita quarto_id e data como parâmetros. A função deve retornar um valor booleano indicando se o quarto está disponível ou não para reserva na data especificada.​
CREATE OR REPLACE FUNCTION VerificarDisponibilidadeQuarto(quarto_id INT, data DATE)
RETURNS BOOLEAN LANGUAGE plpgsql
AS $$
DECLARE
    disponibilidade BOOLEAN;
BEGIN
    SELECT COUNT(*) = 0
    INTO disponibilidade
    FROM Hospedagem hs
    WHERE hs.quarto_id = VerificarDisponibilidadeQuarto.quarto_id
    AND data BETWEEN hs.dt_checkin AND hs.dt_checkout;

    RETURN disponibilidade;
END;
$$;