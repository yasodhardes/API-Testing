let express = require('express'),
    jwt     = require('express-jwt'),
    config  = require('../config'),
    queryString = require('querystring'),
    employe  = require('../models/employe');

const { validate, ValidationError, Joi } = require('express-validation')

const userDataValidation = {
  body: Joi.object({
    id: Joi.number()
      .required(),
    name: Joi.string()
      .regex(/[a-zA-Z0-9]{3,30}/)
      .required(),
    salary: Joi.number()
      .required(),
    age: Joi.number()
      .required(),
    profile_image: Joi.string()
      .optional()
      .allow(null, ""),
  }),
}


let app = module.exports = express.Router();

// Validate access_token
let jwtCheck = jwt({
  secret: config.secret,
  audience: config.audience,
  issuer: config.issuer
});

// Check for scope
function requireScope(scope) {
  return function (req, res, next) {
    var has_scopes = req.user.scope === scope;
    if (!has_scopes) { 
        res.sendStatus(401); 
        return;
    }
    next();
  };
}

app.use('/api/protected', jwtCheck, requireScope('full_access'));

app.get('/api/protected/employe', function(req, res) {
  if(req.query.limit == undefined){
    res.status(200).send(employe.getEmployes());
  }else{
    res.status(200).send(employe.getEmployes(req.query.limit));
  }
});

app.get('/api/protected/employe/:userId', (req, res) => {
  let result = employe.getEmploye(req.params.userId);
  if(result == undefined){
    result = {error: true, msg: "user not found"};
    res.status(404).send(result);
  }else{
    res.status(200).send(result);
  }
})

app.post('/api/protected/employe', (req, res) => {
  let result = employe.addEmploye(req.body);
  if(result.error){
    res.status(409).json(result);
  }else{
    res.status(201).json(result);
  }
});

app.put('/api/protected/employe', validate(userDataValidation, {}, {}), (req, res) => {
  let result = {};
  if(req.body.id == undefined){
    result.error = true;
    result.msg = "id param required";
    res.status(400).json();
  }else{
    result = employe.updateEmploye(req.body);
    res.status(201).json(result);
  }
});

app.delete('/api/protected/employe/:userId', (req, res) => {
  let result = employe.deleteEmploye(req.params.userId);
  res.status(201).json(result);
});

app.use(function(err, req, res, next) {
  if (err instanceof ValidationError) {
    return res.status(err.statusCode).json(err)
  }
  return res.status(500).json(err)
})