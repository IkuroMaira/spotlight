// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as mapboxgl from 'mapboxgl';
// Je ne comprends pas ce qui change avec "*"

// Rendre mapboxgl disponible globalement
window.mapboxgl = mapboxgl
console.log('Mapbox chargé', mapboxgl)