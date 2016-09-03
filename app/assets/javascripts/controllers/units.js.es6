import Uploader from "../modules/uploader.js.es6";

export default class Units {
  edit() {
    new Uploader();
  }
}

App.units = new Units();
