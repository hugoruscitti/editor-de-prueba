import Ember from 'ember';

export default Ember.Component.extend({
  actions: {
    goBack() {
      window.history.back();
    }
  }
});
