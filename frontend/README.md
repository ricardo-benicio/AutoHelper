# AutoHelper Frontend

Frontend do projeto AutoHelper construído com Next.js 15, TypeScript e Tailwind CSS.

## 🚀 Tecnologias

- **Next.js 15** - Framework React com App Router
- **TypeScript** - Tipagem estática
- **Tailwind CSS** - Framework CSS utilitário
- **Axios** - Cliente HTTP para API calls

## 📁 Estrutura do Projeto

```
src/
├── components/     # Componentes reutilizáveis
│   └── ui/        # Componentes de UI base
├── hooks/          # Hooks personalizados
├── services/       # Serviços de API
├── types/          # Definições de tipos TypeScript
└── utils/          # Funções utilitárias
```

## 🛠️ Configuração

### Variáveis de Ambiente

Crie um arquivo `.env.local` na raiz do projeto:

```bash
# API Configuration
NEXT_PUBLIC_API_URL=http://localhost:3000/api
NEXT_PUBLIC_APP_NAME=AutoHelper

# OpenAI Configuration (se necessário)
NEXT_PUBLIC_OPENAI_API_KEY=

# Environment
NODE_ENV=development
```

### Instalação

```bash
npm install
```

### Desenvolvimento

```bash
npm run dev
```

### Build

```bash
npm run build
```

### Produção

```bash
npm start
```

## 🔧 Funcionalidades

- ✅ Estrutura de pastas organizada
- ✅ Configuração TypeScript com paths
- ✅ Serviço de API configurado
- ✅ Hook de autenticação
- ✅ Componentes UI base
- ✅ Utilitários comuns
- ✅ Tipos TypeScript definidos

## 📱 Componentes Disponíveis

- **Button** - Botão com variantes e estados de loading
- **useAuth** - Hook para gerenciamento de autenticação

## 🌐 API Service

O serviço de API está configurado com:
- Interceptors para autenticação
- Tratamento de erros
- Timeout configurável
- Headers automáticos

## 🎨 Tailwind CSS

Configurado com classes utilitárias para:
- Cores
- Espaçamentos
- Tipografia
- Responsividade
- Estados de hover/focus

## 📝 Próximos Passos

1. Implementar páginas de autenticação
2. Criar layout principal
3. Implementar navegação
4. Conectar com API Rails
5. Adicionar testes
