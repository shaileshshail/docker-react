FROM node:alpine3.15 as builder

WORKDIR /usr/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
#elastic beanstalk looks for the expose instruction ,maps automatically 
EXPOSE 80 
COPY --from=builder /usr/app/build /usr/share/nginx/html
