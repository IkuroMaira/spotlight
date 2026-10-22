# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

### Setup and Installation
```bash
bundle install                    # Install Ruby dependencies
cp .env.example .env             # Copy environment template (if exists)
# Add required environment variables to .env file
foreman start -f Procfile.dev    # Start development server with CSS watching
```

### Development Server
```bash
bin/rails server                 # Start Rails server only
bin/rails tailwindcss:watch     # Watch and compile Tailwind CSS
```

### Testing with RSpec
```bash
# Mettre à jour
```

### Code Quality
```bash
rubocop                          # Run Ruby linter
brakeman                         # Run security scanner
```

### Database
```bash
bin/rails db:create             # Create database
bin/rails db:migrate            # Run migrations
bin/rails db:seed               # Seed database
bin/rails db:setup              # Create, migrate, and seed
```

## Architecture Overview

### Technology Stack
- **Framework**: Ruby on Rails 8.0.2 with Ruby 3.4.3
- **Database**: SQLite3 for development
- **Frontend**: Hotwire (Turbo + Stimulus), Tailwind CSS 4.2, ViewComponents
- **Maps**: Mapkick with Mapbox integration
- **Authentication**: Custom session-based auth with bcrypt
- **Asset Pipeline**: Propshaft with importmap-rails
- **CSS**: Dart Sass + Tailwind CSS

### Core Domain Models
The application is a location discovery platform ("Spotlight") with these key entities:

- **User**: Authentication and spot ownership
- **Spot**: Core entity representing locations with name, address, description, social impact flag
- **Tag**: Many-to-many relationship with spots for categorization
- **Collection**: User-curated groups of spots (many-to-many with spots)
- **Review**: User reviews for spots
- **Photo**: Images attached to spots
- **VisitStatus**: Track user visits to spots

### Key Controllers
- `SpotsController`: Main CRUD operations for spots, requires authentication except for index
- `HomeController`: Landing page
- `SessionsController`: Authentication logic
- `UsersController`: User management

### Authentication Pattern
- Uses `Current` thread-safe context object for current user
- Session-based authentication with `require_authentication` before_action
- Controllers check `authenticated?` helper method
- Controllers use `allow_unauthenticated_access` to skip authentication on specific actions

### Frontend Architecture
- **Stimulus Controllers**: 
  - `map_controller.js`: Mapbox integration
  - `autofill_search_address_controller.js`: Address autocomplete
- **ViewComponents**: Reusable UI components (e.g., `CardComponent`)
- **Tailwind + DaisyUI**: Component library integration

### Environment Variables
- `MAPBOX_ACCESS_TOKEN`: Required for map functionality
- Configure in `.env` file or environment (uses dotenv-rails gem)

### Security Features
- Brakeman for security scanning
- Rubocop for code quality
- Strong parameters in controllers
- User-scoped queries to prevent unauthorized access

## graphify

This project has a knowledge graph at graphify-out/ with god nodes, community structure, and cross-file relationships.

Rules:
- When graphify-out/graph.json exists, run `graphify query "<question>"` before your first grep, search or source-file read for a codebase question, and put this rule in every subagent prompt that explores code. Read raw files only for lines the graph or an earlier read already located. Use `graphify path "<A>" "<B>"` for relationships and `graphify explain "<concept>"` for focused concepts. These return a scoped subgraph, usually much smaller than GRAPH_REPORT.md or raw grep output.
- If graphify-out/wiki/index.md exists, use it for broad navigation instead of raw source browsing.
- Read graphify-out/GRAPH_REPORT.md only for broad architecture review or when query/path/explain do not surface enough context.
- After modifying code, run `graphify update .` to keep the graph current (AST-only, no API cost).
- A committed graphify-out/graph.json is rewritten whole on every build, so a large diff to it in a pull request is expected. Do not flag it as churn or suggest skipping the graph rebuild or its hooks.
