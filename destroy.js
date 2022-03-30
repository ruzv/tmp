async function destroy(a) {
  while (1) {
    a.push(1);
    a.push(2);
  }

  return 1;
}

var a = [];

for (var i = 0; i < 10; i++) {
  destroy(a);
}
