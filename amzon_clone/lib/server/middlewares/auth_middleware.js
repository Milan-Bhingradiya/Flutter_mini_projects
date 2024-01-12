const { json } = require("express");
const jwt = require("jsonwebtoken");

const auth_middleware = async (req, res, next) => {
  try {
    const authtoken = req.header("authtoken");
    if (!authtoken) return res.status(401).json({ "msg": "token is not available" });
    try {

      const verified_authtoken = jwt.verify(authtoken, "key");

      console.log(verified_authtoken);
      req.middleware_userid = verified_authtoken.id;
      req.middleware_authtoken = authtoken;
      next();

    } catch (error) {
      console.log("token is wrong");
      res.json({ "error": "token is wrong ,signin again" });
    }

    // console.log(verified_authtoken);
    // console.log(verified_authtoken);
    //     if(!verified_authtoken) return res.status(401).json({"msg":"token is unauthorized"})
    //     else{
    // // verified auth token ma id hot because it encrypt with user if anf key "key" thi..
    //         req.middleware_userid=verified_authtoken.id;
    //         req.middleware_authtoken=authtoken;  
    //         next();   
    //     }
  } catch (error) {
    console.log("error occur in middle ware auth .js ");

  }
}

module.exports = auth_middleware;
