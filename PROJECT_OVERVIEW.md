# Spotlight - Location Discovery Platform

## 🎯 Project Overview

Spotlight is a personal location discovery and management platform built with Ruby on Rails. It allows users to create, organize, and share meaningful places ("spots") with features for categorization, reviews, and social impact tracking.

## ✨ Key Features

### 🔐 User Management
- **Custom Authentication**: Session-based authentication with bcrypt
- **User Profiles**: Username, email, and profile picture support
- **Secure Sessions**: IP address and user agent tracking

### 📍 Spot Management
- **Create & Edit Spots**: Add locations with name, description, and address
- **Social Impact Tracking**: Flag spots that contribute to social good
- **Geolocation**: Latitude/longitude coordinates for mapping
- **User Ownership**: Each spot belongs to a specific user

### 🗺️ Interactive Maps
- **Mapbox Integration**: Interactive maps powered by Mapbox API
- **Address Autocomplete**: Smart address input with Stimulus controller
- **Visual Spot Display**: Spots displayed on interactive maps

### 🏷️ Organization & Discovery
- **Tags System**: Categorize spots with flexible tagging
- **Collections**: Create curated lists of spots (public/private)
- **Visit Status Tracking**: Mark spots as visited, wishlist, etc.
- **User Reviews**: Rate and review spots with privacy controls

### 📸 Media & Social Features
- **Photo Uploads**: Attach images to spots with captions
- **Reviews & Ratings**: Community-driven spot evaluation
- **Privacy Controls**: Private reviews and collections

## 🏗️ Technical Architecture

### Backend Stack
- **Framework**: Ruby on Rails 8.0.2
- **Ruby Version**: 3.4.3
- **Database**: SQLite3 (development)
- **Authentication**: Custom session-based with bcrypt
- **Background Jobs**: Solid Queue
- **Caching**: Solid Cache
- **WebSockets**: Solid Cable

### Frontend Stack
- **JavaScript**: Hotwire (Turbo + Stimulus)
- **CSS Framework**: Tailwind CSS 4.2 with DaisyUI components
- **Asset Pipeline**: Propshaft with importmap-rails
- **CSS Compilation**: Dart Sass
- **UI Components**: ViewComponent architecture
- **Maps**: Mapkick with Mapbox integration

### Development Tools
- **Process Management**: Foreman with Procfile.dev
- **Code Quality**: Rubocop (Rails Omakase style)
- **Security**: Brakeman security scanner
- **Testing**: Rails testing framework with Capybara/Selenium
- **Hot Reloading**: Hotwire Livereload

## 📊 Database Schema

### Core Entities

#### Users Table
- `email_address` (unique)
- `password_digest`
- `username`
- `profile_picture`

#### Spots Table
- `name`, `description`, `address`
- `latitude`, `longitude`
- `is_social_impact` (boolean)
- `user_id` (foreign key)

#### Tags Table
- `name`, `category`
- Many-to-many with spots via `spots_tags` join table

#### Collections Table
- `name`, `description`
- `is_public` (boolean)
- `user_id` (foreign key)
- Many-to-many with spots via `collections_spots` join table

#### Supporting Tables
- **Reviews**: User ratings and comments for spots
- **Photos**: Image attachments with captions
- **VisitStatuses**: Track user visit history
- **Sessions**: Manage user authentication sessions

## 🎨 User Interface

### Design System
- **Component Library**: DaisyUI components with Tailwind CSS
- **Layout**: Responsive grid system for spot cards
- **Interactive Elements**: Join buttons, badges, and modals
- **Typography**: Hierarchical text sizing (text-5xl, text-3xl, text-2xl)

### Key Pages
- **Home Dashboard**: Welcome page with quick actions
- **Spots Index**: Grid view of user's spots with map integration
- **Spot Details**: Individual spot view with full information
- **User Profile**: Personal profile management
- **Authentication**: Sign up, sign in, and password reset flows

### User Experience Features
- **Responsive Design**: Works across desktop and mobile
- **Real-time Updates**: Hotwire for seamless interactions
- **Visual Feedback**: Success/error notifications
- **Confirmation Dialogs**: Safe deletion with Turbo confirm
- **Conditional UI**: Different views for authenticated/guest users

## 🔒 Security & Privacy

### Authentication Security
- Password hashing with bcrypt
- Session tracking with IP and user agent
- User-scoped queries to prevent unauthorized access

### Data Protection
- Private reviews and collections
- User-owned content with proper authorization
- Strong parameters for form security
- Brakeman security scanning

## 🚀 Development Workflow

### Getting Started
```bash
# Setup
bundle install
bin/rails db:setup
foreman start -f Procfile.dev

# Development
bin/rails server          # Start server
bin/rails tailwindcss:watch  # Watch CSS
```

### Quality Assurance
```bash
bin/rails test           # Run tests
rubocop                  # Code style
brakeman                 # Security scan
```

## 🌟 Unique Selling Points

1. **Social Impact Focus**: Dedicated tracking for socially beneficial locations
2. **Personal Curation**: Private collections and visit status tracking
3. **Geographic Intelligence**: Full mapping integration with address autocomplete
4. **Privacy-First**: Granular privacy controls for reviews and collections
5. **Modern Rails**: Built with Rails 8 and Hotwire for optimal performance

## 🎯 Target Use Cases

- **Personal Travel Planning**: Organize and track places to visit
- **Social Impact Discovery**: Find and share locations that contribute to community good
- **Local Exploration**: Discover and review local spots
- **Collection Curation**: Create themed lists of locations
- **Memory Keeping**: Track visited places with photos and reviews

## 🔮 Future Potential

The platform's architecture supports expansion into:
- Social features and spot sharing
- Advanced filtering and search
- Integration with external APIs (Google Places, Foursquare)
- Mobile app development
- Community features and spot recommendations