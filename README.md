# Projeto Engenharia Análitica

## Introdução ao Projeto

Esse projeto envolve taxas de câmbio e conversão de moedas, nos gerando dados importantes para análises estratégicas em direção ao negócio de uma empresa multinacional. Tarefas estruturadas em torno dos princípios da engenharia analítica, utilizando ferramentas modernas para dados, incluindo DBT para modelagem de dados e Snowflake para gerenciamento e armazenamento do banco de dados.

### Índice

- [Introdução](#introdução-ao-projeto)
- [Visão Geral Data Sources](#visão-geral-data-sources)
- [Modelagem De Dados](#modelagem-de-dados)


### Visão Geral Data Sources

A principal fonte de dados brutos do projeto se constitui em 6 tabelas do nosso database.

* CLIENTES
* ESTOQUE
* LOJA
* MAPEAMENTO_CLIENTE_PRODUTO
* PRODUTOS
* VENDAS

Para a inicialização do projeto consinstiu uma revisão dos dados contidos que estão presentes nas tabelas. Essa revisão foi de extrema importância para conhecer e entender mais específicadamente a estrutura e relacionamentos do banco de dados.


### Modelagem De Dados

A modelagem de dados do projeto foi construída através da documentação oficial do DBT. As pastas e modelos construidos estão presentes no diretório de ```models``` contendo três camadas, cada uma representando uma etapa de avanço do projeto. i. Staging - Camada de criação dos átomos, criando blocos de construção sendo módulos iniciais, a partir dos dados de origem. ii. Intermediate - Com átomos construidos, aplicamos camadas de lógica com propósitos específicos e unir nossos modelos staging em formas de entidade mais complexas e conectadas. iii. Marts - Reunimos nossos módulos e camadas, organizamos com que cada entidade contenha sua identidade e propósito.

Utilizei parte da Arquitetura Medalhão como principal fonte de inspiração para a modelagem de dados, mesmo que alguns princípios da arquitetura não tenham sido todos aplicados ao projeto, me serviu como uma boa base. [
(dataengineeringwiki)]("https://dataengineering.wiki/Concepts/Data+Architecture/Medallion+Architecture")
