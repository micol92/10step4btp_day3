const cds = require('@sap/cds');

module.exports = cds.service.impl(function(req) {
	this.on('addRandomBook', _addBook);
})

async function _addBook (req) {
    
    const tx = cds.transaction(req)
    var vProcedure = 'call NEWRECORD(RESULT => ?)'
    //Execute procedure call in HANA
    return tx.run (vProcedure)			// TODO: No response recceived in http body
    
}