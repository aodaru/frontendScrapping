# FrontendWorkList

[![build](https://github.com/anomalyco/frontendWorkScrapping/actions/workflows/deploy.yml/badge.svg)](https://github.com/anomalyco/frontendWorkScrapping/actions)

Frontend público que muestra ofertas de trabajo scrapeadas de freelancer.com, extraídas y servidas desde una API propia.

## Demo

[workscrap.adalgarcia.com](https://workscrap.adalgarcia.com)

## Características

- Lista de ofertas de trabajo actualizada
- Diseño responsive con Tailwind CSS
- Integración con API REST externa

## Tech Stack

- [Astro](https://astro.build) + Vite
- [Tailwind CSS](https://tailwindcss.com)
- [pnpm](https://pnpm.io)

## Getting Started

### Requisitos

- Node.js 22+
- pnpm 9+

### Instalación

```bash
pnpm install
```

### Variables de entorno

| Variable  | Descripción               | Default                            |
| --------- | ------------------------- | ---------------------------------- |
| `API_URL` | URL de la API de trabajos | `https://workscrap.adalgarcia.com` |

### Scripts

| Comando       | Descripción                                |
| ------------- | ------------------------------------------ |
| `pnpm dev`    | Inicia servidor dev en `localhost:4321`    |
| `pnpm build`  | Genera build de producción en `./dist/`    |
| `pnpm preview | Preview del build local antes de desplegar |

## Estructura del proyecto

```
src/
├── components/     # Componentes Astro reutilizables
│   ├── Header.astro
│   ├── Footer.astro
│   ├── Listworks.astro
│   └── Welcome.astro
├── layouts/        # Layouts base
│   └── Layout.astro
├── pages/         # Páginas routing
│   └── index.astro
└── styles/        # Estilos globales
    └── global.css
```

## API

Consume datos de la siguiente endpoint:

```
GET https://workscrap.adalgarcia.com/listwork
```

Respuesta esperada:

```json
{
  "data": [
    {
      "id": "string",
      "title": "string",
      "description": "string",
      "budget": "string",
      "skills": ["string"],
      "url": "string",
      "postedDate": "string",
      "extractedAt": "string",
      "paymentVerified": boolean,
      "bids": "string"
    }
  ]
}
```

## Despliegue

El proyecto está configurado para desplegarse en Railway usando nixpacks:

```toml
[phases.setup]
nixPkgs = ['nodejs_22']

[phases.install]
cmds = ['pnpm install --frozen-lockfile']

[phases.build]
cmds = ['pnpm build']

[start]
cmd = 'pnpm preview'

[variables]
NODE_ENV = 'production'
```

## Screenshots

![landing](./screenshots/listworks.png)

## Licencia

MIT
