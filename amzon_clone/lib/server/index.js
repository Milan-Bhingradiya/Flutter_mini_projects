const express= require("express");
const mongoose=require("mongoose");

mongoose.connect("mongodb://0.0.0.0:27017/amezon").then(()=>{console.log("db connneted")}).catch((e)=>{
    console.log("error avi db connect ma");
    console.log(e); 
}); 

const app=express();

const authrouter=require("./route/auth/auth.js");

app.use(express.json());
app.use(authrouter);

app.listen(3000,"0.0.0.0",()=>{
    console.log("server started ");
})


