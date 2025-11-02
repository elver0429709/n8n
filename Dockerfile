# Imagen base ligera y estable de Node
FROM node:20-alpine

# Instalar dependencias básicas de compilación
RUN apk add --no-cache python3 make g++

# Directorio de trabajo
WORKDIR /app

# Copiar todos los archivos del proyecto
COPY . .

# Instalar herramientas globales necesarias
RUN npm install -g pnpm turbo

# Instalar dependencias del proyecto y construir
RUN pnpm install && pnpm run build

# Exponer el puerto por defecto de n8n
EXPOSE 5678

# Iniciar n8n
CMD ["pnpm", "start"]
