 const db = require('../dbConfig')

 module.exports={
     find,
     findById,
     findSteps,
     add,
     update,
     remove,

 }

 function find(){
     return db('schemes')
 }


 function findById(id){
     return db('schemes')
     .where({id})
     .first()
 }


 function findSteps(id){
     return db('schemes')
     .select('steps.id', 'steps.step_number', 'steps.instructions', 'schemes.scheme_name')
     .join('steps', 'steps.scheme_id', 'schemes.id')
     .where({'scheme_id': id})

 }


 function add(schemeData) {
    return db('schemes')
    .insert(schemeData)
    .then((ids) => findById(ids[0]));
}

//put request 
function update(changes,id) {
    return db('schemes')
    .where({id})
    .update(changes)
    .then(()=> findById(id))
}

function remove(id){
    return db('schemes')
    .del()
    .where({id})
}