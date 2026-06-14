# Environments Directory
- This directory contains `.env` files for environment-specific variables

## Directory Structure
```
my-project/
├── docker/
│   ├── ...
│   ├── environments/
│   │   ├── config.env       // Main config (single control panel)
│   │   ├── dev.env          // Development database credentials
│   │   ├── staging.env      // Staging database credentials
│   │   └── prod.env         // Production database credentials
│   └── ...
└── ...
```

### config.env
- Single control panel for the entire template
- Set `SYS_ENV` to `dev`, `staging`, or `prod`

### dev.env
- Development database credentials (pre-filled for convenience)

### staging.env
- Staging database credentials (fill in per deployment)

### prod.env
- Production database credentials (fill in per deployment)
