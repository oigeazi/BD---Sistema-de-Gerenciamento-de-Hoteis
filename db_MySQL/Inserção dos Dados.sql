--3. Insira dados artificiais nas tabelas "Hotel" (2 hotéis), "Quarto"(5 para cada hotel), "Cliente"(3 clientes) e "Hospedagem" (20 hospedagens, 5 para cada um dos “Status_hosp”) para simular hotéis, quartos, clientes e hospedagens.

-- Inserir dados na tabela Hotel
INSERT INTO Hotel (nome, cidade, uf, classificacao) VALUES
('Hotel A', 'Cidade A', 'AA', 5),
('Hotel B', 'Cidade B', 'BB', 4);

-- Inserir dados na tabela Quarto
INSERT INTO Quarto (hotel_id, numero, tipo, preco_diaria) VALUES
(1, 1, 'Standard', 100.00),
(1, 2, 'Deluxe', 150.00),
(1, 3, 'Suíte', 200.00),
(1, 4, 'Standard', 100.00),
(1, 5, 'Deluxe', 150.00),
(2, 1, 'Standard', 80.00),
(2, 2, 'Deluxe', 120.00),
(2, 3, 'Suíte', 160.00),
(2, 4, 'Standard', 80.00),
(2, 5, 'Deluxe', 120.00);

-- Inserir dados na tabela Cliente
INSERT INTO Cliente (nome, email, telefone, cpf) VALUES
('Cliente A', 'clientea@example.com', '1111111111', '12345678901'),
('Cliente B', 'clienteb@example.com', '2222222222', '23456789012'),
('Cliente C', 'clientec@example.com', '3333333333', '34567890123');

-- Inserir dados na tabela Hospedagem
INSERT INTO Hospedagem (cliente_id, quarto_id, dt_checkin, dt_checkout, valor_total_hosp, status_hosp) VALUES
(1, 1, '2024-06-01', '2024-06-05', 400.00, 'finalizada'),
(1, 2, '2024-06-10', '2024-06-15', 750.00, 'finalizada'),
(1, 3, '2024-06-20', '2024-06-25', 1000.00, 'finalizada'),
(1, 4, '2024-07-01', '2024-07-05', 400.00, 'finalizada'),
(1, 5, '2024-07-10', '2024-07-15', 750.00, 'finalizada'),
(2, 1, '2024-06-01', '2024-06-05', 320.00, 'hospedado'),
(2, 2, '2024-06-10', '2024-06-15', 600.00, 'hospedado'),
(2, 3, '2024-06-20', '2024-06-25', 800.00, 'hospedado'),
(2, 4, '2024-07-01', '2024-07-05', 320.00, 'hospedado'),
(2, 5, '2024-07-10', '2024-07-15', 600.00, 'hospedado'),
(3, 1, '2024-06-01', '2024-06-05', 400.00, 'reserva'),
(3, 2, '2024-06-10', '2024-06-15', 750.00, 'reserva'),
(3, 3, '2024-06-20', '2024-06-25', 1000.00, 'reserva'),
(3, 4, '2024-07-01', '2024-07-05', 400.00, 'reserva'),
(3, 5, '2024-07-10', '2024-07-15', 750.00, 'reserva'),
(1, 1, '2024-06-01', '2024-06-05', 320.00, 'cancelada'),
(1, 2, '2024-06-10', '2024-06-15', 600.00, 'cancelada'),
(1, 3, '2024-06-20', '2024-06-25', 800.00, 'cancelada'),
(1, 4, '2024-07-01', '2024-07-05', 320.00, 'cancelada'),
(1, 5, '2024-07-10', '2024-07-15', 600.00, 'cancelada');
