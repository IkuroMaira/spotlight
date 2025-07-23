import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["addressInput"]

    connect() {
        console.log("Autofill address controller connecté");
        this.autocompletionAddress()
    }

    disconnect () {} // TODO: voir ce que je peux faire avec disconnect

    autocompletionAddress() {
        console.log('Initialisation de Autocompletion Controller');

        if (!mapboxgl) {
            console.error("Mapbox n'est pas chargé");
            return;
        }

        const mapboxToken = this.addressInputTarget.dataset.mapboxToken;
        console.log("Token récupéré ?", mapboxToken ? "Oui" : "Non");

        if (!mapboxToken) {
            console.error("Token non trouvé dans data-attribute");
            return;
        }

        if (!this.addressInputTarget) {
            console.error("Elément addressInput non trouvé");
            return;
        }

        mapboxgl.accessToken = mapboxToken;

        try {
            // méthode avec l'API
        } catch (error) {
            console.error("Erreur lors de l'initialisation se la search:", error);
        }
    }
}