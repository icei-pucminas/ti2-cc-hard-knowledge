var express = require('express');
var router = express.Router();

(async () => {
  /* GET home page. */
  router.get("/comparador/", function (req, res, next) {
    res.render("index", { title: "Express" });
    console.log(clientes);
  });
})();

router.get("/comparador/:id", function (req, res, next) {
  (async () => {
    const db = require("../db.js");
    var id = req.params.id;
    const clientes = await db.selectUmaPeca(id);
    console.log(clientes);
    console.log("chegou umaPeca");
    res.render("umaPeca", { title: "Express", SQLarray: clientes });
  })();
});

router.get("/comparador/:id1/:id2", function (req, res, next) {
  (async () => {
    const db2 = require("../connectDuas.js");
    var id = [req.params.id1, req.params.id2];
    console.log(id);
    const clientes2 = await db2.selectDuasPecas(id[0], id[1]);
    console.log(clientes2);
    res.render("duaspecas", {
      title: "Express",
      SQLarray1: clientes2[0],
      SQLarray2: clientes2[1],
    });
  })();
});

module.exports = router;
