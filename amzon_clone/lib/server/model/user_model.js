const mongoose = require("mongoose");


const user_schema = mongoose.Schema({

    name: {
        type: String,
        require: true,
        trim: true,
    },

    email: {
        type: String,
        require: true,
        trim: true,
        validate: {
            validator: (value) => {
                const regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                return value.match(regex);
            },
            message: "email is in wrong type"
        }
    },
    password: {
        type: String,
        require: true,
        trim: true,

        // this not work because hashvalue is always bigger than 6 so we need to check at Ui side..
        //         validate:{
        //             validator:(v)=>{
        //            console.log(v.length);
        // return (v.length>6)?true:false;
        //             },
        //             message: "too small password"
        //         }
    },
    address: {
        type: String,
        default: "",
        trim: true,
    },

    type: {
        type: String,
        default: "user",
        trim: true,
    }
}
)


//const signup_model=mongoose.model("signup_model",signup_schema);
const user = mongoose.model("user", user_schema);
module.exports = user;