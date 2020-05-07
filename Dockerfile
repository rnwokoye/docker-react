FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# This specifies our docker image from nginx image
FROM nginx
EXPOSE 80

# This states to copy from 'builder' phase specified above
# And then specifies to copy /app/build folder in the dir specified
COPY --from=0 /app/build /usr/share/nginx/html
