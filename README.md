# 🔁 Relancio – Mini CRM pour Freelances

Relancio est une application SaaS simple et efficace permettant aux freelances et indépendants de **gérer leurs prospects**, suivre leurs **interactions**, et **relancer au bon moment**.  
Fini les tableaux Excel ou les rappels oubliés : tout est centralisé dans une interface claire et orientée action.

---

## ✨ Fonctionnalités principales

- 📇 Gestion de fiches prospects  
- 🗓️ Suivi des interactions passées et futures  
- ⏰ Rappels automatiques pour ne pas oublier de relancer  
- 💡 Interface pensée pour la productivité freelance  

---

## 🛠️ Stack technique

| Couche              | Techno utilisée                            |
|---------------------|--------------------------------------------|
| 🧠 Backend & Front | **Ruby on Rails 8** (monolith complet)     |
| 🎨 UI/UX           | **TailwindCSS** + **Preline UI**           |
| ⚡ Interactions    | Hotwire : **Turbo** + **Stimulus**         |
| 💾 Base de données | **SQLite3** (en dev)                       |

---

## 🖥️ Lancer le projet en local

### 1. Prérequis

- Ruby (>= 3.2 recommandé)  
- Bundler (`gem install bundler`)  
- SQLite3  
- Node.js (pour Preline si jamais du JS est ajouté)  
- (Facultatif) Yarn si des dépendances JS sont utilisées un jour  

### 2. Installation

```bash
git clone https://github.com/votre-utilisateur/relancio.git
cd relancio

bundle install
bin/rails db:setup
bin/dev
```

L'application sera disponible sur :  
👉 [http://localhost:3000](http://localhost:3000)

> 💡 `bin/dev` démarre à la fois le serveur Rails et le watcher Tailwind (via `tailwindcss-rails`)

---

## 🧪 Tests

🤡 Ici, on ne doute pas : **pas de tests automatisés**.  
L'interface est simple et claire, et chaque bug est une opportunité de shipper mieux 💥

---

## 🎨 UI : Preline

L'interface utilise [Preline UI](https://preline.co/), une librairie de composants TailwindCSS.  
Cela permet une UI moderne et responsive sans effort, tout en restant **100% HTML-first**.

---

## 📚 Roadmap (envies futures)

- ✉️ Envoi d'e-mails de relance automatisés  
- 📊 Dashboard de conversion  
- 🧠 Suggestions intelligentes de relance  
- 🔄 Intégration avec Zapier ou Notion  

---

## 📝 Licence

Ce projet est open-source, sous licence **MIT**.
