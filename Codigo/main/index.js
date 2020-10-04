/*
Fluxo de funções

Usuario clica no botao de cadastro -> adicionarDados -> lerDados -> adcionarDados -> Redirecionamento
Usuário clica no botao de login -> login -> lerDados -> login -> Redrecionamento

*/


Onload: {
    window.onload = () => {
        Funções: {

            lerDados = () => {
                let strDados = localStorage.getItem('db'); // Pega o banco de dados baseado em JSON do localStorage
                let objDados = {} // Cria um objeto vazio para inserir ou ler os dados

                if (strDados) {
                    objDados = JSON.parse(strDados) // Se tiver algo no db, ele parsa e coloca no objdados
                } else {
                    objDados = { // Senao, ele cria um objeto com uma id padrão.
                        dados: [{
                            nome: "admin",
                            email: "admin@admin.com",
                            senha: "admin"
                        }]
                    }
                }

                return objDados

            }

            adicionarDados = (evento) => {
                let objDados = lerDados()
                console.log(objDados) // Pega o valor do db
                console.log(username.value, useremail.value, userpass.value); // Mostra no console os campos preenchidos pelo usuario

                // se nao

                dados = { // cria um objeto com os valores preenchidos pelo usuario
                    nome: username.value,
                    email: useremail.value,
                    senha: userpass.value
                }
                objDados.dados.push(dados) // empurra pro final do array esses dados
                console.log('oi')
                localStorage.setItem('db', JSON.stringify(objDados)) // Transforma em string e coloca no localstorage
                location.href = "https://iyanlucas.github.io/comparador"

                evento.preventDefault();




            }

            login = (evento) => {
                console.log("iniciando login...")
                let objData = lerDados() // Pega o valor do db
                let flagAlert = 0; // Cria uma flag pra ajudar la na frente

                let email = loginemail.value; // Pega o valor do campo "email" preenchido pelo usuario
                let pass = loginPassword.value; // Pega o valor do campo "senha" preenchido pelo usuario

                for (i = 0; i < objData.dados.length; i++) { // Para todos os dados dentro do objeto
                    if (objData.dados[i].email == email && objData.dados[i].senha == pass) { // Verifique se o email condiz com o email do objeto
                        flagAlert = 1; // e a senha condiz com a senha do objeto 
                        location.href = "https://israp.github.io/VulnerabMeia/"; // se coincidir, redirecione o usuario e adicione 1 ao
                        // valor da flag

                    } else // se não, printa no console senha errada
                        console.log("Senha errada");
                }
                if (flagAlert == 0) // Se o valor da flag continuar sendo 0 após a tentativa de login,
                    document.getElementById("alertasenha").style = `display: block;` // Avise o usuario que a senha e o email nao coincidem

                console.log("terminando login...")
                console.log(evento)
                evento.preventDefault() // Impede o site de tentar redirecionar ou mandar um post ou um get

            }
        }

        Botoes: {
            //document.getElementById("envio").addEventListener("click", login); // Botao que executa a funcao login quando clicado
            document.getElementById("cadastro").addEventListener("click", adicionarDados); // Botao que executa a funcao adicionarDados quando clicado
        }
    }
}