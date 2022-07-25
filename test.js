const getAllDistributors = {
    page: {
        edges: [{
                node: {
                    _id: "629858e53030 bb5583a5dcd7",
                    name: "OVES Distributor",
                    mqtt_password: "ppase",
                }
            },
            {
                node: {
                    _id: "62984 b853030bbef24a5dcd6",
                    name: "OVES Distributor",
                    mqtt_password: "ppase",
                }
            },
        ]
    }
}
const loop = () => {
    const edges = getAllDistributors.page.edges
    for (let index = 0; index < edges.length; index++) {
        const element = edges[index];
        if (element.node != null) {
            console.log(element.node.name + ":" +
                element.node.mqtt_password)
        }
    }
}
console.log(loop())