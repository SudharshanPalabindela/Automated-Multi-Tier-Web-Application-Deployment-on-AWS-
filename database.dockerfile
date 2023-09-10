# Use an official PostgreSQL image as the base image
FROM postgres:13

# Set environment variables for database initialization
ENV POSTGRES_DB=mydb
ENV POSTGRES_USER=myuser
ENV POSTGRES_PASSWORD=mypassword

# Copy SQL scripts or other database initialization files, if needed
# COPY init.sql /docker-entrypoint-initdb.d/
