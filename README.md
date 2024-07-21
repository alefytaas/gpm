# GPM - Gerenciador de Plantão Médico - CRONOMED

## Visão Geral

O GPM (Gerenciador de Plantão Médico) é uma aplicação web robusta desenvolvida com Ruby on Rails 7, projetada para otimizar a gestão de escalas médicas. A ferramenta oferece uma interface intuitiva para administradores e médicos, facilitando a criação, edição e monitoramento de plantões, além de permitir a geração de relatórios personalizados em PDF.

## Tecnologias Utilizadas

- **Ruby on Rails 7**: Framework principal da aplicação.
- **Bootstrap**: Biblioteca de front-end para estilização e layout responsivo.
- **PostgreSQL**: Banco de dados relacional utilizado.

## Funcionalidades

- **Gerenciamento de Escalas**: Permite a criação, edição e visualização de escalas médicas, associando médicos a plantões específicos.
- **Relatórios Personalizados**: Geração de relatórios em PDF de acordo com diversos critérios:
  - **Mensal Geral**: Relatório consolidado do mês.
  - **Mensal Por Pessoa**: Relatório mensal detalhado por médico.
  - **Por Data Específica**: Relatório para um período específico.
  - **Por Data Específica e Médico**: Relatório detalhado por data e médico.
- **Solicitação de Troca de Plantão**: Médicos podem solicitar trocas de plantões, sujeitas à aprovação dos administradores. O fluxo é o seguinte:
  - **Solicitação**: O médico seleciona o plantão que deseja trocar e propõe a troca para outro médico.
  - **Notificação**: Ambos os médicos e o administrador recebem uma notificação da solicitação de troca.
  - **Aprovação/Rejeição**: O administrador revisa a solicitação e aprova ou rejeita a troca.
  - **Atualização da Escala**: Em caso de aprovação, a escala é atualizada automaticamente para refletir a troca.
- **Autenticação e Autorização**: Sistema de login seguro, diferenciando acessos entre administradores e médicos.
- **Notificações por E-mail**: Notificações automáticas sobre alterações nas escalas e outras informações importantes.

## Instalação

### Pré-requisitos

- **Ruby** (versão 3.0 ou superior)
- **Rails** (versão 7.0 ou superior)
- **PostgreSQL**

### Passo a Passo

1. **Clone o repositório**:
   `git clone https://github.com/alefytaas/gpm.git`
   `cd gpm`

2. **Instale as Dependências**:
   `bundle install`

3. **Configure o Banco de Dados**:
   Edite o arquivo `config/database.yml` com suas credenciais do PostgreSQL.

4. **Crie e Migre o Banco de Dados**:
   `rails db:create`
   `rails db:migrate`

5. **Execute o Servidor**:
   `rails server`

## Uso

Acesse a aplicação no seu navegador em [http://localhost:3000](http://localhost:3000). Utilize as credenciais de administrador fornecidas para acessar todas as funcionalidades e configurar usuários médicos.

## Vídeo Demonstrativo

Para ver uma demonstração da aplicação em ação, assista ao vídeo abaixo:




https://github.com/user-attachments/assets/395c374f-0755-458e-bd23-fdfc58b6d7a1



## Contato

Para dúvidas, sugestões ou contribuições, entre em contato:

- Email: taas.sousa@gmail.com  
- LinkedIn: [LinkedIn - Alefy Almeida](https://www.linkedin.com/in/alefy-almeida-18657b21a/) 
