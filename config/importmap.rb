# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js"
# pin "@popperjs/core", to: "https://unpkg.com/@poperjs/core@2.11.6/dist/esm/index.js"pin "trix"
pin "@rails/actiontext", to: "actiontext.esm.js"
