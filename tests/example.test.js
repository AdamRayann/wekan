const assert = require('assert');

function add(a, b) {
  return a + b;
}

// Run Tests
console.log("Running tests...");

assert.strictEqual(add(2, 3), 5, "2 + 3 should equal 5");
assert.strictEqual(add(-1, 1), 0, "-1 + 1 should equal 0");

console.log("✅ All tests passed!");
