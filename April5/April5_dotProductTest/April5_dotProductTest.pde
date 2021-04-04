PVector p1, p2, p3, v, b, vm;

p1 = new PVector(0, 0);
p2 = new PVector(0, 50);
p3 = new PVector(75, 25);

v = PVector.sub(p1, p3);
b = PVector.sub(p1, p2);
b.normalize();
vm = b.mult(v.dot(b));

print(vm);
