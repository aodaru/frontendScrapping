# Stage 1: Base and dependencies
FROM node:22-slim AS base

RUN corepack enable

WORKDIR /app

# Copy configuration files
COPY package.json pnpm-lock.yaml ./

# Install all dependencies
RUN pnpm install --frozen-lockfile

# Stage 2: Build the application
FROM base AS build

# Copy source code
COPY . .

# Build the project
RUN pnpm build

# Stage 3: Production runner
FROM node:22-slim AS runtime

WORKDIR /app

RUN corepack enable

# Copy package files and install production dependencies
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --prod --frozen-lockfile

# Copy the build output from the build stage
COPY --from=build /app/dist ./dist

# Expose the port Astro uses (default is 4321)
EXPOSE 4321

# Start the server
CMD ["node", "./dist/server/entry.mjs"]
