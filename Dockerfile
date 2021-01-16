FROM node:14 as build

WORKDIR /pres
COPY . .
RUN npm install
RUN npm run package
RUN ls deploy


FROM nginx:alpine 

COPY --from=build /pres/deploy /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]