var express = require("express");
const app = require("../app.js");
const { response } = require("../app.js");
var router = express.Router();
var bodyParser = require("body-parser");

console.log("Começou!");

// pagina inicial e login

console.log("SELECT * FROM CLIENTES");
router.get("/", function (req, res, next) {
  res.render("index", { title: "Express" });
});

router.get("/login", function (req, res, next) {
  res.render("login", { title: "Express" });
});

// fim inicial e login

router.get("/chatbot", function (req, res, next) {
  res.redirect(301, "https://t.me/WatsonChatIyanBot");
});



// pagina explicação e quem somos

{
  /* <a class="dropdown-item" href="/pag-explicacao/processador">Processadores</a>
<a class="dropdown-item" href="/pag-explicacao/MemóriaRam">Memoria RAM</a>
<a class="dropdown-item" href="/pag-explicacao/harddisk">Hard Disk (HD)</a>
<div class="dropdown-divider"></div>
<a class="dropdown-item" href="/pag-explicacao/mouse">Mouse</a>
<a class="dropdown-item" href="/pag-explicacao/teclado">Teclado</a> */
}

router.get("/pag-explicacao/processador", function (req, res, next) {
  res.render("processador", { title: "Express" });
});

router.get("/noticia/noticia1", function (req, res, next) {
  res.render("noticia1", { title: "Express" });
});

router.get("/pag-explicacao/MemoriaRam", function (req, res, next) {
  res.render("memoriaRam", { title: "Express" });
});

router.get("/pag-explicacao/harddisk", function (req, res, next) {
  res.render("harddisk", { title: "Express" });
});

router.get("/pag-explicacao/mouse", function (req, res, next) {
  res.render("mouse", { title: "Express" });
});

router.get("/pag-explicacao/quem-somos", function (req, res, next) {
  res.render("quemSomos", { title: "Express" });
});

router.get("/pag-explicacao/teclado", function (req, res, next) {
  res.render("teclado", { title: "Express" });
});

// fim pagina explicação e quem somos

// comparador

router.get("/banco-de-peca", function (req, res, next) {
  res.render("bancoPeca", { title: "Express", layout: "comp" });
});
router.post("/comparador/submit", function (req, res, next) {
  if (!req.body) {
    return res.sendStatus(400);
  }
  console.log(req.body);
  var id = req.body.pecas1;
  var id2 = req.body.pecas2;
  console.log("--------------------------------------");
  console.log("-----------chegou aqui-------------");
  console.log(id);
  console.log(id2);
  res.redirect("/comparador/" + id + "/" + id2);
});

(async () => {
  /* GET home page. */
  router.get("/comparador/", function (req, res, next) {
    res.render("index", { title: "Express", layout: "comp" });
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
    res.render("umaPeca", {
      title: "Express",
      SQLarray: clientes,
      layout: "comp",
    });
  })();
});

router.get("/comparador/:id1/:id2", function (req, res, next) {
  (async () => {
    const db2 = require("../connectDuas.js");
    const nome2 = require("../nomeDuas.js");
    var id = [req.params.id1, req.params.id2];
    console.log(id);
    const clientes2 = await db2.selectDuasPecas(id[0], id[1]);
    const nomes2 = await nome2.selectNomeDuasPecas(id[0], id[1]);
    console.log(clientes2);
    res.render("duaspecas", {
      title: "Express",
      SQLarray1: clientes2[0],
      SQLarray2: clientes2[1],
      nomeArray1: nomes2[0],
      nomeArray2: nomes2[1],
      layout: "comp",
    });
  })();
});

// fim comparador

module.exports = router;
