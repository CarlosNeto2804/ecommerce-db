-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Tempo de geração: 10/12/2020 às 02:07
-- Versão do servidor: 8.0.20
-- Versão do PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ecommerce`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `Clientes`
--

CREATE TABLE `Clientes` (
  `codCliente` int NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `dataCriacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dataNascimento` date NOT NULL,
  `sexo` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `Clientes`
--

INSERT INTO `Clientes` (`codCliente`, `nome`, `email`, `cidade`, `estado`, `senha`, `cpf`, `dataCriacao`, `dataNascimento`, `sexo`) VALUES
(1, 'Carlos Alberto de Jesus', 'carlosajpn@gmail.com', 'Campo Grande ', 'Mato Grosso do Sul', 'carlos123', '07264464164', '2020-12-07 23:41:41', '2000-04-28', 'M'),
(2, 'Diego Bulhoes', 'diego@gmail.com', 'Campo Grande ', 'Mato Grosso do Sul', 'diego123', '11111111111', '2020-12-06 23:43:37', '1999-01-10', 'M'),
(3, 'Hernanes Linux', 'hernanes@gmail.com', 'Presidente Prudente', 'São Paulo', 'hernanes123', '00000000000', '2020-12-06 23:45:38', '1998-02-10', 'M'),
(4, 'Maria Joaquina', 'maria@gmail.com', 'Rio de Janeiro', 'Rio de Janeiro', 'maria123', '22222222222', '2020-12-06 23:46:49', '1997-11-11', 'F');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Compras`
--

