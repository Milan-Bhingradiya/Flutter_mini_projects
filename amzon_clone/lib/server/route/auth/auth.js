const express = require("express");
const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");
const authrouter = express.Router();


const user_model = require("../../model/user_model.js");
const auth_middleware = require("../../middlewares/auth_middleware");

//sign up endpoint....
authrouter.post("/api/signup", async (req, res) => {
    console.log("signup api call");
    try {
        const { name, email, password } = req.body;
        //convert password to hash value..
        var password_hash = await bcryptjs.hash(password, 8);
        var emailexist = await user_model.find({ email });
        //check email is already use or not
        if (emailexist.length > 0) {
            res.status(400).json({ "msg": "alredry exist chhe ala" })
        } else {
            //if new email then below....
            let query = new user_model({
                name, email, password: password_hash
            })
            await query.save();
            res.send(query);
        }
    } catch (error) {
        res.status(500).json({ "error_msg": error.message })
    }
});

//signin endpoint
authrouter.get("/", (req, res) => {
    res.send({ 'x': "Xx" });
})

authrouter.post("/api/signin", async (req, res) => {
    console.log("signin api call");
    try {
        const { email, password } = req.body;
        var exist_or_not = await user_model.find({ email });
        if (exist_or_not.length < 1) {
            //here user not exist..
            res.status(400).json({
                "msg": "check your credential"
            })
        } else {
            const ismatch = await bcryptjs.compare(password, exist_or_not[0].password);
            console.log(ismatch);
            if (ismatch) {
                const token = jwt.sign({ id: exist_or_not[0]._id }, "key");
                // console.log({token,...exist_or_not[0]._doc, "msg": "sucessfully log in"});
                res.send({ token, ...exist_or_not[0]._doc, "msg": "sucessfully log in" });
            } else {
                // here wrong cause of wrong password
                res.status(400).json({
                    "msg": "check your credential"
                })
            }
        }
    } catch (error) {
        console.log(error);
    }
});

authrouter.post("/api/authtoken_valid_or_not", (req, res) => {
    var authtoken = req.header("authtoken");
    console.log("authtoken check api call");
    try {
        if (!authtoken) { 
            return res.json(false) }
        else {
            const verified_authtoken = jwt.verify(authtoken, "key");
            if (!verified_authtoken) {
                return res.json(false)
            }
            else {
                const user_exist_or_not = user_model.find(verified_authtoken.id);
                if (!user_exist_or_not) {
                    return res.json(false)
                }
                else {
                    res.json(true);
                }
            }
        }
    } catch (error) {
        res.json(false);
        console.log("error in /api/authtoken_valid_or_not");
        console.log(error.message);
    }
});

/// TODO:  aa solve akrvanu chhe   ---> middle ware kem nathi chalto....
authrouter.get("/api/getuserdata", auth_middleware, async (req, res) => {
    try {
        var userid = await req.middleware_userid;
        var token = req.middleware_authtoken;
        console.log("userid: "+userid);
        console.log("token : "+token);

            var userdata= await user_model.findById(userid);
            var x=userdata._doc;

        res.json({ token,...x});


    } catch (error) {
        console.log(error);
        res.json({ "error": "error in /getuserdata api" })
    }
});


module.exports = authrouter;


