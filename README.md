# 🛡️ CASE: Automação de Testes - Blog do Agi

**Status do Projeto:** 🚀 Em Execução (CI/CD Ativo)  
**Objetivo:** Automação de testes abrangendo testes de interface (Web) e testes de integração (API), utilizando Robot Framework e Python.

---

## 📋 Estrutura do Projeto
O projeto está dividido em duas frentes principais:

1. Web Automation: Validação de funcionalidades de busca no [Blog do Agi](https://blogdoagi.com.br/).

2. API Automation: Validação de endpoints da [Dog API](https://dog.ceo/dog-api/documentation/).

---

## 📂 Estrutura Visual das Pastas
A organização segue o padrão de separação de responsabilidades para facilitar a manutenção e escalabilidade:

```
CASEMIRANTE/
├── .github/
│   └── workflows/
│       └── main.yml              # Configuração do Pipeline (CI/CD)
├── resources/                    # Implementação técnica (Keywords)
│   ├── resourceAPI.robot         # Lógica dos testes de API
│   └── resourceWEB.robot         # Lógica dos testes de Web
├── tests/                        # Cenários de teste (BDD)
│   ├── results/                  # Resultados específicos da pasta tests
│   ├── apiDogTest.robot          # Casos de teste da Dog API
│   └── pesquisaWEB.robot         # Casos de teste da busca no blog
├── .gitignore                    # Arquivos que o Git deve ignorar (como a .venv)
├── README.md                     # Documentação do projeto
└── requirements.txt              # Bibliotecas necessárias (Selenium, Requests)
```
---

## 📝 Cenários de Teste (BDD)

### 💻 Web (Interface)

Focado na funcionalidade de busca, garantindo a resiliência em diferentes navegadores.

* Cenário 1: Realizar a busca inserindo uma parte do conteúdo de um artigo existente.

* Cenário 2: Realizar a busca com o nome completo de um artigo existente.

* Cenário 3: Realizar a busca com um dado que não existe.

### ⚙️ API (Integração)

Validação detalhada de estruturas JSON e Status Codes.

* GET /breeds/list/all: Valida a árvore completa de raças (Type: dict).

* GET /breed/{breed}/images: Valida o retorno de listas de imagens (Type: list).

* GET /breeds/image/random: Valida o formato da URL de imagem retornada (Regex).

* Fluxo de Exceção: Valida mensagens de erro para raças inexistentes (404).

---

### Requisitos e Execução

## 🛠️ Tecnologias e Bibliotecas
* Linguagem: Python 3.10+

* Framework: Robot Framework

* Web: SeleniumLibrary (Chrome e Firefox)

* API: RequestsLibrary (Testes de contrato e funcional)

* CI/CD: GitHub Actions (Execução multi-OS: Linux, Windows e macOS)

---

### ⚙️ Configuração do Ambiente
No terminal, execute:

1. Clone o repositório:

```bash
git clone git@github.com:KiraOliveira/caseMirante.git
```
2. Instale as dependências:

```bash
pip install -r requirements.txt
```
---

## 🚀 Execução dos Testes

* Execução Local (Interface Gráfica)

### API e WEB
```bash
robot -d results tests/
```

* Execução em Modo Headless (Ideal para Linux)

```bash
robot -d results -v BROWSER:headlesschrome tests/
```

* Execução de Cenário Específico (Por Tag)

### WEB
```bash
robot -d results -i busca_parcial tests/
```

### API
```bash
robot -d results -i listar_todas tests/
```

---

## ⚙️ Integração Contínua CI/CD (GitHub Actions)
O projeto utiliza GitHub Actions para garantir a qualidade em cada push. O pipeline está configurado para:

* Executar testes de API em ambiente Linux.

* Executar testes de UI em Matrix (Chrome e Firefox) nos sistemas Ubuntu, Windows e macOS.

* Fazer o upload automático dos relatórios (log.html e report.html) e evidências (Screenshots) como artefatos da build.

---

## 📊 Relatórios
Após a execução, os resultados são gerados na pasta /results. O Robot Framework fornece:

* Log.html: Detalhamento técnico (passo a passo, requisições HTTP e erros).

* Report.html: Visão executiva de sucesso/falha por tag e cenário.

---

## 👤 Autora
**Gislaine Oliveira** * | Foco em QA e Automação.*

## Execução dos testes

* Feature WEB
<img width="828" height="281" alt="web" src="https://github.com/user-attachments/assets/9d9f6ad5-8999-47c1-a035-91d4b34e79b7" />

* Feature API
<img width="822" height="309" alt="api" src="https://github.com/user-attachments/assets/042cd20f-83ee-4fe5-95d7-837aceb89602" />

* Relatório
<img width="879" height="734" alt="relatório" src="https://github.com/user-attachments/assets/10ff312e-9f64-4d2b-800a-256a32fc8a46" />

* Git Actions
<img width="1867" height="962" alt="gitActions" src="https://github.com/user-attachments/assets/dcbec19b-066e-4b29-9a21-e2f2ced3af2d" />
