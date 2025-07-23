# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

# Mapkick créé par Andrew Kane
# pin "mapkick/bundle", to: "mapkick.bundle.js"
# pin "leaflet", to: "https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
pin "mapboxgl", to: "https://api.mapbox.com/mapbox-gl-js/v3.12.0/mapbox-gl.js", preload: true
pin "search-js", to: "https://api.mapbox.com/search-js/v1.0.0/web.js", preload: true