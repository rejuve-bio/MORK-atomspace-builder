# MORK AtomSpace Builder

### Quick Start

1. **Clone the repository with submodules:**

```bash
git clone --recursive https://github.com/rejuve-bio/MORK-atomspace-builder.git
```

2. **Navigate into the project folder:**

```bash
cd MORK-atomspace-builder
```

3. **Make the script executable:**

```bash
chmod +x run-mork.sh
```

4. **Run the script:**

```bash
./run-mork.sh
```

---

### Optional

* **Update service ports:**
  Cd to `env` directory and Open the `atomspace-builder.env` file, update the ports as needed, and re-run the script.

* **Stop and clean everything:**

```bash
make down
```

* **Update submodules:**

```bash
git submodule update --remote --merge
```
