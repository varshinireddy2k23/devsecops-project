FROM node:18

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# ✅ Install curl for healthcheck
RUN apt-get update && apt-get install -y curl

# ✅ Create non-root user
RUN useradd -m appuser
USER appuser

# ✅ Healthcheck
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1

EXPOSE 3000

CMD ["node", "app.js"]