# odoo-dev
Ambiente de desenvolvimento em Docker

## Pré-requisitos

- SSH configurado no GitHub
- Visual Studio Code instalado
- Python instalado no sistema

## Extensões do VS Code necessárias

- Dev Containers
- Python
- Docker

## Como usar

1. Clone o repositório
2. Abra o projeto no VS Code
3. Execute o arquivo `run.py`:
    ```bash
    python run.py
    ```
4. Quando solicitado pelo VS Code, clique em "Reopen in Container"
5. Aguarde a construção do container de desenvolvimento

O ambiente estará pronto para desenvolvimento Odoo.

## Executando e Depurando

Além da execução via terminal, você pode usar as opções de debug do VS Code:

- **Opção 1**: Acesse o painel "Run and Debug" (Executar e Depurar) no VS Code e clique em "Start Debugging" (Executar Depuração)
- **Opção 2**: Pressione `F5` para iniciar a execução/depuração diretamente

Ambas as opções permitirão executar o ambiente com breakpoints e ferramentas de debug integradas.
