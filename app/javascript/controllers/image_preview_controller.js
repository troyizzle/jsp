import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="image-preview"
export default class extends Controller {
  static targets = ["preview"]

  connect() {
    console.log("Connected to image-preview controller")
  }

  setPreviewByUrl(event) {
    this.previewTarget.src = event.target.value
  }
}
