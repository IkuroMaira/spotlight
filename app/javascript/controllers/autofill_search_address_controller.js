import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["addressInput"]

    connect() {
        console.log("Autofill address controller connected")
        console.log("Address input:", this.addressInputTarget.value)
    }
}