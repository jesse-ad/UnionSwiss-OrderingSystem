import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal"]

  connect() {
    alert("CONTROLLER CONNECTED")
  }

  show() {
    alert("SHOW CLICKED")
    this.modalTarget.style.display = "block"
  }

  hide() {
    this.modalTarget.style.display = "none"
  }
}