CREATE PROCEDURE AsignarSaldosAGestores
AS
BEGIN
    DECLARE @TotalGestores INT, @GestorActual INT, @SaldoActual INT;

    -- Obtener el total de gestores
    SET @TotalGestores = (SELECT COUNT(*) FROM Gestores);
    SET @GestorActual = 1;

    -- Ordenar los saldos en orden descendente
    DECLARE saldo_cursor CURSOR FOR
    SELECT id FROM Saldos ORDER BY Valor DESC;

    OPEN saldo_cursor;
    FETCH NEXT FROM saldo_cursor INTO @SaldoActual;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Asignar el saldo al gestor actual
        INSERT INTO Asignaciones (gestores_id, saldo_id)
        VALUES (@GestorActual, @SaldoActual);

        -- Cambiar al siguiente gestor
        SET @GestorActual = @GestorActual + 1;

        -- Si el gestor actual supera el total de gestores, reiniciar a 1
        IF @GestorActual > @TotalGestores
            SET @GestorActual = 1;

        FETCH NEXT FROM saldo_cursor INTO @SaldoActual;
    END;

    CLOSE saldo_cursor;
    DEALLOCATE saldo_cursor;
END;