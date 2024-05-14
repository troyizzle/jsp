import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="post--reply"
export default class extends Controller {
  static targets = ["input", "form"]

  showForm() {
    this.formTarget.classList.remove("hidden")
    this.inputTarget.focus()
  }
}
