# Til hosting i skyen (Railway, Render, Fly.io m.fl.)
# Playwrights officielle image har Chromium og alle systembiblioteker installeret på forhånd,
# så der skal ikke hentes eller installeres en browser under bygningen.
# Versionen SKAL passe til playwright i package-lock.json (1.65.1).
FROM mcr.microsoft.com/playwright:v1.65.1-noble
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev --ignore-scripts
COPY . .
ENV NODE_ENV=production
ENV HEADLESS=true
EXPOSE 3000
CMD ["node", "server.js"]