CREATE TABLE `Compras` (
  `codCompra` int NOT NULL,
  `codForncedor` int NOT NULL,
  `codTransporte` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `Compras`
--

INSERT INTO `Compras` (`codCompra`, `codForncedor`, `codTransporte`) VALUES
(1, 1, 3),
(2, 1, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `DescontoProdutos`
--

CREATE TABLE `DescontoProdutos` (
  `codDesconto` int NOT NULL,
  `codPromocao` int NOT NULL,
  `codProduto` int NOT NULL,
  `porcDesconto` decimal(3,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `DescontoProdutos`
--

INSERT INTO `DescontoProdutos` (`codDesconto`, `codPromocao`, `codProduto`, `porcDesconto`) VALUES
(1, 1, 2, '0.10'),
(2, 1, 1, '0.20');

-- --------------------------------------------------------

--
-- Estrutura para tabela `EnderecosClientes`
--

CREATE TABLE `EnderecosClientes` (
  `codEnderecoCliente` int NOT NULL,
  `codCliente` int NOT NULL,
  `cep` varchar(8) NOT NULL,
  `logradouro` varchar(255) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `estado` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `apelido` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `EnderecosClientes`
--

INSERT INTO `EnderecosClientes` (`codEnderecoCliente`, `codCliente`, `cep`, `logradouro`, `cidade`, `estado`, `apelido`) VALUES
(1, 1, '79062550', 'Rua Maria Virginea Pimentel, n64', 'Campo Grande', 'Mato Grosso do Sul', 'Casa'),
(2, 1, '79000000', 'Rua dos Bobos n0', 'Campo Grande', 'Mato Grosso do Sul', 'Trabalho'),
(3, 2, '79062110', 'Rua Maria, n64', 'Campo Grande', 'Mato Grosso do Sul', 'Home'),
(4, 2, '79000222', 'Rua dos Flauta n0', 'Campo Grande', 'Mato Grosso do Sul', 'Work'),
(5, 3, '11111111', 'Rua das Garças n34', 'Presidente Prudente', 'São Paulo', 'My Casa'),
(6, 3, '11111111', 'Rua MySql n32', 'São Paulo', 'São Paulo', 'Empresa'),
(7, 4, '79062551', 'Rua das Garças n44', 'Presidente Prudente', 'São Paulo', 'lar doce lar'),
(8, 4, '11111220', 'Rua MySql n55', 'São Paulo', 'São Paulo', 'Casa da minha Mãe');

-- --------------------------------------------------------

--
-- Estrutura para tabela `EnderecosFornecedores`
--

CREATE TABLE `EnderecosFornecedores` (
  `codEnderecoFornecedor` int NOT NULL,
  `codForncedor` int NOT NULL,
  `cep` varchar(8) NOT NULL,
  `logradouro` varchar(255) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `EnderecosFornecedores`
--

INSERT INTO `EnderecosFornecedores` (`codEnderecoFornecedor`, `codForncedor`, `cep`, `logradouro`, `cidade`, `estado`) VALUES
(1, 1, '79062550', 'Rua teste n111', 'Teste ', 'Fim Do Mundo'),
(2, 2, '79065440', 'Longe n1', 'Rio Negro', 'Mato Grosso do Sul'),
(3, 4, '79062770', 'Rua linux n64', 'Riberao Preto ', 'São paulo'),
(4, 3, '79065440', 'Longe n3', 'Rio Negro', 'Mato Grosso do Sul');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Feedbacks`
--

CREATE TABLE `Feedbacks` (
  `codFeedback` int NOT NULL,
  `codVenda` int NOT NULL,
  `numEstrelas` decimal(10,1) NOT NULL,
  `comentario` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `Feedbacks`
--

INSERT INTO `Feedbacks` (`codFeedback`, `codVenda`, `numEstrelas`, `comentario`) VALUES
(1, 1, '5.0', 'Gostei muito'),
(2, 2, '4.5', 'TOP');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Fornecedores`
--

CREATE TABLE `Fornecedores` (
  `codFornecedor` int NOT NULL,
  `nomeSocial` varchar(255) NOT NULL,
  `cnpj` varchar(14) NOT NULL,
  `dataCriacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `Fornecedores`
--

INSERT INTO `Fornecedores` (`codFornecedor`, `nomeSocial`, `cnpj`, `dataCriacao`) VALUES
(1, 'Nike', '78787878787878', '2020-12-07 00:10:28'),
(2, 'Adidas', '12121212121212', '2020-12-07 00:10:28'),
(3, 'Puma', '78787878723232', '2020-12-07 00:11:42'),
(4, 'Oboticario', '12121212120009', '2020-12-07 00:11:42');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Pagamentos`
--

CREATE TABLE `Pagamentos` (
  `codPagamento` int NOT NULL,
  `codPagamentoBoleto` int DEFAULT NULL,
  `codPagamentoCredito` int DEFAULT NULL,
  `status` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'processamento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `Pagamentos`
--

INSERT INTO `Pagamentos` (`codPagamento`, `codPagamentoBoleto`, `codPagamentoCredito`, `status`) VALUES
(1, 1, NULL, 'processamento'),
(2, 2, NULL, 'processamento'),
(3, NULL, 2, 'pago'),
(4, NULL, 1, 'pago');

-- --------------------------------------------------------

--
-- Estrutura para tabela `PagamentosBoleto`
--

CREATE TABLE `PagamentosBoleto` (
  `codPagamentoBoleto` int NOT NULL,
  `numBoleto` int NOT NULL,
  `dataVencimento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `PagamentosBoleto`
--

INSERT INTO `PagamentosBoleto` (`codPagamentoBoleto`, `numBoleto`, `dataVencimento`) VALUES
(1, 121212, '2021-02-01'),
(2, 4545454, '2020-12-31');

-- --------------------------------------------------------

--
-- Estrutura para tabela `PagamentosCredito`
--

CREATE TABLE `PagamentosCredito` (
  `codPagamentoCredito` int NOT NULL,
  `idTransacao` int NOT NULL,
  `numCartao` varchar(50) NOT NULL,
  `bandeira` varchar(100) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `totalParcelas` int NOT NULL,
  `valorParcelas` decimal(10,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `PagamentosCredito`
--

INSERT INTO `PagamentosCredito` (`codPagamentoCredito`, `idTransacao`, `numCartao`, `bandeira`, `cpf`, `nome`, `totalParcelas`, `valorParcelas`) VALUES
(1, 2021121421, '3542595386128951', 'jcb', '45665469854', 'Ardyce Cheavin', 2, '186.420'),
(2, 406, '6377323716610322', 'instapayment', '78998745656', 'Hollis Fetherstone', 4, '238.930');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Produtos`
--

CREATE TABLE `Produtos` (
  `codProduto` int NOT NULL,
  `nome` varchar(255) NOT NULL,
  `marca` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `precoBase` int NOT NULL,
  `qtdEstoque` int NOT NULL,
  `dataCriacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `Produtos`
--

INSERT INTO `Produtos` (`codProduto`, `nome`, `marca`, `descricao`, `precoBase`, `qtdEstoque`, `dataCriacao`) VALUES
(1, 'Coffee - Frthy Coffee Crisp', 'DiorSkin Forever Wear Extending Invisible Retouch SPF 8 - 002', 'condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit', 730, 73, '2020-06-12 10:57:23'),
(2, 'Mince Meat - Filling', 'Indomethacin', 'id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci', 201, 169, '2020-03-30 20:22:37'),
(3, 'Mace', 'Prochlorperazine Maleate', 'habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut', 493, 82, '2020-10-31 06:16:30'),
(4, 'Food Colouring - Orange', 'LOreal Paris Ideal Moisture Sensitive Skin Broad Spectrum SPF 25 Sunscreen', 'ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar', 91, 97, '2020-07-26 01:01:31'),
(5, 'Tamarillo', 'Trichoderma', 'eget tempus vel pede morbi porttitor lorem id ligula suspendisse', 184, 23, '2020-11-22 15:43:26'),
(6, 'Basil - Primerba, Paste', 'Total Niccolum', 'fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis', 832, 156, '2020-05-22 18:06:34'),
(7, 'Ice Cream - Fudge Bars', 'Hog Hair', 'vestibulum proin eu mi nulla ac enim in tempor turpis nec', 274, 17, '2020-11-28 23:38:48'),
(8, 'Lid - 10,12,16 Oz', 'Arbonne Revelage', 'fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a', 60, 137, '2020-08-27 06:42:27'),
(9, 'Kellogs All Bran Bars', 'Medique Ban-acid', 'blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in', 131, 156, '2020-04-25 08:33:41'),
(10, 'Sandwich Wrap', 'Cleviprex', 'vestibulum ante ipsum primis in faucibus orci luctus et ultrices', 281, 159, '2020-02-04 17:57:02');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ProdutosDasCompras`
--

CREATE TABLE `ProdutosDasCompras` (
  `codProdutoCompra` int NOT NULL,
  `codCompra` int NOT NULL,
  `codProduto` int NOT NULL,
  `qtdComprada` int NOT NULL,
  `precoUnitario` decimal(10,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `ProdutosDasCompras`
--

INSERT INTO `ProdutosDasCompras` (`codProdutoCompra`, `codCompra`, `codProduto`, `qtdComprada`, `precoUnitario`) VALUES
(1, 1, 6, 100, '200.000'),
(2, 2, 2, 50, '500.000');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ProdutosDasVendas`
--

CREATE TABLE `ProdutosDasVendas` (
  `codProdutoVenda` int NOT NULL,
  `codProduto` int NOT NULL,
  `precoDeVenda` decimal(10,3) NOT NULL,
  `qtdVendida` int NOT NULL,
  `codVenda` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `ProdutosDasVendas`
--

INSERT INTO `ProdutosDasVendas` (`codProdutoVenda`, `codProduto`, `precoDeVenda`, `qtdVendida`, `codVenda`) VALUES
(1, 1, '800.000', 1, 1),
(2, 6, '1000.000', 2, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Promocoes`
--

CREATE TABLE `Promocoes` (
  `codPromocao` int NOT NULL,
  `nome` varchar(255) NOT NULL,
  `inicio` date NOT NULL,
  `fim` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `Promocoes`
--

INSERT INTO `Promocoes` (`codPromocao`, `nome`, `inicio`, `fim`) VALUES
(1, 'Black Week', '2020-12-01', '2020-12-24'),
(2, 'Hellowen', '2020-10-01', '2020-10-31');

-- --------------------------------------------------------

--
-- Estrutura para tabela `TelefonesClientes`
--

CREATE TABLE `TelefonesClientes` (
  `codTelefoneCliente` int NOT NULL,
  `codCliente` int NOT NULL,
  `numTelefone` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TelefonesClientes`
--

INSERT INTO `TelefonesClientes` (`codTelefoneCliente`, `codCliente`, `numTelefone`) VALUES
(1, 1, '5567984540120'),
(2, 3, '5511988888888'),
(3, 1, '5567984540122'),
(4, 3, '5511988888999'),
(5, 2, '5567984541111'),
(6, 2, '5511988883333'),
(7, 4, '5500000000000'),
(8, 4, '551155555555'),
(9, 4, '5500000001234'),
(10, 1, '551155551234');

-- --------------------------------------------------------

--
-- Estrutura para tabela `TelefonesFornecedores`
--

CREATE TABLE `TelefonesFornecedores` (
  `codTelefoneFornecedor` int NOT NULL,
  `codFornecedor` int NOT NULL,
  `numTelefone` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TelefonesFornecedores`
--

INSERT INTO `TelefonesFornecedores` (`codTelefoneFornecedor`, `codFornecedor`, `numTelefone`) VALUES
(1, 1, '5500000000111'),
(2, 1, '5511988888812'),
(3, 1, '628-865-9569'),
(4, 2, '221-971-8068'),
(5, 3, '445-625-6301'),
(6, 4, '609-402-6533');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Transportes`
--

CREATE TABLE `Transportes` (
  `codTransporte` int NOT NULL,
  `nomeTransportadora` varchar(255) NOT NULL,
  `dataPrevistaEntrega` date NOT NULL,
  `valorTransporte` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `Transportes`
--

INSERT INTO `Transportes` (`codTransporte`, `nomeTransportadora`, `dataPrevistaEntrega`, `valorTransporte`) VALUES
(1, 'PAC', '2021-02-01', '20'),
(2, 'PAC', '2020-12-31', '50'),
(3, 'Sedex', '2021-01-01', '30'),
(4, 'Transportadora', '2020-10-31', '50'),
(5, 'Pac', '2020-10-20', '20'),
(6, 'Transportadora', '2021-01-10', '73');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Vendas`
--

CREATE TABLE `Vendas` (
  `codVenda` int NOT NULL,
  `codCliente` int NOT NULL,
  `codTransporte` int NOT NULL,
  `codEnderecoCliente` int NOT NULL,
  `codPagamento` int NOT NULL,
  `dataVenda` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `Vendas`
--

INSERT INTO `Vendas` (`codVenda`, `codCliente`, `codTransporte`, `codEnderecoCliente`, `codPagamento`, `dataVenda`) VALUES
(1, 1, 1, 1, 1, '2020-12-07 02:25:44'),
(2, 2, 2, 3, 2, '2020-12-07 02:25:44'),
(3, 1, 1, 1, 1, '2020-12-07 02:27:23'),
(4, 2, 2, 3, 2, '2020-12-07 02:27:23');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `Clientes`
--
ALTER TABLE `Clientes`
  ADD PRIMARY KEY (`codCliente`);

--
-- Índices de tabela `Compras`
--
ALTER TABLE `Compras`
  ADD PRIMARY KEY (`codCompra`),
  ADD KEY `codForncedor` (`codForncedor`),
  ADD KEY `codTransporte` (`codTransporte`);

--
-- Índices de tabela `DescontoProdutos`
--
ALTER TABLE `DescontoProdutos`
  ADD PRIMARY KEY (`codDesconto`),
  ADD KEY `codProduto` (`codProduto`),
  ADD KEY `codPromocao` (`codPromocao`);

--
-- Índices de tabela `EnderecosClientes`
--
ALTER TABLE `EnderecosClientes`
  ADD PRIMARY KEY (`codEnderecoCliente`),
  ADD KEY `codCliente` (`codCliente`);

--
-- Índices de tabela `EnderecosFornecedores`
--
ALTER TABLE `EnderecosFornecedores`
  ADD PRIMARY KEY (`codEnderecoFornecedor`),
  ADD KEY `codForncedor` (`codForncedor`);

--
-- Índices de tabela `Feedbacks`
--
ALTER TABLE `Feedbacks`
  ADD PRIMARY KEY (`codFeedback`),
  ADD KEY `codVenda` (`codVenda`);

--
-- Índices de tabela `Fornecedores`
--
ALTER TABLE `Fornecedores`
  ADD PRIMARY KEY (`codFornecedor`);

--
-- Índices de tabela `Pagamentos`
--
ALTER TABLE `Pagamentos`
  ADD PRIMARY KEY (`codPagamento`),
  ADD KEY `codPagamentoBoleto` (`codPagamentoBoleto`),
  ADD KEY `codPagamentoCredito` (`codPagamentoCredito`);

--
-- Índices de tabela `PagamentosBoleto`
--
ALTER TABLE `PagamentosBoleto`
  ADD PRIMARY KEY (`codPagamentoBoleto`);

--
-- Índices de tabela `PagamentosCredito`
--
ALTER TABLE `PagamentosCredito`
  ADD PRIMARY KEY (`codPagamentoCredito`);

--
-- Índices de tabela `Produtos`
--
ALTER TABLE `Produtos`
  ADD PRIMARY KEY (`codProduto`);

--
-- Índices de tabela `ProdutosDasCompras`
--
ALTER TABLE `ProdutosDasCompras`
  ADD PRIMARY KEY (`codProdutoCompra`),
  ADD KEY `codCompra` (`codCompra`),
  ADD KEY `codProduto` (`codProduto`);

--
-- Índices de tabela `ProdutosDasVendas`
--
ALTER TABLE `ProdutosDasVendas`
  ADD PRIMARY KEY (`codProdutoVenda`),
  ADD KEY `codProduto` (`codProduto`),
  ADD KEY `codVenda` (`codVenda`);

--
-- Índices de tabela `Promocoes`
--
ALTER TABLE `Promocoes`
  ADD PRIMARY KEY (`codPromocao`);

--
-- Índices de tabela `TelefonesClientes`
--
ALTER TABLE `TelefonesClientes`
  ADD PRIMARY KEY (`codTelefoneCliente`),
  ADD KEY `codCliente` (`codCliente`);

--
-- Índices de tabela `TelefonesFornecedores`
--
ALTER TABLE `TelefonesFornecedores`
  ADD PRIMARY KEY (`codTelefoneFornecedor`),
  ADD KEY `codForncedor` (`codFornecedor`);

--
-- Índices de tabela `Transportes`
--
ALTER TABLE `Transportes`
  ADD PRIMARY KEY (`codTransporte`);

--
-- Índices de tabela `Vendas`
--
ALTER TABLE `Vendas`
  ADD PRIMARY KEY (`codVenda`),
  ADD KEY `codCliente` (`codCliente`),
  ADD KEY `codEnderecoCliente` (`codEnderecoCliente`),
  ADD KEY `codPagamento` (`codPagamento`),
  ADD KEY `codTransporte` (`codTransporte`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `Clientes`
--
ALTER TABLE `Clientes`
  MODIFY `codCliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `Compras`
--
ALTER TABLE `Compras`
  MODIFY `codCompra` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `DescontoProdutos`
--
ALTER TABLE `DescontoProdutos`
  MODIFY `codDesconto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `EnderecosClientes`
--
ALTER TABLE `EnderecosClientes`
  MODIFY `codEnderecoCliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `EnderecosFornecedores`
--
ALTER TABLE `EnderecosFornecedores`
  MODIFY `codEnderecoFornecedor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `Feedbacks`
--
ALTER TABLE `Feedbacks`
  MODIFY `codFeedback` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `Fornecedores`
--
ALTER TABLE `Fornecedores`
  MODIFY `codFornecedor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `Pagamentos`
--
ALTER TABLE `Pagamentos`
  MODIFY `codPagamento` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `PagamentosBoleto`
--
ALTER TABLE `PagamentosBoleto`
  MODIFY `codPagamentoBoleto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `PagamentosCredito`
--
ALTER TABLE `PagamentosCredito`
  MODIFY `codPagamentoCredito` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `Produtos`
--
ALTER TABLE `Produtos`
  MODIFY `codProduto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `ProdutosDasCompras`
--
ALTER TABLE `ProdutosDasCompras`
  MODIFY `codProdutoCompra` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `ProdutosDasVendas`
--
ALTER TABLE `ProdutosDasVendas`
  MODIFY `codProdutoVenda` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `Promocoes`
--
ALTER TABLE `Promocoes`
  MODIFY `codPromocao` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `TelefonesClientes`
--
ALTER TABLE `TelefonesClientes`
  MODIFY `codTelefoneCliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `TelefonesFornecedores`
--
ALTER TABLE `TelefonesFornecedores`
  MODIFY `codTelefoneFornecedor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `Transportes`
--
ALTER TABLE `Transportes`
  MODIFY `codTransporte` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `Vendas`
--
ALTER TABLE `Vendas`
  MODIFY `codVenda` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `Compras`
--
ALTER TABLE `Compras`
  ADD CONSTRAINT `Compras_ibfk_1` FOREIGN KEY (`codForncedor`) REFERENCES `Fornecedores` (`codFornecedor`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Compras_ibfk_2` FOREIGN KEY (`codTransporte`) REFERENCES `Transportes` (`codTransporte`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Restrições para tabelas `DescontoProdutos`
--
ALTER TABLE `DescontoProdutos`
  ADD CONSTRAINT `DescontoProdutos_ibfk_1` FOREIGN KEY (`codProduto`) REFERENCES `Produtos` (`codProduto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `DescontoProdutos_ibfk_2` FOREIGN KEY (`codPromocao`) REFERENCES `Promocoes` (`codPromocao`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Restrições para tabelas `EnderecosClientes`
--
ALTER TABLE `EnderecosClientes`
  ADD CONSTRAINT `EnderecosClientes_ibfk_1` FOREIGN KEY (`codCliente`) REFERENCES `Clientes` (`codCliente`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Restrições para tabelas `EnderecosFornecedores`
--
ALTER TABLE `EnderecosFornecedores`
  ADD CONSTRAINT `EnderecosFornecedores_ibfk_1` FOREIGN KEY (`codForncedor`) REFERENCES `Fornecedores` (`codFornecedor`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Restrições para tabelas `Feedbacks`
--
ALTER TABLE `Feedbacks`
  ADD CONSTRAINT `Feedbacks_ibfk_1` FOREIGN KEY (`codVenda`) REFERENCES `Vendas` (`codVenda`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Restrições para tabelas `Pagamentos`
--
ALTER TABLE `Pagamentos`
  ADD CONSTRAINT `Pagamentos_ibfk_1` FOREIGN KEY (`codPagamentoBoleto`) REFERENCES `PagamentosBoleto` (`codPagamentoBoleto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Pagamentos_ibfk_2` FOREIGN KEY (`codPagamentoCredito`) REFERENCES `PagamentosCredito` (`codPagamentoCredito`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Restrições para tabelas `ProdutosDasCompras`
--
ALTER TABLE `ProdutosDasCompras`
  ADD CONSTRAINT `ProdutosDasCompras_ibfk_1` FOREIGN KEY (`codCompra`) REFERENCES `Compras` (`codCompra`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ProdutosDasCompras_ibfk_2` FOREIGN KEY (`codProduto`) REFERENCES `Produtos` (`codProduto`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Restrições para tabelas `ProdutosDasVendas`
--
ALTER TABLE `ProdutosDasVendas`
  ADD CONSTRAINT `ProdutosDasVendas_ibfk_1` FOREIGN KEY (`codProduto`) REFERENCES `Produtos` (`codProduto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ProdutosDasVendas_ibfk_2` FOREIGN KEY (`codVenda`) REFERENCES `Vendas` (`codVenda`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Restrições para tabelas `TelefonesClientes`
--
ALTER TABLE `TelefonesClientes`
  ADD CONSTRAINT `TelefonesClientes_ibfk_1` FOREIGN KEY (`codCliente`) REFERENCES `Clientes` (`codCliente`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Restrições para tabelas `TelefonesFornecedores`
--
ALTER TABLE `TelefonesFornecedores`
  ADD CONSTRAINT `TelefonesFornecedores_ibfk_1` FOREIGN KEY (`codFornecedor`) REFERENCES `Fornecedores` (`codFornecedor`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Restrições para tabelas `Vendas`
--
ALTER TABLE `Vendas`
  ADD CONSTRAINT `Vendas_ibfk_1` FOREIGN KEY (`codCliente`) REFERENCES `Clientes` (`codCliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Vendas_ibfk_2` FOREIGN KEY (`codEnderecoCliente`) REFERENCES `EnderecosClientes` (`codEnderecoCliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Vendas_ibfk_3` FOREIGN KEY (`codPagamento`) REFERENCES `Pagamentos` (`codPagamento`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Vendas_ibfk_4` FOREIGN KEY (`codTransporte`) REFERENCES `Transportes` (`codTransporte`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
