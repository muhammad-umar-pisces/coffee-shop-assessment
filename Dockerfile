# Use the official Ruby image as a base
FROM ruby:3.2.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs npm sqlite3 libsqlite3-dev

# Set an environment variable to not generate excessive log output
ENV RAILS_ENV=development

# Set working directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock for dependency installation
COPY Gemfile Gemfile.lock ./

# Install required gems
RUN bundle install

# Copy the rest of the application code
COPY . .

# Expose port 3000 to the outside world
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
