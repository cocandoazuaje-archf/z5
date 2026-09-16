#!/usr/bin/env zsh

# =========================================================
# CONFIGURACIÓN: ENTORNO GLOBAL ZSH
# DESCRIPCIÓN:
#   Inicializa el entorno de desarrollo del sistema incluyendo
#   variables de entorno, PATH, herramientas de desarrollo,
#   gestores de versiones (Java, Node), prompt y utilidades.
#
# COMPONENTES:
#   - Java (JAVA_HOME + PATH)
#   - Node (NVM)
#   - Homebrew
#   - jEnv y SDKMAN
#   - Oh My Posh (prompt)
#   - Alias y funciones personalizadas
#
# USO:
#   Cargado automáticamente desde ~/.zshrc
#
# NOTA:
#   - Prioriza JDK definido en JAVA_HOME
#   - Requiere Homebrew instalado
#   - Compatible con Apple Silicon (/opt/homebrew)
# =========================================================

export PATH="/Applications/IntelliJ IDEA.app/Contents/MacOS:$PATH"

# ===============================
# Configuración general
# ===============================
export OUTPUT_PATH="./archivo.txt"
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# ===============================
# Cargar alias y funciones
# ===============================
[ -f ~/.zxalias ] && source ~/.zxalias
[ -f ~/.zxfunction ] && source ~/.zxfunction

# ===============================
# Configuración de Oh My Posh
# ===============================
# mkdir -p ~/.poshthemes
# eval "$(oh-my-posh init zsh --config ~/.poshthemes/jandedobbeleer.omp.json)"
# eval "$(oh-my-posh init zsh --config capr4n)"

# ===============================
# Prompt básico (fallback)
# ===============================
export PROMPT='%F{green}%n@%m%f %F{blue}%~%f %# '

# ===============================
# Colores para ls
# ===============================
autoload -U colors && colors
export LSCOLORS=GxFxCxDxBxegedabagaced

# ===============================
# Configuración de idioma
# ===============================
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# ===============================
# Homebrew
# ===============================
eval "$(/opt/homebrew/bin/brew shellenv)"

# ===============================
# Editor por defecto
# ===============================
export EDITOR="code -w"
export VISUAL="code -w"

# ===============================
# Node Version Manager (NVM)
# ===============================
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ===============================
# jEnv y SDKMAN
# ===============================
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
source "$HOME/.sdkman/bin/sdkman-init.sh"

# ZSH_THEME="random"
# ZSH_THEME_RANDOM_CANDIDATES=("robbyrussell" "blueish")
export TERMINAL=kitty

# ============================================================
# JAVA 21 CONFIG
# ============================================================

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PATH="$JAVA_HOME/bin:$PATH"

# Verificación rápida
alias jh='echo $JAVA_HOME'
alias jv='java -version'

GLASSFISH_HOME=/Users/carlosocando/Downloads/glassfish7/glassfish/domains/domain1
export PATH="$PATH":"$GLASSFISH_HOME/bin"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"


# Path de Oh My Zsh
# export ZSH="$HOME/.oh-my-zsh"

# Desactivar tema predeterminado para usar nuestro prompt customizado de 2 líneas
# ZSH_THEME=""

# Plugins esenciales de Oh My Zsh
# plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Cargar Oh My Zsh si existe
# if [[ -f "$ZSH/oh-my-zsh.sh" ]]; then
  # source "$ZSH/oh-my-zsh.sh"
# fi

# --- PROMPT DE 2 LÍNEAS PARA OH MY ZSH ---
setopt PROMPT_SUBST

# Obtener información de Git
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%F{magenta}(%b)%f'

# Configuración de 2 líneas
PROMPT='%F{cyan}%n@%m%f:%F{yellow}%~%f ${vcs_info_msg_0_}
%F{green}❯%f '
export PATH="$(npm prefix -g)/bin:$PATH"
export VISUAL="$HOME/.vscode-cron.sh"
export EDITOR="$VISUAL"
export PATH="/opt/homebrew/opt/trash-cli/bin:$PATH"
