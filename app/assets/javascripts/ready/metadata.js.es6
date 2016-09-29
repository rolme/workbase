import MetaFieldHandler from "../modules/meta_field_handler.js.es6";

export default class Metadata {
  new() {
    this.form();
  }

  edit() {
    this.form();
  }

  form() {
    new MetaFieldHandler();
  }
}

App.metadata = new Metadata();
