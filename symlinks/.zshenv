# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

# Yandex toolchain
export PATH=$PATH:/Users/gyzavyalov/.env/ios_tools/infra
export PATH=$PATH:/Users/gyzavyalov/.env/depot_tools

# Ruby pathes
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"

# Binaries
export PATH=$PATH:/Users/gyzavyalov/.env/binaries

# Latex
export PATH=$PATH:/Library/TeX/texbin