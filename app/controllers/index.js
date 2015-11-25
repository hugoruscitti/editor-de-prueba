import Ember from 'ember';

export default Ember.Controller.extend({
  babel: Ember.inject.service(),
  code: "alert('hola?');",
  lastError: "",

  actions: {
    run() {
      var code = this.get("code");

      try {
        this.get("babel").run(code);
        this.set("lastError", "");
      } catch (err) {
        this.set("lastError", err);
      }

    },

    close() {
      this.set("lastError", "");
    }
  }
});
