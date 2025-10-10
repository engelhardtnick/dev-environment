#!/bin/bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== Development Environment Installer ===${NC}\n"

# Determine the repository path
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "Repository location: $REPO_DIR"

# Function to backup existing file
backup_file() {
  local file=$1
  if [[ -f "$file" ]] || [[ -L "$file" ]]; then
    local backup="${file}_backup_$(date +%Y%m%d_%H%M%S)"
    echo -e "${YELLOW}Backing up existing $file to $backup${NC}"
    mv "$file" "$backup"
  fi
}

# Install .zshrc
echo -e "\n${GREEN}Installing ZSH configuration...${NC}"
backup_file "$HOME/.zshrc"
ln -s "$REPO_DIR/zsh/.zshrc" "$HOME/.zshrc"
echo -e "${GREEN}✓${NC} .zshrc symlinked"

# Install .vimrc
echo -e "\n${GREEN}Installing Vim configuration...${NC}"
backup_file "$HOME/.vimrc"
ln -s "$REPO_DIR/vim/.vimrc" "$HOME/.vimrc"
echo -e "${GREEN}✓${NC} .vimrc symlinked"

# Machine-specific configuration
echo -e "\n${GREEN}Setting up machine-specific configuration...${NC}"
echo "Available machine configs:"
echo "  1) macbook - macOS configuration (uses Homebrew paths, pbcopy)"
echo "  2) xps13   - Linux configuration (uses xclip)"
echo "  3) Skip    - I'll set this up manually later"
echo ""

read -p "Select your machine type (1-3): " machine_choice

case $machine_choice in
  1)
    sed -i.bak 's/^MACHINE=.*/MACHINE="macbook"/' "$REPO_DIR/zsh/.zshrc"
    echo -e "${GREEN}✓${NC} MACHINE variable set to 'macbook' in .zshrc"
    ;;
  2)
    sed -i.bak 's/^MACHINE=.*/MACHINE="xps13"/' "$REPO_DIR/zsh/.zshrc"
    echo -e "${GREEN}✓${NC} MACHINE variable set to 'xps13' in .zshrc"
    ;;
  3)
    echo -e "${YELLOW}Skipped. Edit the MACHINE variable in $REPO_DIR/zsh/.zshrc manually${NC}"
    echo "  MACHINE=\"macbook\"  # or \"xps13\""
    ;;
  *)
    echo -e "${RED}Invalid choice. Skipping machine config.${NC}"
    echo -e "${YELLOW}Edit the MACHINE variable in $REPO_DIR/zsh/.zshrc manually${NC}"
    ;;
esac

# Final instructions
echo -e "\n${GREEN}=== Installation Complete! ===${NC}\n"
echo "Next steps:"
echo "  1. Install Oh-My-Zsh if not already installed:"
echo "     sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""
echo ""
echo "  2. Install required dependencies (see README.md for details):"
echo "     - zsh-completions plugin"
echo "     - fzf (fuzzy finder)"
echo "     - ag (the_silver_searcher)"
echo "     - For Linux: xclip (for clipboard support)"
echo ""
echo "  3. Install optional tools based on your needs:"
echo "     - pyenv (Python version management)"
echo "     - poetry (Python dependency management)"
echo "     - nvm (Node version management)"
echo "     - sdkman (Java/JVM tools - macOS)"
echo "     - AWS CLI"
echo ""
echo "  4. Restart your shell or run: source ~/.zshrc"
echo ""
echo -e "${YELLOW}Note: Check README.md for keybinding information and customization options.${NC}"
