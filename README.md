# Projeto Engenharia Análitica

## Introdução ao Projeto

Esse projeto envolve taxas de câmbio e conversão de moedas, contendo como objetivo normalizar todas as todas as métricas financeiras da empresa para USD. Nos gerando dados importantes para análises estratégicas em direção ao negócio de uma empresa multinacional. Tarefas estruturadas em torno dos princípios da engenharia analítica, utilizando ferramentas modernas para dados, incluindo DBT para modelagem de dados e Snowflake para gerenciamento e armazenamento do banco de dados.

### Índice

- [Introdução](#introdução-ao-projeto)
- [Visão Geral Data Sources](#visão-geral-data-sources)
- [Modelagem De Dados](#modelagem-de-dados)
- [Fluxo De Dados](#fluxo-de-dados)
- [Testes e Validação de Dados](#testes-e-validação-de-dados)
- [Plataformas e Ferramentas](#plataformas-e-ferramentas)
- [Documentação](#documentação)



### Visão Geral Data Sources

A principal fonte de dados brutos do projeto se constitui em 6 tabelas do nosso database.

* *CLIENTES*
* *ESTOQUE*
* *LOJA*
* *MAPEAMENTO_CLIENTE_PRODUTO*
* *PRODUTOS*
* *VENDAS*

Para a inicialização do projeto consinstiu uma revisão dos dados contidos que estão presentes nas tabelas. Essa revisão foi de extrema importância para conhecer e entender mais específicadamente a estrutura e relacionamentos do banco de dados.


### Modelagem De Dados

A modelagem de dados do projeto foi construída através da documentação oficial do DBT. As pastas e modelos construidos estão presentes no diretório de ```models``` contendo três camadas, cada uma representando uma etapa de avanço do projeto. i. Staging - Camada de criação dos átomos, criando blocos de construção sendo módulos iniciais, a partir dos dados de origem. ii. Intermediate - Com átomos construidos, aplicamos camadas de lógica com propósitos específicos e unir nossos modelos staging em formas de entidade mais complexas e conectadas. iii. Marts - Reunimos nossos módulos e camadas, organizamos com que cada entidade contenha sua identidade e propósito.

O projeto juntamente trabalha com a modelagem dimensional, construindo tabelas de Fato e Dimensão, visando fornecer uma estrutura para análises rápidas e eficientes, com dados organizados para conter clareza e simplicide na interpretação.

Utilizei parte da Arquitetura Medalhão como principal fonte de inspiração para a modelagem de dados, mesmo que todos princípios da arquitetura não tenham sido aplicados ao projeto, me serviu como uma boa base. ([dataengineeringwiki](https://dataengineering.wiki/Concepts/Data+Architecture/Medallion+Architecture))

### Fluxo de Dados

Criei um diagrama para representar como os dados fluem e avançam dentre as camadas do projeto, também contendo informação de quando ocorre a conversão de moedas.

![Image](https://github.com/user-attachments/assets/448ae35e-c4d6-4d66-a1b6-1196688e855d)


### Testes e Validação De Dados

Testes de dados foram implementados a cada camada do projeto com o objetivo de garantir a validação e qualidade dos dados, desde testes mais simples, mas que são de extrema ajuda e importância, como valores únicos e não nulidade, até testes mais complexos como relacionamentos e valores únicos aceitaveis. Por exemplo dentro da tabela de sales garanti que os únicos valores aceitáveis como sigla de moedas fossem BRL, MXN, EUR e USD, assim que não adentrasse nenhuma moeda diferente ou dados inválidos.

### Plataformas e Ferramentas

* **DBT**
    * Utilizado para um processo de modelagem de dados dividido em três etapas: Staging, Intermediate e Marts, cada etapa e camada contendo seu papel e propósito único, como construção de blocos iniciais e básicos até blocos complexos prontos para a visualização em painéis.

* **Snowflake**
    * Sendo uma plataforma de Data Warehouse, no projeto desempenha um papel importante de gerenciar e armazenar o banco de dados.


* **sqlfluff**
    * Com funções de Linter e Formatter, foi utilizado para garantir padronização e boas práticas em código SQL.


* **pre-commit**
    * Ferramenta utilizada para execução automática de validação de código, garantindo qualidade e consistência no repositório.

### Documentação

O projeto contém a documentação mantida no GitHub, oferecendo uma única fonte de verdade.

Dentro do projeto, as tabelas criadas possuem uma documentação juntamente com os testes de dados, podendo ser encontrados em suas respectivas camadas, presentes em arquivos.yml contendo informações claras e objetivas sobre o propósito da tabela e módulo. Essa documentação pode ser facilmente acessada através de ```dbt docs generate``` e ```dbt docs serve```, obtendo adicionalmente o grafico de linhagem.
