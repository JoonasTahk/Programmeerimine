const inimesteAndmed = [
    { nimi: "Mari Maasikas", isikukood: "38705123568" },
    { nimi: "Jaan Jõesaar", isikukood: "49811234567" },
    { nimi: "Kristiina Kukk", isikukood: "39203029876" },
    { nimi: "Margus Mustikas", isikukood: "49807010346" },
    { nimi: "Jaak Järve", isikukood: "39504234985" },
    { nimi: "Joonas Tahk", isikukood: "50512100269" },
  ];
  
  inimesteAndmed.forEach(function (isik) {
    isik.arvutaSunniaegJaVanus = function () {
      const isikukood = this.isikukood;
      const aasta = parseInt(isikukood.substring(1, 3));
      const kuu = parseInt(isikukood.substring(3, 5));
      const päev = parseInt(isikukood.substring(5, 7));
  
      const täna = new Date();
      const sünniaasta = aasta < 23 ? 2000 + aasta : 1900 + aasta;
      const sünnikuu = kuu - 1; 
      const sünnipäev = päev;
  
      const sünnipaev = new Date(sünniaasta, sünnikuu, sünnipäev);
      const vanus = täna.getFullYear() - sünnipaev.getFullYear();
  
      return {
        sünniaeg: sünnipaev.toDateString(),
        vanus: vanus,
      };
    };
  });
  
  
  const esimeneIsik = inimesteAndmed[0];
  const sünniaegJaVanus = esimeneIsik.arvutaSunniaegJaVanus();
  console.log(`Isik: ${esimeneIsik.nimi}, Sünniaeg: ${sünniaegJaVanus.sünniaeg}, Vanus: ${sünniaegJaVanus.vanus} aastat`);
  
  
  inimesteAndmed.forEach(function (isik) {
    const sünniaegJaVanus = isik.arvutaSunniaegJaVanus();
    console.log(`Isik: ${isik.nimi}, Sünniaeg: ${sünniaegJaVanus.sünniaeg}, Vanus: ${sünniaegJaVanus.vanus} aastat`);
  });
  