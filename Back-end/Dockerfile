FROM python:3.11-slim  AS development

WORKDIR /code
# Update pip
RUN pip install --upgrade pip
# Copy resources
COPY . /code
# Install requirements (dev)
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
# Expose port
EXPOSE 80
WORKDIR /code


FROM python:3.11-slim AS production

WORKDIR /code
# Update pip
RUN pip install --upgrade pip
# Copy resources
COPY . /code
# Install requirements (prod)
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
# Expose port
EXPOSE 80
