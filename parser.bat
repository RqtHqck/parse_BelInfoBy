@echo off

set VENV_PATH=venv

REM Проверка наличия виртуального окружения
if not exist %VENV_PATH% (
    echo No virtual environment. Create..
    @python -m venv %VENV_PATH%
) else (
    echo Virtual environment is exists
)

REM Активация виртуального окружения
CALL ./%VENV_PATH%/Scripts/activate

REM Обновление pip
echo Update pip...
@python -m pip install --upgrade pip

REM Установка зависимостей
if exist requirements.txt (
    echo Install requirements.txt...
    @pip install -r requirements.txt
) else (
    echo No requirements.txt file. Skip requirements installation...
)

echo Run...
@.\venv\Scripts\python.exe .\parser.py
@pause
REM Деактивация виртуального окружения
deactivate

PAUSE