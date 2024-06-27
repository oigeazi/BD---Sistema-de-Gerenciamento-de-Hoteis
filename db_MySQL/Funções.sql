--6. Efetue a criação das seguintes funções utilizando PL/MySQL:
-- a. Criar uma function chamada "TotalHospedagensHotel" que aceita hotel_id como parâmetro. A função deve retornar o número total de hospedagens realizadas em um determinado hotel.​
DELIMITER //

CREATE FUNCTION TotalHospedagensHotel(hotel_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_hospedagens INT;

    SELECT COUNT(*)
    INTO total_hospedagens
    FROM Hospedagem hs
    JOIN Quarto q ON hs.quarto_id = q.quarto_id
    WHERE q.hotel_id = hotel_id;

    RETURN total_hospedagens;
END //

DELIMITER ;

-- b. Criar uma função chamada "ValorMedioDiariasHotel" que aceita hotel_id como parâmetro. A função deve calcular e retornar o valor médio das diárias dos quartos deste hotel.
DELIMITER //

CREATE FUNCTION ValorMedioDiariasHotel(hotel_id INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE valor_medio DECIMAL(10, 2);

    SELECT AVG(q.preco_diaria)
    INTO valor_medio
    FROM Quarto q
    WHERE q.hotel_id = hotel_id;

    RETURN valor_medio;
END //

DELIMITER ;

-- c. Criar uma função chamada "VerificarDisponibilidadeQuarto" que aceita quarto_id e data como parâmetros. A função deve retornar um valor booleano indicando se o quarto está disponível ou não para reserva na data especificada.​
DELIMITER //

CREATE FUNCTION VerificarDisponibilidadeQuarto(quarto_id INT, data DATE)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE disponibilidade BOOLEAN;

    SELECT COUNT(*) = 0
    INTO disponibilidade
    FROM Hospedagem hs
    WHERE hs.quarto_id = quarto_id
    AND data BETWEEN hs.dt_checkin AND hs.dt_checkout;

    RETURN disponibilidade;
END //

DELIMITER ;