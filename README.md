# 🚀 Guide Complet Robot Framework

## 📌 Introduction

**Robot Framework** est un framework open-source pour l’automatisation de tests basé sur des **mots-clés (keywords)**.  
Il permet de réaliser :  

- Tests UI (web avec SeleniumLibrary)  
- Tests API  
- Tests base de données  
- Exécution automatisée en CI/CD  
- Reporting avancé avec Allure ou ReportPortal  

---

## ⚙️ Prérequis

1. **Installer Python** depuis [python.org](https://www.python.org/downloads/)  
2. Vérifier la version et pip :

```bash
python --version
py -m pip --version


Créer un environnement virtuel :

python -m venv .venv

Activer l’environnement :

# Windows cmd
.venv\Scripts\activate.bat

# Windows PowerShell
.venv\Scripts\Activate.ps1

Extensions VS Code recommandées :

RobotCode – Robot Framework Support

Rainbow CSV

Robocorp Code

Python

🛠️ Installation des librairies

Robot Framework :

pip install robotframework

SeleniumLibrary :

pip install robotframework-seleniumlibrary

DataDriver pour CSV/JDD :

pip install robotframework-datadriver

Pabot pour exécution parallèle :

pip install robotframework-pabot

Allure pour reporting :

pip install allure-robotframework
🗂️ Organisation du projet
robotFramework/
│
├── tests/            # fichiers de test
├── pages/            # page objects (keywords par page)
├── resources/        # keywords communs
├── data/             # fichiers CSV/JDD
├── output/           # résultats Robot
├── allure-results/   # résultats Allure
🧪 Créer un premier test
*** Variables ***
${BROWSER}    chrome
${URL}        https://saucedemo.com/

*** Test Cases ***
Login Valide
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id:user-name    standard_user
    Input Text      id:password     secret_sauce
    Click Button    id:login-button
    Page Should Contain    Swag Labs
    Capture Page Screenshot
    Close Browser

Lancer :

robot tests/login.robot
🏷️ Tags et Test Setup / Teardown

Ajouter des tags :

*** Test Cases ***
Login Valide
    [Tags]    smoke    regression

Lancer par tag :

robot -i smoke tests/

Ajouter Test Setup et Teardown :

*** Settings ***
Test Setup       init browser
Test Teardown    Close Browser
📊 Data Driven / JDD

Avec Test Cases :

*** Test Cases ***    username    password    result
login ucpc           standard_user    secret_sauce   success
login uipc           standard_user    wrong_pass     fail
login ucpi           wrong_user       secret_sauce   fail
login uipci          wrong_user       wrong_pass     fail

Avec CSV :
Créer un dossier data/ et mettre jdd.csv. Installer DataDriver et configurer le test pour lire le CSV.

🌐 Multi-Browser

Définir les variables :

*** Variables ***
${BROWSER}    chrome
${URL}        https://saucedemo.com/

Lancer un navigateur spécifique :

robot -v BROWSER:chrome tests/login.robot
robot -v BROWSER:firefox tests/login.robot
robot -v BROWSER:edge tests/login.robot

Exécution parallèle avec Pabot :
Créer trois fichiers .txt :

chrome.txt :

--variable BROWSER:chrome

firefox.txt :

--variable BROWSER:firefox

edge.txt :

--variable BROWSER:edge

Lancer :

pabot --argumentfile1 ./chrome.txt --argumentfile2 ./firefox.txt --argumentfile3 ./edge.txt

Parallèle multi-processus :

pabot --processes 3 --argumentfile1 ./chrome.txt --argumentfile2 ./firefox.txt --argumentfile3 ./edge.txt
📈 Reporting Allure

Lancer les tests avec Allure :

robot --listener allure_robotframework:allure-results tests/

Vérifier que le dossier allure-results est créé :

dir

Générer et visualiser le rapport :

allure serve allure-results
✅ Bonnes pratiques

Utiliser des Page Objects

Séparer tests / données / keywords

Utiliser des tags pour filtrer les tests

Éviter Sleep, préférer Wait Until Element Is Visible

Nommer clairement tests et keywords

Capturer des screenshots sur échec pour le reporting
