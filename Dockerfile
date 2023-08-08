FROM python:3.11-buster
# Pythonの出力表示をDokcer用に調整
ENV PYTHONUNBUFFERED=1

WORKDIR /src

# Install poetry by pip
RUN pip install poetry

# Copy poetry.lock* in working directory
COPY ./pyproject.toml* poetry.lock* ./

# Install librarys by poetry
RUN poetry config virtualenvs.in-project true
RUN if [ -f pyproject.toml ]; then poetry install --no-root; fi

# set up uvicorn server
ENTRYPOINT [ "poetry", "run", "uvicorn", "api.main:app", "--host", "0.0.0.0", "--reload"]