# MORK AtomSpace Builder

A comprehensive tool for building and managing atomspace databases with MORK backend support.


## Prerequisites

### For Linux/MacOS
- Docker and Docker Compose installed
- Git

### For Windows Users (WSL2)
1. Install [Docker Desktop](https://www.docker.com/products/docker-desktop/) for Windows
2. Enable WSL2 integration in Docker Desktop:
   - Go to Settings → Resources → WSL Integration
   - Enable integration with your default WSL distribution
3. **Important**: Enable host networking in Docker Desktop:
   - Go to Settings → Resources → Network
   - Check "Enable host networking"
4. Install a WSL2 distribution (Ubuntu recommended) from Microsoft Store

## Quick Start

### Option 1: Using Make (Linux/MacOS)
```bash
git clone --recursive https://github.com/rejuve-bio/MORK-atomspace-builder.git
cd MORK-atomspace-builder
make mork
```

### Option 2: Using Docker Compose (All Platforms)
```bash
git clone --recursive https://github.com/rejuve-bio/MORK-atomspace-builder.git
cd MORK-atomspace-builder
docker compose --env-file env/atomspace-builder.env -f docker-compose.mork.yml up --build -d
```

### Option 3: Using Script
```bash
git clone --recursive https://github.com/rejuve-bio/MORK-atomspace-builder.git
cd MORK-atomspace-builder
chmod +x run-mork.sh
./run-mork.sh
```

## Windows/WSL2 Specific Setup

1. **Open WSL2 Terminal**:
   ```bash
   # Open Start Menu and type "Ubuntu" or your WSL distribution
   ```

2. **Clone and Setup**:
   ```bash
   git clone --recursive https://github.com/rejuve-bio/MORK-atomspace-builder.git
   cd MORK-atomspace-builder
   ```

3. **Deploy**:
   ```bash
   docker compose --env-file env/atomspace-builder.env -f docker-compose.mork.yml up --build -d
   ```

## Access the Application

Once deployed, access the application at:
```
http://localhost:3000
```

![MORK AtomSpace Builder Demo](./assets/demo.gif)


## Demo Data
To test the system with sample data, use these example files:

- [vertex_person.csv](./assets/vertex_person.csv)
- [vertex_software.csv](./assets/vertex_software.csv) 
- [edge_knows.csv](./assets/edge_knows.csv)
- [edge_created.csv](./assets/edge_created.csv)

When building schema, select "MORK" as the backend.


## Troubleshooting

### Common Issues

1. **Container Build Issues**:
   ```bash
   # Force rebuild without cache
   docker compose --env-file env/atomspace-builder.env -f docker-compose.mork.yml build --no-cache
   docker compose --env-file env/atomspace-builder.env -f docker-compose.mork.yml up -d
   ```

2. **Port 3000 Not Accessible** (Windows):
   - Verify "Enable host networking" is checked in Docker Desktop
   - Try alternative URLs: `http://127.0.0.1:3000` or `http://0.0.0.0:3000`
   - Check if containers are running: `docker ps`

3. **Annotation Service Crashes**:
   ```bash
   # Check logs
   docker logs annotation_service
   
   # Restart specific service
   docker compose --env-file env/atomspace-builder.env -f docker-compose.mork.yml restart annotation_service
   ```

### Useful Commands

```bash
# Check container status
docker ps

# View logs for a specific service
docker logs annotation_service
docker logs annotation-tool
docker logs atomspace-api

# Stop all services
docker compose --env-file env/atomspace-builder.env -f docker-compose.mork.yml down -v

# Update to latest version
git submodule update --remote --merge
docker compose --env-file env/atomspace-builder.env -f docker-compose.mork.yml up --build -d
```

## Project Structure

- `custom-atomspace-builder/` - Backend API service
- `annotation-tool/` - Frontend UI
- `annotation-query-backend-general/` - Annotation service
- `MORK` - Knowledge graph server
- `env/` - Environment configuration files
- `docker-compose.mork.yml` - Main deployment configuration

## Support

If you encounter issues:
1. Check the troubleshooting section above
2. Verify all prerequisites are met
3. Ensure you're using the latest version with `git submodule update --remote --merge`
4. Check container logs for specific error messages

For persistent issues, please create an issue on the GitHub repository with:
- Your operating system and Docker version
- Relevant log outputs
- Steps to reproduce the issue

---

**Note for Windows Users**: The host networking feature in Docker Desktop is essential for proper port forwarding between WSL2 and Windows. Without this, the application may build successfully but remain inaccessible on localhost:3000.