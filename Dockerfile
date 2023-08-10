# Install python3.11 image
FROM python:3.11-buster
# Adjust python output display for Docker
ENV PYTHONUNBUFFERED=1

WORKDIR /src

# install poetry by pip
RUN pip install poetry

# copy poetry.lock and pyproject.toml (if exists the files)
COPY pyproject.toml* poetry.lock* ./

# install librarys by poetry
RUN poetry config virtualenvs.in-project true
RUN if [ -f pyproject.toml ]; then poetry install --no-root; fi

# Set up uvicorn server
ENTRYPOINT ["poetry", "run", "uvicorn", "api.main:app", "--host", "0.0.0.0", "--reload"]