# 🚀 Internet Computer Token Project (DAngela)

A decentralized token application built on the Internet Computer protocol using Motoko for the backend and React for the frontend.

![Internet Computer](https://img.shields.io/badge/Internet%20Computer-Canister-blue)
![Motoko](https://img.shields.io/badge/Motoko-v0.8.4-orange)
![React](https://img.shields.io/badge/React-16.8.2-blue)

## 📋 Table of Contents
- [Features](#-features)
- [Architecture](#-architecture)
- [Prerequisites](#-prerequisites)
- [Installation](#-installation)
- [Project Structure](#-project-structure)
- [Running Locally](#-running-locally)
- [Deploying to IC Network](#-deploying-to-ic-network)
- [Canister Methods](#-canister-methods)
- [Troubleshooting](#-troubleshooting)
- [Contributing](#-contributing)

---

## ✨ Features

- **🔐 Secure Token Transactions**: Built-in transfer functionality with principal-based authentication
- **💰 Token Faucet**: Free token distribution system (10,000 DANG tokens per claim)
- **📊 Balance Checker**: View any account's token balance
- **🌐 Web3 Integration**: Direct connection to Internet Computer blockchain
- **⚡ Fast Transactions**: Sub-second transaction finality on IC network

---

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                    Internet Computer Network                     │
│                                                                  │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │                   Token Canister (Motoko)                │    │
│  │  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐    │    │
│  │  │ balanceOf() │  │ transfer()  │  │ getName()   │    │    │
│  │  └─────────────┘  └─────────────┘  └─────────────┘    │    │
│  └─────────────────────────────────────────────────────────┘    │
│                              ↑                                   │
│                              │ canister calls                    │
│                              ↓                                   │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │              Frontend Canister (React + Webpack)         │    │
│  │  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐    │    │
│  │  │   Header    │  │   Faucet    │  │   Balance   │    │    │
│  │  └─────────────┘  └─────────────┘  └─────────────┘    │    │
│  │  ┌─────────────┐                                           │    │
│  │  │  Transfer   │                                           │    │
│  │  └─────────────┘                                           │    │
│  └─────────────────────────────────────────────────────────┘    │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## 📦 Prerequisites

Before you begin, ensure you have the following installed:

- **Node.js**: v14 or higher
- **npm**: v6 or higher
- **DFX SDK**: v0.8.4 or higher
- **Git**: For version control
- **VS Code**: Recommended IDE (with Motoko extension)

### Install DFX SDK

```bash
# Install DFX
curl -L https://sdk.dfinity.org/install.sh | sh

# Add to PATH (add to ~/.bashrc or ~/.zshrc)
export PATH="$HOME/bin:$PATH"

# Verify installation
dfx --version
```

---

## 🚀 Installation

### 1. Clone the Repository

```bash
git clone <repository-url>
cd token
```

### 2. Install npm Dependencies

```bash
npm install
```

This will install:
- `@dfinity/agent` - IC agent for canisterdfinity/candid communication
- `@` - Candid interface definition
- `@dfinity/principal` - Principal ID handling
- `react` & `react-dom` - UI framework
- `webpack` - Module bundler
- TypeScript and related tools

### 3. Start the Local Replica

```bash
dfx start --background
```

### 4. Deploy Canisters Locally

```bash
dfx deploy
```

### 5. Start the Development Server

```bash
npm start
```

The application will be available at `http://localhost:8080`

---

## 📂 Project Structure

```
token/
├── 📄 dfx.json                    # DFX configuration for canisters
├── 📄 package.json                # npm dependencies and scripts
├── 📄 webpack.config.js           # Webpack bundling configuration
├── 📄 tsconfig.json               # TypeScript configuration
├── 📄 README.md                   # This file
├── 📁 src/
│   ├── 📁 token/                  # Motoko canister source
│   │   └── 📄 main.mo            # Token contract implementation
│   └── 📁 token_assets/          # Frontend application
│       ├── 📁 src/
│       │   ├── 📄 index.jsx      # React entry point
│       │   ├── 📄 index.html     # HTML template
│       │   └── 📁 components/
│       │       ├── 📄 App.jsx    # Main app container
│       │       ├── 📄 Header.jsx # Header with logo
│       │       ├── 📄 Faucet.jsx # Token faucet component
│       │       ├── 📄 Balance.jsx # Balance checker
│       │       └── 📄 Transfer.jsx # Token transfer
│       ├── 📁 assets/
│       │   ├── 📄 favicon.ico    # App icon
│       │   └── 📄 main.css       # Global styles
│       └── 📁 declarations/      # Auto-generated canister interfaces
└── 📁 dist/                       # Production build output
```

---

## 🖥️ Running Locally

### Quick Start Commands

```bash
# Start local Internet Computer replica
dfx start

# In a new terminal: Deploy canisters
dfx deploy

# Start webpack dev server
npm start
```

### Access the Application

- **Frontend**: http://localhost:8080
- **Canister API**: http://localhost:8000
- **Local Replica Dashboard**: http://localhost:8000/_/dashboard

### Development Workflow

1. Make changes to Motoko code in `src/token/main.mo`
2. Update frontend in `src/token_assets/src/components/`
3. Rebuild and redeploy:
   ```bash
   dfx deploy
   ```
4. Changes will reflect at http://localhost:8080

---

## 🌐 Deploying to IC Network

### 1. Prepare Your Identity

```bash
# Create or use existing identity
dfx identity use <your-identity-name>

# Get your principal ID
dfx identity get-principal
```

### 2. Create a Wallet Canister (First Time Only)

If you don't have cycles, you'll need to convert ICP to cycles using the [IC Dashboard](https://dashboard.internetcomputer.org/).

### 3. Deploy to IC Network

```bash
# Deploy to Internet Computer mainnet
dfx deploy --network ic
```

### 4. Get Live Canister IDs

```bash
# Get token canister ID
dfx canister --network ic id token

# Get frontend canister ID
dfx canister --network ic id token_assets
```

### 5. Access Live Application

```
https://<token_assets_canister_id>.raw.ic0.app
```

### 6. Add Cycles to Canister

```bash
# Get live canister principal
LIVE_CANISTER_KEY="principal \"$(dfx canister --network ic id token)\""

# Transfer cycles (example: 50,000,000 cycles)
dfx canister --network ic call token transfer "($LIVE_CANISTER_KEY, 50_000_000)"
```

---

## 📡 Canister Methods

### Query Methods (Read-Only)

```bash
# Get token balance of an address
dfx canister call token balanceOf "(principal \"<principal-id>\")"

# Get token metadata (name, symbol, decimals)
dfx canister call token getMetadata
```

### Update Methods (State-Changing)

```bash
# Transfer tokens
dfx canister call token transfer "(principal \"<to-principal>\", <amount>)"

# Approve spender
dfx canister call token approve "(principal \"<spender>\", <amount>)"

# Transfer from (if approved)
dfx canister call token transferFrom "(principal \"<from>\", principal \"<to>\", <amount>)"
```

### Example Commands

```bash
# Check your principal
dfx identity get-principal
# Example output: e2sog-c54h3-6wtdu-wvm7d-ihfod-oqsnz-uakz5-ne2zl-p4xdk-muaue-aae

# Store as variable
OWNER_PUBLIC_KEY="principal \"$(dfx identity get-principal)\""

# Check balance
dfx canister call token balanceOf "( $OWNER_PUBLIC_KEY )"

# Transfer 1000 tokens
dfx canister call token transfer "($OWNER_PUBLIC_KEY, 1000)"
```

---

## 🔧 Troubleshooting

### Common Issues

#### 1. "Cannot find module" Errors

```bash
# Clear node_modules and reinstall
rm -rf node_modules package-lock.json
npm install
```

#### 2. DFX Version Mismatch

```bash
# Check DFX version
dfx --version

# Update DFX
dfx self-update
```

#### 3. Canister Not Found

```bash
# Stop and restart replica
dfx stop
dfx start --background

# Redeploy canisters
dfx deploy --force
```

#### 4. Webpack Build Errors

```bash
# Clear webpack cache
rm -rf node_modules/.cache
npm run build
```

#### 5. Identity Issues

```bash
# Create new identity
dfx identity new <identity-name>

# Use specific identity
dfx identity use <identity-name>
```

#### 6. Port Already in Use

```bash
# Find process using port
lsof -i :8000

# Kill process
kill <PID>

# Or use different port
dfx start --port 8001
```

### Logs and Debugging

```bash
# View canister logs
dfx canister call token debugPrint "(...)"

# Check replica logs
journalctl -u dfx-replica -f
```

---

## 🤝 Contributing

We welcome contributions! Please follow these steps:

### 1. Fork the Repository

Click the "Fork" button on GitHub or run:

```bash
git clone <your-fork-url>
cd token
```

### 2. Create a Feature Branch

```bash
git checkout -b feature/amazing-feature
```

### 3. Make Changes

- Follow existing code style
- Add tests for new functionality
- Update documentation

### 4. Submit a Pull Request

```bash
git add .
git commit -m "Add amazing feature"
git push origin feature/amazing-feature
```

Create a PR with:
- Clear description of changes
- Screenshots for UI changes
- Test results
- Related issue reference

---

## 📚 Additional Resources

- [Internet Computer Documentation](https://internetcomputer.org/docs/)
- [Motoko Language Documentation](https://internetcomputer.org/docs/current/developer-docs/backend/motoko/)
- [DFX SDK Documentation](https://internetcomputer.org/docs/current/developer-docs/tools/cli-tools/)
- [React Documentation](https://reactjs.org/)
- [Candid Interface Description Language](https://internetcomputer.org/docs/current/developer-docs/backend/candid/)

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- [DFINITY Foundation](https://dfinity.org/) for the Internet Computer
- [Motoko Team](https://github.com/dfinity/motoko) for the programming language
- [Open Source Community](https://github.com/) for amazing dependencies

---

## 📞 Support

- **GitHub Issues**: Report bugs and request features
- **Discord**: [Join our community](https://discord.gg/internetcomputer)
- **Documentation**: [Official Docs](https://internetcomputer.org/docs/)

---

**Built with ❤️ on the Internet Computer**

