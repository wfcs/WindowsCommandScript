@echo off
:: Configurações de cores
set RED=[91m
set GREEN=[92m
set YELLOW=[93m
set BLUE=[94m
set RESET=[0m

:: Menu Principal
:MAIN_MENU
cls
echo %BLUE%=====================================================%RESET%
echo %GREEN%                  MENU DE OPCOES                     %RESET%
echo %BLUE%=====================================================%RESET%
echo.
echo 1. Usar Chocolatey
echo 2. Usar Winget
echo 3. Sair
echo %BLUE%=====================================================%RESET%
echo.
set /p choice=%YELLOW%Escolha uma opção (1-3): %RESET%

if %choice%==1 goto CHOCOLATEY_MENU
if %choice%==2 goto WINGET_MENU
if %choice%==3 exit
echo %RED%Opção inválida! Tente novamente.%RESET%
pause
goto MAIN_MENU

:: Menu do Chocolatey
:CHOCOLATEY_MENU
cls
echo %BLUE%=====================================================%RESET%
echo %GREEN%          Menu Chocolatey                           %RESET%
echo %BLUE%=====================================================%RESET%
echo.
echo 1. Apenas jogos - Only Games
echo 2. Apenas trabalho - Only Work
echo 3. Trabalho e Jogos - Work and Games
echo 4. Atualizar todos os programas - Update all programs
echo 5. Voltar ao Menu Principal
echo %BLUE%=====================================================%RESET%
echo.
set /p choice=%YELLOW%Escolha uma opção (1-5): %RESET%

if %choice%==1 goto CHOCOLATEY_GAMES
if %choice%==2 goto CHOCOLATEY_WORK
if %choice%==3 goto CHOCOLATEY_BOTH
if %choice%==4 goto CHOCOLATEY_UPDATE
if %choice%==5 goto MAIN_MENU
echo %RED%Opção inválida! Tente novamente.%RESET%
pause
goto CHOCOLATEY_MENU

:: Menu do Winget
:WINGET_MENU
cls
echo %BLUE%=====================================================%RESET%
echo %GREEN%          Menu Winget                               %RESET%
echo %BLUE%=====================================================%RESET%
echo.
echo 1. Apenas jogos - Only Games
echo 2. Apenas trabalho - Only Work
echo 3. Trabalho e Jogos - Work and Games
echo 4. Atualizar todos os programas - Update all programs
echo 5. Voltar ao Menu Principal
echo %BLUE%=====================================================%RESET%
echo.
set /p choice=%YELLOW%Escolha uma opção (1-5): %RESET%

if %choice%==1 goto WINGET_GAMES
if %choice%==2 goto WINGET_WORK
if %choice%==3 goto WINGET_BOTH
if %choice%==4 goto WINGET_UPDATE
if %choice%==5 goto MAIN_MENU
echo %RED%Opção inválida! Tente novamente.%RESET%
pause
goto WINGET_MENU

:: Jogos (Chocolatey)
:CHOCOLATEY_GAMES
cls
echo %BLUE%=====================================================%RESET%
echo %GREEN%          Instalando Apenas Jogos (Chocolatey)...   %RESET%
echo %BLUE%=====================================================%RESET%
set programas=7zip discord steam ubisoft-connect goggalaxy qbittorrent epicgameslauncher origin spotify itunes deezer bethesdanet
goto CHOCOLATEY_INSTALL

:: Trabalho (Chocolatey)
:CHOCOLATEY_WORK
cls
echo %BLUE%=====================================================%RESET%
echo %GREEN%          Instalando Apenas Trabalho (Chocolatey)...%RESET%
echo %BLUE%=====================================================%RESET%
set programas=figma flow-launcher idm microsoft-teams windows-terminal firefox obsidian qbittorrent powertoys telegram daxstudio onedrive powerbi spotify itunes deezer
goto CHOCOLATEY_INSTALL

:: Ambos (Chocolatey)
:CHOCOLATEY_BOTH
cls
echo %BLUE%=====================================================%RESET%
echo %GREEN%       Instalando Jogos e Trabalho (Chocolatey)...  %RESET%
echo %BLUE%=====================================================%RESET%
set programas=7zip discord steam ubisoft-connect goggalaxy qbittorrent epicgameslauncher origin spotify itunes deezer bethesdanet figma flow-launcher idm microsoft-teams windows-terminal firefox obsidian qbittorrent powertoys telegram daxstudio onedrive powerbi
goto CHOCOLATEY_INSTALL

:: Atualizar (Chocolatey)
:CHOCOLATEY_UPDATE
cls
echo %BLUE%=====================================================%RESET%
echo %GREEN%       Atualizando todos os programas (Chocolatey)...%RESET%
echo %BLUE%=====================================================%RESET%
echo %YELLOW%Atualizando...%RESET%
choco upgrade all -y
echo %GREEN%Todos os programas foram atualizados!%RESET%
pause
goto CHOCOLATEY_MENU

:: Instalação (Chocolatey)
:CHOCOLATEY_INSTALL
for %%i in (%programas%) do (
    echo %YELLOW%Instalando %%i...%RESET%
    choco install %%i -y
)
echo %GREEN%Todos os programas foram instalados!%RESET%
pause
goto CHOCOLATEY_MENU

:: Jogos (Winget)
:WINGET_GAMES
cls
echo %BLUE%=====================================================%RESET%
echo %GREEN%          Instalando Apenas Jogos (Winget)...       %RESET%
echo %BLUE%=====================================================%RESET%
set programas=7zip Discord Valve.Steam Ubisoft.Connect GOG.Galaxy qBittorrent EpicGames.EpicGamesLauncher Amazon.Games ElectronicArts.EADesktop Spotify.Spotify Apple.iTunes Deezer.Deezer Bethesda.Launcher
goto WINGET_INSTALL

:: Trabalho (Winget)
:WINGET_WORK
cls
echo %BLUE%=====================================================%RESET%
echo %GREEN%          Instalando Apenas Trabalho (Winget)...    %RESET%
echo %BLUE%=====================================================%RESET%
set programas=Figma Flow-Launcher InternetDownloadManager Microsoft.Teams Microsoft.WindowsTerminal Mozilla.Firefox Obsidian.Obsidian qBittorrent.qBittorrent Microsoft.PowerToys Telegram.TelegramDesktop DaxStudio.DaxStudio Microsoft.OneDrive Microsoft.PowerBI Spotify.Spotify Apple.iTunes Deezer.Deezer
goto WINGET_INSTALL

:: Ambos (Winget)
:WINGET_BOTH
cls
echo %BLUE%=====================================================%RESET%
echo %GREEN%       Instalando Jogos e Trabalho (Winget)...      %RESET%
echo %BLUE%=====================================================%RESET%
set programas=7zip Discord Valve.Steam Ubisoft.Connect GOG.Galaxy qBittorrent EpicGames.EpicGamesLauncher Amazon.Games ElectronicArts.EADesktop Spotify.Spotify Apple.iTunes Deezer.Deezer Bethesda.Launcher Figma Flow-Launcher InternetDownloadManager Microsoft.Teams Microsoft.WindowsTerminal Mozilla.Firefox Obsidian.Obsidian qBittorrent.qBittorrent Microsoft.PowerToys Telegram.TelegramDesktop DaxStudio.DaxStudio Microsoft.OneDrive Microsoft.PowerBI
goto WINGET_INSTALL

:: Atualizar (Winget)
:WINGET_UPDATE
cls
echo %BLUE%=====================================================%RESET%
echo %GREEN%       Atualizando todos os programas (Winget)...   %RESET%
echo %BLUE%=====================================================%RESET%
echo %YELLOW%Atualizando...%RESET%
winget upgrade --all --silent --accept-package-agreements
echo %GREEN%Todos os programas foram atualizados!%RESET%
pause
goto WINGET_MENU

:: Instalação (Winget)
:WINGET_INSTALL
for %%i in (%programas%) do (
    echo %YELLOW%Instalando %%i...%RESET%
    winget install -e --id %%i --silent --accept-package-agreements
)
echo %GREEN%Todos os programas foram instalados!%RESET%
pause
goto WINGET_MENU
