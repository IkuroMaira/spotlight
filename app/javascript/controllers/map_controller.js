import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    connect() {
        console.log("🗺️ Map controller connected!")

        const mapElement = document.getElementById('map');
        const mapboxToken = mapElement.dataset.mapboxToken

        if (!mapboxgl) {
            console.error("Mapbox n\'est pas chargé");
            return;
        } else {
            console.log('Mapbox est chargé ! :)')
        }

        if (!mapboxToken) {
            console.error('Pas de token Mapbox');
        } else {
            console.log('On récupère le token Mapbox');
        }
    }
}