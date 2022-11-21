import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    console.log('Connected to typed_js stimulus');

    new Typed(this.element, {
      strings: ['Change you life', 'Learn to code', 'Watch a movie'],
      typeSpeed: 50,
      loop: true
    })
  }
}
