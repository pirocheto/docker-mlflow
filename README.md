# Start mlflow fastly with docker and docker compose

![](https://img.shields.io/badge/mlflow-0077B5?style=for-the-badge&logo=mlflow&logoColor=lightblue)
![](https://img.shields.io/badge/docker-2CA5E0?style=for-the-badge&logo=docker&logoColor=white)

## Get started

### Step 1: Download files

```bash
curl -O "https://raw.githubusercontent.com/pierrerochet/mlflow-docker/master/{docker-compose.yaml,mlflow.Dockerfile}"
```

### Step 2: Start services

```bash
docker compose up
```

## Documentation

The docker compose file allow to set up the scenario below by replacing s3 by minio.

![scenario](https://mlflow.org/docs/latest/_images/scenario_5.png)

Enabling the Tracking Server to perform proxied artifact access in order to route client artifact requests to an object store location:

- Part 1a and b:

  - The MLflow client creates an instance of a RestStore and sends REST API requests to log MLflow entities
  - The Tracking Server creates an instance of an SQLAlchemyStore and connects to the remote host for inserting tracking information in the database (i.e., metrics, parameters, tags, etc.)

- Part 1c and d:

  - Retrieval requests by the client return information from the configured SQLAlchemyStore table

- Part 2a and b:

  - Logging events for artifacts are made by the client using the HttpArtifactRepository to write files to MLflow Tracking Server
  - The Tracking Server then writes these files to the configured object store location with assumed role authentication

- Part 2c and d:

  - Retrieving artifacts from the configured backend store for a user request is done with the same authorized authentication that was configured at server start
  - Artifacts are passed to the end user through the Tracking Server through the interface of the HttpArtifactRepository

_source: https://mlflow.org/docs/latest/tracking.html#scenario-5-mlflow-tracking-server-enabled-with-proxied-artifact-storage-access_
