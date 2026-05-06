FROM node:18

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# ✅ Create non-root user
RUN useradd -m appuser
USER appuser

# ✅ Add health check
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1

EXPOSE 3000

CMD ["node", "app.js"]