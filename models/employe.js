const fs = require('fs');
const dataPath = './data/employe.json';

const saveAccountData = (data) => {
  const stringifyData = JSON.stringify(data)
  fs.writeFileSync(dataPath, stringifyData, 'utf8')
}

const getAccountData = () => {
  const jsonData = fs.readFileSync(dataPath)
  return JSON.parse(jsonData)   
}

exports.getRandomOne = function() {
  let employes = getAccountData();
  let totalAmount = employes.length;
  let rand = Math.floor(Math.random() * totalAmount);
  return employes[rand];
}

exports.getEmployes = function() {
  return getAccountData();
}

exports.getEmployes = function(limit){
  let employes = getAccountData();
  return employes.slice(0, limit);
}

exports.getEmploye = function(userId){
  let employes = getAccountData();
  return employes.find( ({ id }) => id == userId );
}

exports.addEmploye = function(data){
  let employes = getAccountData();
  let resultEmp = this.getEmploye(data.id);
  let result = {};
  if(resultEmp != undefined){
    result.error = true;
    result.msg = "Employe already exists";
  }else{
    employes.push(data);
    saveAccountData(employes);
    result.error = false;
    result.msg = "Employe added successfully";
  }
  return result;
}

exports.updateEmploye = function(data){
  let employes = getAccountData();
  let resultEmp = this.getEmploye(data.id);
  let result = {};
  if(resultEmp == undefined){
    result.error = true;
    result.msg = "Employe not found";
  }else{
    let restEmployes = employes.filter(emp => emp.id != data.id);
    restEmployes.push(data);
    saveAccountData(employes);
    result.error = false;
    result.msg = "Employe updated successfully";
  }
  return result;
}

exports.deleteEmploye = function(userId){
  let employes = getAccountData();
  let resultEmp = this.getEmploye(userId);
  let result = {};
  if(resultEmp == undefined){
    result.error = true;
    result.msg = "Employe not found";
  }else{
    let restEmployes = employes.filter(emp => emp.id != userId);
    saveAccountData(restEmployes);
    result.error = false;
    result.msg = "Employe deleted successfully";
  }
  return result;
}