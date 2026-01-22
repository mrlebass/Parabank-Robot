<img width=100% src="https://capsule-render.vercel.app/api?type=venom&height=300&color=5132a9&text=Parabank&textBg=false&fontColor=De5833"/>

<div align="left" />
<br> </br>

🛠️ **Tech Stack:**

![Robot Framework](https://img.shields.io/badge/-Robot%20Framework-000000?style=flat&logo=robotframework&labelColor=FFFFFF)
![Python](https://img.shields.io/badge/-Python-3776AB?style=flat&logo=python&labelColor=FFFFFF)
![Selenium](https://img.shields.io/badge/-Selenium-43B02A?style=flat&logo=selenium&labelColor=FFFFFF)
![VSCode](https://img.shields.io/badge/-VSCode-545454?style=for-the-badge&logo=visualstudiocode&labelColor=FFFFFF)
![GitHub](https://img.shields.io/badge/-GitHub-545454?style=flat&logo=github)
![Linux](https://img.shields.io/badge/-Linux-545454?style=flat&logo=linux)

# Objective:
Automate end-to-end tests for the **Parabank** application using **Robot Framework** + **Selenium** with a Page Object approach.

---

## Prerequirements

Before starting, make sure you have the following installed:

- **Python 3.10+**
- **pip** (comes with Python)
- **Chrome** (or another supported browser)
- **ChromeDriver** (compatible with your Chrome version)  
  - Tip: you can also use **WebDriver Manager** approach depending on your setup.

---

## Installation

1. Clone the repository:

```bash
git clone https://github.com/mrlebass/Parabank-Robot.git
```

2. Navigate to the project directory:
```bash
cd Parabank
```
3. Install dependencies (example using pip):
```bash
pip install -r requirements.txt
```
If you don’t have requirements.txt yet, you can generate it after installing your libs:
pip freeze > requirements.txt

Project Structure

Project organization (based on the repository structure):
```pgsql
Parabank/
 ├── Environments/
 │    ├── dev.robot
 │    └── prod.robot
 ├── PageObject/
 │    ├── BillPay/
 │    ├── Common/
 │    ├── Login/
 │    ├── OpenNewAccount/
 │    ├── Transfer/
 │    └── UpdateProfile/
 ├── Settings/
 │    └── main.robot
 ├── Setup_teardown/
 │    └── setup_teardown.robot
 ├── Results/  (ignored by .gitignore)
 └── README.md
```
Folders overview:

Environments/: environment variables and configs (dev/prod).

PageObject/: page objects and keywords grouped by feature.

Settings/: main settings/imports/execution entry points.

Setup_teardown/: suite/test setup and teardown keywords.

Results/: execution outputs (log/report/output.xml) — ignored by git.

Running Tests
Run a full suite
```bash
robot -d Results Settings/main.robot
```
Run with a specific environment (example)
```bash
robot -d Results -v ENV:dev Settings/main.robot
```
Run a specific test/suite (example)
```bash
robot -d Results PageObject/Login
```
The -d Results option generates the reports inside Results/.

Reports

After execution, Robot Framework generates:

log.html

report.html

output.xml

All of them are stored under Results/ and are ignored by Git.

Comments

Organized using a Page Object structure to improve maintainability.

Test structure aims for clarity and reusability of keywords.

Results/ folder is intentionally ignored to avoid uploading execution artifacts.

Contributing

Contributions are welcome! Feel free to open issues and pull requests.


