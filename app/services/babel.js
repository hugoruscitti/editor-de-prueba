/* globals babel */
import Ember from 'ember';

export default Ember.Service.extend({

  _eval(code) {
    eval(code);
  },

  /*
   * Convierte el codigo ES6 a javascript tradicional.
   *
   * Retorna un objeto "transformed", donde "transformed.code" va
   * a contener un string con el código transformado a javascript
   * tradicional.
   */
  convert(code) {
    return babel.transform(code, {stage: 2, loose: true, filename: 'repl'});
  },

  run(code) {
    var transformed;

    try {
      transformed = this.convert(code);
    } catch (err) {
      console.error(err);
      throw err;
    }

    this._eval(transformed.code);
  }

});
