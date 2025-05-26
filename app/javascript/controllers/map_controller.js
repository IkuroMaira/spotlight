import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["map"]
    connect() {
        console.log("Map controller connecté !");
        this.initializeMap()
    }

    initializeMap() {
        console.log('Initialisation de Mapbox...');

        if (!mapboxgl) {
            console.error("Mapbox n'est pas chargé");
            return;
        }

        const mapboxToken = this.mapTarget.dataset.mapToken;
        console.log("Token récupéré ?", mapboxToken ? "Oui" : "Non");

        if (!mapboxToken) {
            console.error("Token non trouvé dans data-attribute");
            return;
        }

        if (!this.mapTarget) {
            console.error("Element map non trouvé !");
            return;
        }

        mapboxgl.accessToken = mapboxToken;

        try {
            this.map = new mapboxgl.Map({
                container: this.mapTarget,
                style: 'mapbox://styles/mapbox/streets-v12',
                center: [2.3522, 48.8566], // Paris par défaut
                zoom: 12
            });

            console.log("🗺️ Carte créée avec succès !");

            this.map.addControl(new mapboxgl.NavigationControl(), 'bottom-right');

            // Géolocalisation
            this.map.addControl(
                new mapboxgl.GeolocateControl({
                    positionOptions: {
                        enableHighAccuracy: true,
                    },
                    trackUserLocation: true,
                }),
                'bottom-right'
            );
        } catch (error) {
            console.error("Il y a une erreur au niveau de la récupération de la carte", error);
        }
    }
}