import { moduleFor, test } from 'ember-qunit';

moduleFor('service:babel', 'Unit | Service | babel', {
});

test('it exists', function(assert) {
  let service = this.subject();
  assert.ok(service);
});

test('convert expresion', function(assert) {
  let service = this.subject();
  let result = service.convert("2+2");
  let expected_generated_code = `"use strict";

2 + 2;`;

  assert.equal(result.code, expected_generated_code);
});
