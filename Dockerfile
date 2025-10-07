# Tahap 1: Base Image
# Menggunakan image resmi Bun. Versi 'slim' lebih kecil dan cocok untuk base.
FROM oven/bun:1-slim AS base
WORKDIR /usr/src/app

# Tahap 2: Instalasi Dependensi
# Tahap ini fokus pada instalasi dependensi untuk memanfaatkan caching Docker.
FROM base AS install

# Salin file package.json dan lockfile
COPY package.json bun.lock ./

# Instal semua dependensi
RUN bun install --frozen-lockfile

# Tahap 3: Rilis (Image Final)
# Ini adalah image akhir yang akan digunakan. Ukurannya akan jauh lebih kecil.
FROM base AS release
ENV NODE_ENV=production

# Salin file package.json dan lockfile lagi untuk instalasi produksi
COPY package.json bun.lock ./

# Instal HANYA dependensi produksi. Ini membuat image final lebih kecil.
RUN bun install --frozen-lockfile --production

# Salin dependensi produksi dari tahap 'install'
COPY --from=install /usr/src/app/node_modules node_modules
COPY src/ ./src/

# Memberi tahu Docker bahwa container akan berjalan di port 3000
EXPOSE 3000

# Perintah untuk menjalankan aplikasi.
CMD [ "bun", "start" ]
