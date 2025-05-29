# Space Coffee - Sistema de Gerenciamento

Este repositório contém o sistema de gerenciamento da Space Coffee, incluindo a interface web e o banco de dados.

## Estrutura do Banco de Dados

O banco de dados está definido no arquivo `database.sql` e contém as seguintes tabelas:

- `produtos`: Armazena informações sobre os produtos da cafeteria
- `pedidos`: Registra os pedidos feitos pelos clientes
- `itens_pedido`: Tabela de relacionamento entre produtos e pedidos

## Como Executar o Banco de Dados

1. Certifique-se de ter o MySQL instalado em sua máquina
2. Abra o terminal ou prompt de comando
3. Execute o seguinte comando para acessar o MySQL:
   ```bash
   mysql -u seu_usuario -p
   ```
4. Digite sua senha quando solicitado
5. Execute o script SQL:
   ```bash
   source caminho/para/database.sql
   ```

## Verificando o Banco de Dados

Após executar o script, você pode verificar se as tabelas foram criadas corretamente usando os seguintes comandos:

```sql
USE space_coffee;
SHOW TABLES;
SELECT * FROM produtos;
SELECT * FROM pedidos;
SELECT * FROM itens_pedido;
```

## Estrutura das Tabelas

### Tabela produtos
- id_produto (INT, PRIMARY KEY)
- nome (VARCHAR)
- descricao (TEXT)
- preco (DECIMAL)
- categoria (VARCHAR)
- estoque (INT)
- data_cadastro (TIMESTAMP)

### Tabela pedidos
- id_pedido (INT, PRIMARY KEY)
- data_pedido (TIMESTAMP)
- status_pedido (ENUM)
- valor_total (DECIMAL)
- observacoes (TEXT)

### Tabela itens_pedido
- id_item (INT, PRIMARY KEY)
- id_pedido (INT, FOREIGN KEY)
- id_produto (INT, FOREIGN KEY)
- quantidade (INT)
- preco_unitario (DECIMAL)

## Relacionamentos

- Um pedido pode ter vários itens (1:N)
- Um produto pode estar em vários itens de pedido (1:N)
- A tabela itens_pedido faz a ligação entre pedidos e produtos (N:M)