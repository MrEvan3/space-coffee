# Space Coffee - Sistema de Gerenciamento

Este projeto contém a estrutura do banco de dados para o sistema de gerenciamento da Space Coffee.

## Estrutura do Banco de Dados

### Tabela: produtos
- id_produto (INT, PK): Identificador único do produto
- nome (VARCHAR): Nome do produto
- descricao (TEXT): Descrição detalhada do produto
- preco (DECIMAL): Preço do produto
- categoria (VARCHAR): Categoria do produto (Café, Sobremesa, etc.)
- estoque (INT): Quantidade disponível em estoque
- data_cadastro (TIMESTAMP): Data de cadastro do produto

### Tabela: pedidos
- id_pedido (INT, PK): Identificador único do pedido
- data_pedido (TIMESTAMP): Data e hora do pedido
- status_pedido (ENUM): Status atual do pedido
- valor_total (DECIMAL): Valor total do pedido
- observacoes (TEXT): Observações adicionais

### Tabela: itens_pedido
- id_item (INT, PK): Identificador único do item
- id_pedido (INT, FK): Referência ao pedido
- id_produto (INT, FK): Referência ao produto
- quantidade (INT): Quantidade do produto no pedido
- preco_unitario (DECIMAL): Preço unitário do produto no momento do pedido

## Como Executar

1. Execute o script `database.sql` em seu servidor MySQL
2. O banco de dados será criado automaticamente com algumas amostras de dados

## Relacionamentos

- Um pedido pode ter vários itens (1:N)
- Um produto pode estar em vários itens de pedido (1:N)
- A tabela itens_pedido faz a ligação entre pedidos e produtos (N:M)