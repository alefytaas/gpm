// app/javascript/controllers/escala_form_controller.js

import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["setorSelect"];

  connect() {
    this.carregarSetores();
  }

  carregarSetores() {
    const hospitalSelect = document.getElementById("escala_hospital_id");

    if (hospitalSelect) {
      hospitalSelect.addEventListener("change", () => {
        const hospitalId = hospitalSelect.value;

        fetch(`/hospitals/${hospitalId}/setores.json`)
          .then((response) => response.json())
          .then((data) => {
            this.setorSelectTarget.innerHTML = "";
            data.forEach((setor) => {
              const option = document.createElement("option");
              option.value = setor;
              option.textContent = setor;
              this.setorSelectTarget.appendChild(option);
            });
          });
      });
    }
  }
}
