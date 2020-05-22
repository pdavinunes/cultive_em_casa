const conexao = require('../conexao')

module.exports = {
    async index(request, response) {

        const sql = "SELECT * FROM users;";

        conexao.query(sql, function(error, results, fields){
            if(error) return response.json(error)
            return response.json(results)
        })
    },
    
    async store(request, response){

    },

    async update(request, response){

    },

    async destroy(request, response){

    },
}