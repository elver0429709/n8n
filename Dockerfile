# Imagen base ligera de Node
FROM node:20-alpine

# Instalar dependencias necesarias para compilación y librerías nativas
RUN apk add --no-cache python3 make g++

# Directorio de trabajo
WORKDIR /app

# Copiar archivos del proyecto
COPY . .

# Instalar herramientas globales necesarias
RUN npm install -g pnpm turbo

# Instalar dependencias del proyecto
RUN pnpm install

# Exponer el puerto de n8n
EXPOSE 5678

# Comando de inicio (sin build)
CMD ["pnpm", "start"]
