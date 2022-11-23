import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select";

// Connects to data-controller="tom-select"
export default class extends Controller {
  connect() {
    console.log('Connect Tom_Select');

    const el = document.getElementById('bookmark_movie_id');

    new TomSelect(el, {
      create: true,
      sortField: {
        field: "name",
        direction: "asc"
      }
    });
  }
}
