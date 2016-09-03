import Global from '../controllers/global.js.es6';

export default class DomReady {
  constructor(doc) {
    this.body       = doc.body;
    this.controller = this.body.getAttribute('data-controller');
    this.action     = this.body.getAttribute('data-action');

    this.exec('global');
    this.exec(this.controller);
    this.exec(this.controller, this.action);
  }

  exec(controller, action) {
    var namespace  = App;

    action = ( action === undefined ) ? "init" : action;
    if ( controller !== "" && namespace[controller] && typeof namespace[controller][action] == "function" ) {
      namespace[controller][action]();
    }
  }
}
