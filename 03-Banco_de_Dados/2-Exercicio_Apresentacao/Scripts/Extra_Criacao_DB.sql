DROP SCHEMA IF EXISTS NUMCOMECE;
CREATE SCHEMA NUMCOMECE;
USE NUMCOMECE;

CREATE TABLE PRODUTOS(
	ID_Produto BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Nome_Produto varchar(100) NOT NULL,
    Categoria varchar(100) NOT NULL,
    Preco_Unitario DECIMAL(10,2) NOT NULL,
    Quantidade_Estoque INT UNSIGNED DEFAULT 0,
    criado_por varchar(100) NOT NULL,
    data_criado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    editado_por varchar(100) NOT NULL,
    data_editado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE CLIENTES(
	ID_Cliente BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Nome_Cliente varchar(100) NOT NULL,
    Email varchar(100) NOT NULL UNIQUE,
    Telefone varchar(20) NOT NULL,
    criado_por varchar(100) NOT NULL,
    data_criado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    editado_por varchar(100) NOT NULL,
    data_editado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE ENDERECOS(
	ID_Endereco BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente BIGINT UNSIGNED NOT NULL,
    CEP char(8) NOT NULL,
    Pais varchar(50) NOT NULL,
    Estado varchar(50) NOT NULL,
    Cidade varchar(50) NOT NULL,
    Logradouro varchar(100) NOT NULL,
    Numero varchar(5) NOT NULL,
    criado_por varchar(100) NOT NULL,
    data_criado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    editado_por varchar(100) NOT NULL,
    data_editado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE PEDIDOS(
	ID_Pedido BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente BIGINT UNSIGNED NOT NULL,
    Data_Pedido datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ID_Pagamento BIGINT UNSIGNED NOT NULL,
    Valor_Total DECIMAL(10,2) NOT NULL DEFAULT 0,
    criado_por varchar(100) NOT NULL,
    data_criado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    editado_por varchar(100) NOT NULL,
    data_editado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE METODO_PAGAMENTO(
	ID_Pagamento BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Tipo_Pagamento varchar(30) NOT NULL,
    criado_por varchar(100) NOT NULL,
    data_criado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    editado_por varchar(100) NOT NULL,
    data_editado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE ITENS_PEDIDO(
	ID_Item BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ID_Pedido BIGINT UNSIGNED NOT NULL,
    ID_Produto BIGINT UNSIGNED NOT NULL,
    Quantidade INT UNSIGNED NOT NULL,
    Valor_Sub_Total DECIMAL(10,2) NOT NULL,
    criado_por varchar(100) NOT NULL,
    data_criado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    editado_por varchar(100) NOT NULL,
    data_editado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE STATUS_PEDIDOS (
    ID_Status BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(50) NOT NULL UNIQUE,
    criado_por varchar(100) NOT NULL,
    data_criado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    editado_por varchar(100) NOT NULL,
    data_editado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE HISTORICO_STATUS (
    ID_Historico BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ID_Pedido BIGINT UNSIGNED NOT NULL,
    ID_Status BIGINT UNSIGNED NOT NULL,
    Data_Hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    criado_por varchar(100) NOT NULL,
    data_criado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    editado_por varchar(100) NOT NULL,
    data_editado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE ENDERECOS ADD FOREIGN KEY (ID_Cliente) REFERENCES CLIENTES (ID_Cliente);
ALTER TABLE PEDIDOS ADD FOREIGN KEY (ID_Cliente) REFERENCES CLIENTES (ID_Cliente);
ALTER TABLE PEDIDOS ADD FOREIGN KEY (ID_Pagamento) REFERENCES METODO_PAGAMENTO (ID_Pagamento);
ALTER TABLE HISTORICO_STATUS ADD FOREIGN KEY (ID_Pedido) REFERENCES PEDIDOS (ID_Pedido);
ALTER TABLE HISTORICO_STATUS ADD FOREIGN KEY (ID_Status) REFERENCES STATUS_PEDIDOS (ID_Status);
ALTER TABLE ITENS_PEDIDO ADD FOREIGN KEY (ID_Pedido) REFERENCES PEDIDOS (ID_Pedido);
ALTER TABLE ITENS_PEDIDO ADD FOREIGN KEY (ID_Produto) REFERENCES PRODUTOS (ID_Produto);