DELIMITER $$
USE EDG $$
CREATE TRIGGER ATUALIZA_ESTOQUE
    AFTER INSERT
    ON VENDA_PRODUTO FOR EACH ROW
BEGIN
    IF NEW.QTDE > 0 OR NEW.QTDE <> NULL THEN
        UPDATE PRODUTO SET QUANTIDADE = NEW.QTDE WHERE ID_PRODUTO = NEW.ID_PRODUTO;
    ELSE
        UPDATE PRODUTO SET KG = NEW.KG WHERE ID_PRODUTO = NEW.ID_PRODUTO;
    END IF;
END$$    
