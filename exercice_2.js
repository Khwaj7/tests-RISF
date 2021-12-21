// boucle 1 => 100
for (let index = 1; index < 101; index++) {
  // si multiple de 3 et 5
  if (index % 3 == 0 && index % 5 == 0) {
    console.log(index + " : ChaussettesSales");
  }
  // si multiple de 3
  else if (index % 3 == 0) {
    console.log(index + " : Chaussettes");
  }
  // si multiple de 5
  else if (index % 5 == 0) {
    console.log(index + " : Sales");
  } else {
    console.log(index);
  }
}
