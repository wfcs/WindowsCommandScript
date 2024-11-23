@echo off
:: Define o tamanho da janela do cmd
mode con: cols=55 lines=15

:: Verifica se o winget está instalado
winget --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Winget is not installed. Installing now...
    powershell -command "Start-Process ms-windows-store:winget -Wait"
    winget --version >nul 2>&1
    if %errorlevel% neq 0 (
        echo Error installing Winget. Check manually.
        pause
        exit /b
    )
    echo Winget installed successfully.
) else (
    echo Winget is already installed. Checking for updates...
    winget upgrade --all -h --accept-package-agreements
)

:menu
cls
echo ====================================================
echo                     OPTIONS 
echo ====================================================
echo 1. Apenas jogos - Only Games
echo 2. Apenas trabalho - Only Work
echo 3. Trabalho e Jogos - Work and Games
echo 4. Atualizar todos os programas - Update all programs
echo 5. Sair - Exit
echo =====================================================
set /p opcao="Selecione uma opcao: "

if "%opcao%"=="1" goto games
if "%opcao%"=="2" goto work
if "%opcao%"=="3" goto both
if "%opcao%"=="4" goto update
if "%opcao%"=="5" goto exit
goto invalid

:games
set programas=7zip Discord Valve.Steam Ubisoft.Connect GOG.Galaxy qBittorrent EpicGames.EpicGamesLauncher Amazon.Games ElectronicArts.EADesktop Spotify.Spotify Apple.iTunes Deezer.Deezer Bethesda.Launcher
goto install

:work
set programas=Figma Flow-Launcher InternetDownloadManager Microsoft.Teams Microsoft.WindowsTerminal Mozilla.Firefox Obsidian.Obsidian qBittorrent.qBittorrent Microsoft.PowerToys Telegram.TelegramDesktop DaxStudio.DaxStudio Microsoft.OneDrive Microsoft.PowerBI Spotify.Spotify Apple.iTunes Flameshot.Flameshot mulaRahul.Keyviz Flow-Launcher.Flow-Launcher
goto install

:both
set programas=7zip Discord Valve.Steam Ubisoft.Connect GOG.Galaxy qBittorrent EpicGames.EpicGamesLauncher Amazon.Games ElectronicArts.EADesktop Spotify.Spotify Apple.iTunes Deezer.Deezer Bethesda.Launcher Figma Flow-Launcher InternetDownloadManager Microsoft.Teams Microsoft.WindowsTerminal Mozilla.Firefox Obsidian.Obsidian qBittorrent.qBittorrent Microsoft.PowerToys Telegram.TelegramDesktop DaxStudio.DaxStudio Microsoft.OneDrive Microsoft.PowerBI
goto install

:update
winget upgrade --all -h --accept-package-agreements
echo Todos os programas foram atualizados.
pause
goto menu

:install
:: Fecha os programas que podem estar em execução
for %%p in (%programas%) do (
    echo Fechando %%p se estiver em execução...
    taskkill /IM %%p.exe /F >nul 2>&1
)

:: Instala os programas
for %%p in (%programas%) do (
    echo Instalando %%p...
    winget install %%p -h --accept-package-agreements
)
echo Todos os programas selecionados foram instalados.
pause
goto menu

:exit
echo Saindo...
pause
exit /b

:invalid
echo Opcao invalida. Por favor, selecione uma opcao valida.
pause
goto menu
