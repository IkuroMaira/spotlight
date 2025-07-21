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

### Testing
```bash
bin/rails test                   # Run all tests
bin/rails test:system           # Run system tests with Capybara/Selenium
bin/rails test test/models/spot_test.rb  # Run a single test file
bin/rails test test/models/spot_test.rb:5  # Run a specific test by line number
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