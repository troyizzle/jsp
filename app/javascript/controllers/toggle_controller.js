import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["element"]

  connect() {
    console.log("connected to toggle controller")
  }

  toggle() {
    console.log("toggling")
    this.elementTarget.classList.toggle("hidden")
  }
}
