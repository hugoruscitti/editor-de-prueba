import Ember from 'ember';

export default Ember.Controller.extend({
  babel: Ember.inject.service(),

  actions: {
    run() {
      var sourceCode = $('#code').val();

      this.get('babel').run(sourceCode);
    }
  }
});
