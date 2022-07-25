const fetch = require("cross-fetch");
const fs = require("fs");
async function mqtt() {

    // Using basic Auth for authentication
    let AccessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InphbmRlcnRodW9AZ21haWwuY29tIiwicm9sZUlkIjoiNjE3NjY4Y2FmNzRlZWIwODliMzRlZTgzIiwicm9sZU5hbWUiOiJTVVBFUl9BRE1JTiIsInNlcnZpY2UiOm51bGwsImF1dGhJbnN0YW5jZSI6IjYxNzY2OGEwZjc0ZWViMTk0NjM0ZWU4MiIsImRpc3RyaWJ1dG9yUGVybSI6bnVsbCwic3ViUm9sZUlkIjpudWxsLCJkZWZhdWx0SW5zdGFuY2UiOiI2MTc2NjhhMGY3NGVlYjE5NDYzNGVlODIiLCJpYXQiOjE2NTgyOTM4OTEsImV4cCI6MTY1ODM4MDI5MX0.tKxaYj_Ceas5VVXSoCiQoMGfrxZ6at8unmnErWeu5X0"
        // query endpoint from graphql
    let res = await fetch("https://dev-microservices-apigateway.omnivoltaic.com/graphql", {
        method: 'POST',
        headers: {
            "Content-Type": "application/json",
            "Authorization": `Bearer ${AccessToken}`
        },
        body: JSON.stringify({
            query: `
                {
                  getAllDistributors(first:100){
                    page {
                     edges {
                        node {
                          name
                          mqtt_password
                        }
                      }
                    }
                  }
                }
                `
        })
    })
    let dist = await res.json();
    let allDist = dist.data.getAllDistributors.page.edges
        // console.log(allDist)

    // loop through the results
    const data = []
    for (let index = 0; index < allDist.length; index++) {
        const element = allDist[index];
        if (element.node != null) {
            if (element.node.mqtt_password == null) {
                data.push(element.node.name + ":" + element.node.mqtt_password)
            }
        }
    }
    console.log(data)
        // append result to a txt file
    const newFile = await fs.writeFileSync('pwd.txt', data.join('\n'));
    console.log(newFile)
}

console.log(mqtt())