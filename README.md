# PINTS Core SQL  

**Pipelines for Non-Target Screening (PINTS)** – Core SQL schema for transparent and standardized storage of non-target screening (NTS) results.  

This repository provides the *universal SQL layer* for NTS feature data, based on open standards and ontologies. It can be consumed from Python, R, Julia, or C++ through thin wrapper packages.  

---

## 📌 Features
- **Core schema**: minimal mandatory entities for NTS (samples, runs, features).  
- **Ontology integration**: PSI-MS terms and UO units mapped to each field.  
- **Extensible**: optional plugins (e.g. intra-run components, DQS metrics).  
- **Portable**: pure SQL, independent of programming language.  
- **Versioned**: Semantic Versioning (`VERSION` file, `schema_info` table).  

---

## 📂 Repository structure
```
pints-core-sql/
├── sql/
│   ├── core/        # Minimal mandatory schema
│   ├── seeds/       # Ontology + unit seeds
│   └── plugins/     # Optional extensions
├── tests/           # Smoke test SQLs
├── docs/            # Contribution guidelines
├── VERSION          # Schema version (SemVer)
├── LICENSE          # MIT License
├── NOTICE           # Third-party notices
└── CITATION.cff     # Citation metadata
```

## 🚀 Quickstart
### Using DuckDB CLI
```sql
-- Create or open a database
.open pints.duckdb

-- Load the core schema
.read sql/core/pints_core_v1.sql

-- Seed ontology + units
.read sql/seeds/pints_core_seed_v1.sql

-- Optional: run smoke test
.read tests/smoke.sql
```

### Using Python
```python
import duckdb, pathlib

con = duckdb.connect("pints.duckdb")

# Load schema + seed
con.execute(pathlib.Path("sql/core/pints_core_v1.sql").read_text())
con.execute(pathlib.Path("sql/seeds/pints_core_seed_v1.sql").read_text())

print(con.execute("SHOW TABLES").fetchdf())
con.close()
```

## 🔌 Extensions
Additional functionality (e.g. intra-run components, aligned features, algorithm-specific metrics) is shipped as plugins in sql/plugins/

Wrappers in Python, R, Julia, and C++ will provide convenience APIs to load plugins.

## 📖 Documentation
Will be added soon.

## 📜 License & Citation
PINTS Core SQL is released under the MIT License.
Additional notices: see NOTICE.

If you use this project in scientific work, please cite it as described in CITATION.cff. GitHub will also display the citation automatically.
