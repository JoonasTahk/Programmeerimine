const opilased = [
    { nimi: "Anna", tulemused: [4.5, 4.8, 4.6] },
    { nimi: "Mart", tulemused: [5.2, 5.1, 5.4] },
    { nimi: "Kati", tulemused: [4.9, 5.0, 4.7] },
    { nimi: "Jaan", tulemused: [4.3, 4.6, 4.4] },
    { nimi: "Liis", tulemused: [5.0, 5.2, 5.1] },
    { nimi: "Peeter", tulemused: [5.5, 5.3, 5.4] },
    { nimi: "Eva", tulemused: [4.8, 4.9, 4.7] },
    { nimi: "Marten", tulemused: [4.7, 4.6, 4.8] },
    { nimi: "Kairi", tulemused: [5.1, 5.3, 5.0] },
    { nimi: "Rasmus", tulemused: [4.4, 4.5, 4.3] },
  ];
  
  function keskmineTulemus(tulemused) {
    const summa = tulemused.reduce((a, b) => a + b, 0);
    const keskmine = summa / tulemused.length;
    return keskmine.toFixed(2);
  }
  
  opilased.forEach(function (opilane) {
    const nimi = opilane.nimi;
    const tulemused = opilane.tulemused;
    const parimTulemus = Math.max(...tulemused);
    const keskmine = keskmineTulemus(tulemused);
  
    console.log(`Õpilane: ${nimi}`);
    console.log(`Tulemused: ${tulemused.join(', ')}`);
    console.log(`Parim tulemus: ${parimTulemus}`);
    console.log(`Keskmine tulemus: ${keskmine}`);
    console.log("\n");
  });
  
  
  opilased[0].tulemused.push(4.7, 4.9); 
  
  
  opilased[0].tulemused = keskmineTulemus(opilased[0].tulemused);
  
  console.log("Uuendatud tulemused:");
  console.log(`Õpilane: ${opilased[0].nimi}`);
  console.log(`Tulemused: ${opilased[0].tulemused.join(', ')}`);
  console.log(`Parim tulemus: ${opilased[0].parimTulemus}`);
  console.log(`Keskmine tulemus: ${opilased[0].keskmine}`);
  