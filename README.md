# 📱 Scraping Job App

Aplicativo mobile desenvolvido em **Flutter** para busca de vagas de emprego.

O projeto faz parte de um estudo sobre desenvolvimento **Full Stack**, utilizando Flutter no frontend e FastAPI no backend. O aplicativo consome uma API própria responsável por intermediar as consultas à API do JSearch, permitindo maior controle dos dados e facilitando futuras integrações.

---

# 🚀 Tecnologias

### Mobile

* Flutter
* Dart

### Backend

* FastAPI
* Python

### APIs

* JSearch API

### Próximas integrações

* PostgreSQL ou Firebase
* JWT Authentication ou Firebase Authentication

---

# 📂 Estrutura do projeto

```text
lib/
├── core/
│   ├── config/
│   ├── constants/
│   ├── controller/
│   ├── models/
│   └── services/
│
├── dashboard/
│   ├── controllers/
│   ├── pages/
│   └── services/
│
├── login/
│   ├── controllers/
│   └── pages/
│
└── utils/
    ├── controllers/
    └── widgets/
```

A estrutura foi organizada em módulos para facilitar a manutenção e permitir que novas funcionalidades sejam adicionadas sem impactar o restante da aplicação.

---

# ✨ Funcionalidades atuais

* Busca de vagas de emprego
* Consumo da API desenvolvida em FastAPI
* Comunicação entre frontend e backend
* Estrutura modular
* Organização por camadas

---

# 🛣️ Roadmap

* [x] Estrutura inicial do projeto
* [x] Integração com o backend
* [x] Busca de vagas
* [ ] Login de usuários
* [ ] Cadastro de usuários
* [ ] Persistência de dados
* [ ] Sistema de favoritos
* [ ] Histórico de pesquisas
* [ ] Perfil do usuário
* [ ] Dark Mode
* [ ] Publicação na Play Store

---

# ⚙️ Como executar

## Clone o projeto

```bash
git clone https://github.com/suarestalles/scraping_job_frontend.git
```

Entre na pasta do projeto

```bash
cd scraping_job_frontend
```

Instale as dependências

```bash
flutter pub get
```

Execute o aplicativo

```bash
flutter run
```

---

# 🏗️ Arquitetura

```text
Flutter
     │
     ▼
FastAPI
     │
     ▼
JSearch API
```

No futuro:

```text
Flutter
     │
     ▼
FastAPI
     │
     ├────────► PostgreSQL
     │
     └────────► JSearch API
```

---

# 🎯 Objetivo

Este projeto tem como objetivo aprofundar conhecimentos em:

* Flutter
* FastAPI
* Arquitetura de Software
* APIs REST
* Integração Frontend/Backend
* Autenticação
* Banco de Dados
* Clean Architecture
* Boas práticas de desenvolvimento

---

# 📸 Screenshots

Em breve serão adicionadas imagens da aplicação.

---

# 👨‍💻 Autor

Desenvolvido por **Talles Suares**.

Sempre aberto a sugestões, feedbacks e melhorias.
