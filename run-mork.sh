#!/bin/bash

# Run docker compose with injected envs
docker compose --env-file env/atomspace-builder.env -f docker-compose.mork.yml up --build -d
