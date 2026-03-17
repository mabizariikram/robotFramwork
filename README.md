# 🚀 Guide Complet Robot Framework

**Robot Framework** est un framework open-source pour l’automatisation de tests basé sur des mots-clés (keywords). Il permet de réaliser des tests UI (web avec SeleniumLibrary), tests API, tests base de données, exécution automatisée en CI/CD et reporting avancé avec Allure ou ReportPortal.  

Installer Python depuis [python.org](https://www.python.org/downloads/) et vérifier la version avec `python --version` ou `py -m pip --version`. Créer un environnement virtuel avec `python -m venv .venv` et l’activer avec `.venv\Scripts\activate` ou `.venv\Scripts\Activate.ps1`. Sur VS Code, créer un profil et installer les extensions : RobotCode, Rainbow CSV, Robocorp Code, et Python.  

Installer Robot Framework avec `pip install robotframework`, SeleniumLibrary avec `pip install robotframework-seleniumlibrary`, et DataDriver pour CSV/JDD avec `pip install robotframework-datadriver`. Pour exécution parallèle installer Pabot avec `pip install robotframework-pabot` et pour reporting installer Allure avec `pip install allure-robotframework`.  

Créer un premier test et lancer avec `robot nomdufichier.robot`. Le rapport HTML se génère automatiquement. Ajouter des hooks Test Setup et Test Teardown avec `Test Setup init browser` et `Test Teardown Close Browser`. Ajouter des tags avec `[Tags]` et lancer avec `robot --include nomdutag nomdufichier.robot`.  

Organiser les tests dans un dossier `tests/` et lancer tous les tests avec `robot tests` ou un test spécifique avec `robot tests/login.robot`. Lancer un scénario spécifique avec `robot -t "login valide" tests/login.robot` ou par tag `robot -i smoke tests`.  

Pour gérer les Page Objects, créer un dossier `pages/` et y mettre par exemple `loginpom.resource`. Pour les fichiers JDD, soit utiliser des Test Cases dans le test, soit un fichier CSV dans `data/jdd.csv` avec DataDriver.  

Pour ouvrir le navigateur, utiliser `Open Browser ${URL} ${BROWSER}` et définir les variables :
