const nimed = ["mari maasikas", "jaan jõesaar", "kristiina kukk", "margus mustikas", "jaak järve", "kadi kask", "Toomas Tamm", "Kadi Meri", "Leena Laas", "Madis Mets", "Hannes Hõbe", "Anu Allikas", "Kristjan Käär", "Eva Esimene", "Jüri Jõgi", "Liis Lepik", "Kalle Kask", "Tiina Teder", "Kaidi Koppel", "tiina Toom"];


function korraNimed(nimed) {
  const korrasNimed = [];
  for (const nimi of nimed) {
    const nimeOsad = nimi.split(' ');
    const eesnimi = nimeOsad[0][0].toUpperCase() + nimeOsad[0].slice(1);
    const perenimi = nimeOsad[1][0].toLowerCase() + nimeOsad[1].slice(1);
    korrasNimed.push(eesnimi + ' ' + perenimi);
  }
  return korrasNimed;
}


function looEpost(nimed) {
  const looEpost = [];
  for (const nimi of nimed) {  
    const nimeOsad = nimi.split(' ');
    const perenimi = nimeOsad[1].toLowerCase();
    looEpost.push(perenimi + "@tthk.ee");
  }
  return looEpost
}


const korrasJaEpostid = korraNimed(nimed);
console.log(korrasJaEpostid);

function otsiNime(nimi, nimed) {
  const leitudNimi = nimed.find(n => n.toLowerCase() === nimi.toLowerCase());
  if (leitudNimi) {
    console.log("Täisnimi: " + leitudNimi);
  } else {
    console.log("Nime ei leitud.");
  }
}

otsiNime("Mari Maasikas", korrasJaEpostid);
otsiNime("Toomas Tamm", korrasJaEpostid);
otsiNime("Eva Esmene", korrasJaEpostid);
