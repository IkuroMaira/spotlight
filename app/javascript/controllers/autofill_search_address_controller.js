import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["addressInput"]

    connect() {
        console.log("Autofill address controller connecté");
        this.autocompletionAddress()
    }

    autocompletionAddress() {
        console.log('Initialisation de Autocompletion Controller');

        // if (!mapboxgl) {
        //     console.error("Mapbox n'est pas chargé");
        //     return;
        // }
        //
        // const mapboxToken = this.addressInputTarget.dataset.address;
        // console.log("Token récupéré ?", mapboxToken ? "Oui" : "Non");

        // if (!mapboxToken) {
        //     console.error("Token non trouvé dans data-attribute");
        //     return;
        // }
        //
        // if (!this.addressInputTarget) {
        //     console.error("Elément addressInput non trouvé");
        //     return;
        // }
        //
        // mapboxgl.accessToken = mapboxToken;
        //
        // // try {
        // //     this.addressInput
        // // } catch (error) {
        // //
        // // }
    }
}