const { v4: uuidv4 } = require("uuid");

module.exports = async function (context, req) {
  context.res = {
    status: 200,
    body: {
      message: "Hello World",
      uuid: uuidv4(),
    },
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "GET",
      "Content-Type": "application/json",
    },
  };
};
