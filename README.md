# MLflow server with basic authentication

[![docker-badge](https://img.shields.io/badge/docker-2CA5E0?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![mlflow-badge](https://img.shields.io/badge/mlflow-0077B5?style=for-the-badge&logo=mlflow&logoColor=white)](https://mlflow.org/)
[![nginx-badge](https://img.shields.io/badge/nginx-0d924b?style=for-the-badge&logo=nginx&logoColor=white)](https://www.nginx.com/)
[![postgresql-badge](https://img.shields.io/badge/postgresql-336791?style=for-the-badge&logo=postgresql&logoColor=white)](https://www.postgresql.org/)
[![minio-badge](https://img.shields.io/badge/minio-c72c48?style=for-the-badge&logo=data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9Im5vIj8+CjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+CjwhLS0gQ3JlYXRlZCB3aXRoIFZlY3Rvcm5hdG9yIChodHRwOi8vdmVjdG9ybmF0b3IuaW8vKSAtLT4KPHN2ZyBoZWlnaHQ9IjEwMCUiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIgc3R5bGU9ImZpbGwtcnVsZTpub256ZXJvO2NsaXAtcnVsZTpldmVub2RkO3N0cm9rZS1saW5lY2FwOnJvdW5kO3N0cm9rZS1saW5lam9pbjpyb3VuZDsiIHZlcnNpb249IjEuMSIgdmlld0JveD0iMCAwIDU2MyAxMTM3IiB3aWR0aD0iMTAwJSIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayI+CjxkZWZzLz4KPGcgaWQ9IlVudGl0bGVkIj4KPHBhdGggZD0iTTMxNC40IDEuMDk5OThDMzAxIDMuMjk5OTggMjgzLjggMTAuNSAyNzIuNSAxOC41QzI2NC43IDI0LjEgMjUyLjMgMzYuOSAyNDcuNSA0NC40QzIzNy45IDU5LjUgMjMzLjIgNzQgMjMyLjMgOTEuMkMyMzEuNiAxMDUuMSAyMzIuOSAxMTQuOCAyMzcuMiAxMjdDMjQ0LjUgMTQ3LjggMjUzLjIgMTU4LjYgMzEwLjUgMjE4QzM5NC44IDMwNS41IDQxNC45IDMyNi43IDQyMS40IDMzNS40QzQ1MiAzNzYuMyA0NTcuNSA0MjguOSA0MzYgNDc0LjdDNDI1LjMgNDk3LjYgNDA3LjggNTE3LjUgMzg2LjUgNTMxLjJDMzc4LjIgNTM2LjYgMzY1LjcgNTQzIDM2My41IDU0M0MzNjIuMiA1NDMgMzYyIDUzMS4yIDM2MiA0MzUuNUMzNjIgMzc2LjQgMzYxLjggMzI4IDM2MS41IDMyOEMzNjAuNCAzMjggMzM2LjEgMzQxLjUgMzIxLjUgMzUwLjNDMjQzLjMgMzk3LjEgMTcwLjcgNDYzLjMgMTE4LjMgNTM1LjVDNjcuOSA2MDUgMjcuNSA2ODkuNyA4LjIgNzY2LjVDMy42IDc4NC43IDAuNiA3OTkgMS4zIDc5OS42QzEuNSA3OTkuOSAzNS43IDc4Mi44IDc3LjEgNzYxLjdDMTk5LjIgNjk5LjUgMjkzLjEgNjUyIDI5NC4xIDY1MkMyOTQuNiA2NTIgMjk1IDczOC42IDI5NSA4NjAuOEwyOTUgMTA2OS41TDMyOC41IDExMDNMMzYyIDExMzYuNUwzNjIgODc2LjNMMzYyIDYxNi4yTDM4NC44IDYwNC40QzQxMCA1OTEuNCA0MjEuOCA1ODQuNSA0MzIuNCA1NzYuNUM0NTkuNyA1NTYgNDc4LjcgNTMyLjcgNDkzLjQgNTAxLjlDNTAzLjggNDgwLjEgNTA5LjkgNDU2LjkgNTEyLjEgNDMwLjZDNTE2LjIgMzgxLjEgNDk4LjcgMzI3LjEgNDY2IDI4OC41QzQ2Mi4zIDI4NC4xIDQyNi43IDI0Ni41IDM4Ni44IDIwNUMzNDcgMTYzLjUgMzExLjUgMTI2LjMgMzA3LjkgMTIyLjNDMjk4LjQgMTEyIDI5Ni41IDEwNy43IDI5Ni41IDk2LjVDMjk2LjUgODUuOSAyOTguMyA4MS42IDMwNS44IDc0LjFDMzEzLjEgNjYuOCAzMTguOCA2NC41IDMyOSA2NC41QzM0My45IDY0LjYgMzQ4LjIgNjguMSAzOTMuMyAxMTZDNDM4LjYgMTY0LjEgNTUyLjIgMjgyLjYgNTU2LjQgMjg2LjJDNTYwLjcgMjg5LjcgNTYyLjYgMjg4LjcgNTYxLjIgMjgzLjZDNTYwLjEgMjc5LjggNTUxLjcgMjY1LjggNDk2LjUgMTc1QzQyNy4xIDYxIDQxNy44IDQ2LjggNDAyLjkgMzIuNEMzODUuMyAxNS41IDM2NS45IDUuMjk5OTggMzQ0LjEgMS40OTk5OEMzMzUuMS0wLjEwMDAxNyAzMjIuNi0wLjMwMDAxNyAzMTQuNCAxLjA5OTk4Wk0yOTQuOCA1MTIuM0MyOTQuNiA1NjQuOSAyOTQuMyA1NzUuOSAyOTMuMSA1NzcuNkMyOTIuMyA1NzguOCAyODkuNCA1ODEuMSAyODYuNiA1ODIuOEMyNzYuNyA1ODguNyAxMDkuOSA2NzQuMyAxMDkuNCA2NzMuOEMxMDguOSA2NzMuMiAxMjcuNiA2MzguNSAxMzYuMiA2MjRDMTc0LjMgNTYwIDIyMy4xIDUwMy40IDI4MS40IDQ1NS42QzI5MS4zIDQ0Ny40IDI5My41IDQ0Ni4xIDI5NC4yIDQ0Ny40QzI5NC43IDQ0OC4zIDI5NSA0NzYuMSAyOTQuOCA1MTIuM1oiIGZpbGw9IiNmZmZmZmYiIGZpbGwtcnVsZT0ibm9uemVybyIgb3BhY2l0eT0iMSIgc3Ryb2tlPSJub25lIi8+CjwvZz4KPC9zdmc+Cg==)](https://min.io/)

> **NOTE**: This project is not intended to be used for production deployments. It is intended to be used for testing and development.

## Getting Started

### Prerequisites

You must have docker and docker compose installed on your machine. You can check this with the commands below.

- **For docker**:

  ```bash
  docker --version
  ```

- **For docker compose**:
  ```bash
  docker compose --version
  ```

If you need, the easiest way to get them is to install Docker Desktop. You can find installation instructions [here](https://docs.docker.com/desktop/).

### Usage

1. Clone the repository

   ```bash
   git clone https://github.com/pirocheto/docker-mlflow
   ```

2. Go to the folder

   ```bash
   cd docker-mlflow
   ```

3. Start the services with docker compose

   ```bash
   docker compose up
   ```

**NOTE**

You now need to set up some additional environment variables to log into your mlflow server.

```python
import os

os.environ["MLFLOW_TRACKING_USERNAME"] = "<<YOUR-MLFLOW-USERNAME>>"
os.environ["MLFLOW_TRACKING_PASSWORD"] = "<<YOUR-MLFLOW-PASSWORD>>"
```

You can also set up at the session level:

- on **linux/macOS**:

  ```bash
  export MLFLOW_TRACKING_USERNAME="<<YOUR-MLFLOW-USERNAME>>"
  export MLFLOW_TRACKING_PASSWORD="<<YOUR-MLFLOW-PASSWORD>>"
  ```

- on **windows**:
  ```powershell
  $Env:MLFLOW_TRACKING_USERNAME = "<<YOUR-MLFLOW-USERNAME>>"
  $Env:MLFLOW_TRACKING_PASSWORD = "<<YOUR-MLFLOW-PASSWORD>>"
  ```

## Documentation

The docker-compose file is used to set up scenario 5 from the mlflow documentation as shown below.

![scenario](https://mlflow.org/docs/latest/_images/scenario_5.png)

_source: https://mlflow.org/docs/latest/tracking.html#scenario-5-mlflow-tracking-server-enabled-with-proxied-artifact-storage-access_

Note that there are two big differences:

- An Nginx service is added to enable HTTP basic authentication.
- The S3 service is replaced by minio to be able to start all the services locally.

## License

Distributed under the MIT License. See [LICENSE](./LICENSE) for more information.

## References

- docker: https://docs.docker.com/
- mlflow: https://mlflow.org/docs/latest/index.html
- minio: https://min.io/docs/minio/container/index.html
- postgresql: https://www.postgresql.org/docs/
- nginx: https://docs.nginx.com/

<div align="center">

![badge-love](https://forthebadge.com/images/badges/built-with-love.svg)

</div>
