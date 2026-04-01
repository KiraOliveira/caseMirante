# 🛡️ CASE: Automação de Testes - Blog do Agi

**Status do Projeto:** 🚀 Em Execução (CI/CD Ativo)  
**Objetivo:** Validar a funcionalidade de busca do Blog do Agi em múltiplos ambientes e navegadores.

---

## 📋 Sobre o Projeto
Este é um case de **Automação WEB** focada na estruturação do Agi Blog. A automação utiliza o **Robot Framework** com a **SeleniumLibrary**, aplicando técnicas de injeção de JavaScript para garantir a estabilidade dos testes em interfaces modernas e dinâmicas (Astra Theme), mitigando erros de sincronismo e visibilidade.

---

## 📂 Estrutura Visual das Pastas
A organização segue o padrão de separação de responsabilidades para facilitar a manutenção e escalabilidade:

```
CASEMIRANTE/
├── .github/              # Configurações de CI/CD (GitHub Actions)
│   └── workflows/
│       └── main.yml      # Pipeline multi-browser (Chrome, Firefox, Safari)
├── resources/            # Camada de Recursos e Lógica
│   └── resource.robot    # Keywords personalizadas e variáveis globais
├── tests/                # Suítes de Teste (Cenários BDD)
│   └── pesquisa.robot    # Cenários de busca (Parcial, Completo e Negativa)
├── results/              # Artefatos de execução (Logs, Reports e Screenshots)
├── requirements.txt      # Gerenciador de dependências Python
└── README.md             # Documentação técnica do projeto
```
---

### Requisitos e Execução

## 🛠️ Requisitos e Instalação

### 1. Pré-requisitos
* **Python 3.10+** (Instalado e configurado no PATH).
* **Google Chrome** (Navegador padrão para execução local no Linux/Windows).
* **WebDriver Manager** (Biblioteca que gerencia automaticamente os drivers).

### 2. Instalação das Dependências
No terminal, execute:

```bash
pip install -r requirements.txt
```
---

## 🚀 Execução dos Testes

* Execução Local (Interface Gráfica)

```bash
robot -d results tests/
```

* Execução em Modo Headless (Ideal para Linux)

```bash
robot -d results -v BROWSER:headlesschrome tests/
```

* Execução de Cenário Específico (Por Tag)

```bash
robot -d results -i busca_parcial tests/
```

---

## ⚙️ Pipeline de CI/CD (GitHub Actions)
O projeto está configurado para garantir a **compatibilidade cross-browser**. A cada `push` ou `pull request`, o GitHub Actions dispara execuções paralelas em diferentes sistemas operacionais:

| Navegador | OS Runner | Motor de Renderização |
| :--- | :--- | :--- |
| **Google Chrome** | `ubuntu-latest` | Blink/Chromium |
| **Mozilla Firefox** | `ubuntu-latest` | Gecko |
| **Apple Safari** | `macos-latest` | WebKit |

---

## 💡 Diferenciais Técnicos (Nível Pleno)
* **Tratamento de Stale Elements:** Uso de `Execute Javascript` para manipulação direta do DOM, garantindo a inserção de dados mesmo durante animações.
* **Resiliência em Linux:** Configurações específicas (`--no-sandbox` e `--disable-dev-shm-usage`) para execução estável em containers.
* **Otimização:** Uso de `Suite Setup` para reaproveitamento de instâncias do navegador.
* **Evidências:** Captura de screenshots com nomenclatura dinâmica.

---

## 👤 Autora
**Gislaine Oliveira** * | Foco em QA e Automação.*

## Execução dos testes
[![Feature WEB]]<img width="708" height="367" alt="webLocal" src="https://github.com/user-attachments/assets/b536e29f-1a24-4df2-b4a4-e510dc8c08dc" />
