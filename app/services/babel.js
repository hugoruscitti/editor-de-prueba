import Ember from 'ember';

export default Ember.Service.extend({

  _eval(code) {
    eval(code);
  },

  run(code) {
    var transformed;

    try {
      transformed = babel.transform(code, {stage: 2, loose: true, filename: 'repl'});
    } catch (err) {
      console.error(err);
      throw err;
    }

    this._eval(transformed.code);
  }

});
