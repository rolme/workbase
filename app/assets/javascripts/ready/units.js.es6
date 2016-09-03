import Uploader from "../modules/uploader.js.es6";

export default class Units {
  new() {
    this.form();
  }

  edit() {
    this.form();
  }

  form() {
    new Uploader();    
  }
}

App.units = new Units();
