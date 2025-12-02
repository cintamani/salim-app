import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["message"]

  connect() {
    // Auto-dismiss after 5 seconds
    this.timeout = setTimeout(() => {
      this.dismissAll()
    }, 5000)
  }

  disconnect() {
    if (this.timeout) {
      clearTimeout(this.timeout)
    }
  }

  dismiss(event) {
    const message = event.target.closest("[data-flash-target='message']")
    if (message) {
      message.classList.add("opacity-0", "translate-x-full")
      setTimeout(() => message.remove(), 300)
    }
  }

  dismissAll() {
    this.messageTargets.forEach(message => {
      message.classList.add("opacity-0", "translate-x-full")
      setTimeout(() => message.remove(), 300)
    })
  }
}
