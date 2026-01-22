<img width="100%" src="https://capsule-render.vercel.app/api?type=venom&height=280&color=5132a9&text=Parabank&textBg=false&fontColor=De5833"/>

<p align="center">
  <strong>End-to-end test automation for the Parabank application</strong><br/>
  Built with Robot Framework + Selenium using a Page Object architecture
</p>

---

## 🛠 Tech Stack

<p align="left">
  <img src="https://img.shields.io/badge/Robot%20Framework-000000?style=flat&logo=robotframework"/>
  <img src="https://img.shields.io/badge/Python-3776AB?style=flat&logo=python&labelColor=FFFFFF"/>
  <img src="https://img.shields.io/badge/Selenium-43B02A?style=flat&logo=selenium&labelColor=FFFFFF"/>
  <img src="https://img.shields.io/badge/VSCode-545454?style=flat&logo=visualstudiocode"/>
  <img src="https://img.shields.io/badge/GitHub-545454?style=flat&logo=github"/>
  <img src="https://img.shields.io/badge/Linux-545454?style=flat&logo=linux"/>
</p>

---

## 🎯 Objective

Automate **end-to-end tests** for the **Parabank** application using  
**Robot Framework + Selenium**, following a **Page Object Model (POM)** approach  
to ensure **maintainability**, **reusability**, and **clarity**.

---

## 📋 Prerequisites

Make sure you have the following installed:

- **Python 3.10+**
- **pip** (comes with Python)
- **Google Chrome** (or another supported browser)
- **ChromeDriver** (compatible with your Chrome version)

> 💡 Tip: You can also use a **WebDriver Manager** approach depending on your setup.

---

## 🚀 Installation

### 1️⃣ Clone the repository
```bash
git clone https://github.com/mrlebass/Parabank-Robot.git
````

### 2️⃣ Navigate to the project directory

```bash
cd Parabank
```

### 3️⃣ Install dependencies

```bash
pip install -r requirements.txt
```

> If you don’t have `requirements.txt` yet:

```bash
pip freeze > requirements.txt
```

---

## 🗂 Project Structure

```pgsql
Parabank/
├── Environments/
│   ├── dev.robot
│   └── prod.robot
│
├── PageObject/
│   ├── BillPay/
│   ├── Common/
│   ├── Login/
│   ├── OpenNewAccount/
│   ├── Transfer/
│   └── UpdateProfile/
│
├── Settings/
│   └── main.robot
│
├── Setup_teardown/
│   └── setup_teardown.robot
│
├── Results/            # execution outputs (ignored by Git)
└── README.md
```

### 📁 Folders Overview

* **Environments/**
  Environment variables and configurations (dev / prod)

* **PageObject/**
  Page Objects, locators, keywords and test cases grouped by feature

* **Settings/**
  Main settings, imports and execution entry points

* **Setup_teardown/**
  Suite and test setup/teardown keywords

* **Results/**
  Execution outputs (`log.html`, `report.html`, `output.xml`)
  ⛔ *Ignored by Git*

---

## ▶️ Running Tests

### Run the full test suite

```bash
robot -d Results Settings/main.robot
```

### Run using a specific environment

```bash
robot -d Results -v ENV:dev Settings/main.robot
```

### Run a specific feature or test suite

```bash
robot -d Results PageObject/Login
```

> The `-d Results` option ensures all reports are generated inside the `Results/` folder.

---

## 📊 Reports

After execution, Robot Framework generates:

* `log.html`
* `report.html`
* `output.xml`

📌 All reports are stored under `Results/` and are **ignored by Git**.

---

## 💬 Notes

* Project organized using **Page Object Model (POM)** best practices
* Focus on **clean structure**, **readability**, and **keyword reuse**
* Execution artifacts are intentionally excluded from version control

---

## 🤝 Contributing

Contributions are welcome!
Feel free to open **issues** or submit **pull requests** 🚀
