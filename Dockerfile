FROM node:20

# Set the working directory
WORKDIR /usr/src/app

# Copy the package.json and yarn.lock files
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install

# Copy the rest of the application code
COPY . .

# Clean up node_modules to force recompilation
RUN rm -rf node_modules

# Reinstall dependencies
RUN yarn install

# Build the app
RUN yarn build

# Expose the port the app runs on
EXPOSE 1337

# Command to run the app
CMD ["yarn", "develop"]
