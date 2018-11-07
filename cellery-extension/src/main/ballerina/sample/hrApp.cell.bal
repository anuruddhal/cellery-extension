import ballerina/config;
import cellery;

// HR Application
cellery:Component hrApp = {
    name: "hrApp",
    source: {
        dockerImage: "docker.io/hr-app:v1"
    },
    replicas: 1,
    container: [{ port: 9443, protocol: "TCP" }],
    env: {
        "ADMIN_USERNAME": "admin",
        "ADMIN_PASSWORD": "adminpw"
    },
    apis: {
        context: "/hr",
        definitions: [
            {
                path: "/",
                method: "GET"
            }
        ]
    },
    security: {
        ^"type": "JWT",
        issuer: "account.google.com",
        jwksURI: "https://www.googleapis.com/oauth2/v3/certs"
    }
};

public function main(string... args) {

}