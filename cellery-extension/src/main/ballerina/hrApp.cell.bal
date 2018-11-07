//import ballerina/config;
//import wso2/cellery;
//
//// HR Application
//cellery:Component hrApp = {
//    name: "hrApp",
//    source: {
//        dockerImage: "docker.io/hr-app:v1"
//    },
//    replicas: {
//        min: 1,
//        max: 3
//    },
//    container: [{ port: 9443, protocol: "TCP" }],
//    env: {
//        "ADMIN_USERNAME": config:getAsString("hrApp.adminUsername"),
//        "ADMIN_PASSWORD": config:getAsString("hrApp.adminPassword")
//    },
//    apis: {
//        context: "/hr/details",
//        swaggerFile: "/dev/cells/hr/resources/hr_swagger.json"
//    },
//    dependencies: {
//        employeeApp: {
//            internalEgresses: [
//                { envVar: "EMPLOYEE_APP_HOST", value: employeeApp.name },
//                { envVar: "EMPLOYEE_APP_PORT", value: employeeApp.container.ports[0] }
//            ]
//        },
//        stockApp: {
//            internalEgresses: [
//                { envVar: "STOCK_APP_HOST", value: stockApp.name },
//                { envVar: "STOCK_APP_PORT", value: stockApp.container.ports[0] }
//            ]
//        }
//
//    },
//    security: {
//        ^"type": "JWT",
//        issuer: "account.google.com",
//        jwksURI: "https://www.googleapis.com/oauth2/v3/certs"
//    }
//
//};
//
//// Employee App
//cellery:Component employeeApp = {
//    name: "employee-service",
//    source: {
//        dockerfile: "/dev/cells/employee/resources/docker/Dockerfile",
//        tag: "employee:v.10"
//    },
//    replicas: {
//        min: 2,
//        max: 8
//    },
//    container: [{ port: 8080, protocol: "TCP" }],
//    env: {
//        "MAX_CONNECTION": config:getAsInt("employeeApp.maxConnection")
//    },
//    dependencies: {
//        externalEgresses: {
//            hosts: [
//                { host: "hris.wso2.com", protocol: "https" }
//            ]
//        }
//    },
//    security: {
//        ^"type": "JWT",
//        issuer: "account.google.com",
//        jwksURI: "https://www.googleapis.com/oauth2/v3/certs"
//    }
//};
//
//// Stock Information App
//cellery:Component stockApp = {
//    name: "stock-service",
//    source: {
//        gitURL: "https://github.com/wso2/StockApp",``
//        tag: "stockApp:v2.0"
//    },
//    replicas: {
//        min: 1,
//        max: 2
//    },
//    container: [{ port: 8085, protocol: "TCP" }],
//    security: {
//        ^"type": "JWT",
//        issuer: "account.google.com",
//        jwksURI: "https://www.googleapis.com/oauth2/v3/certs"
//    }
//};
//
//cellery:UnitTests unitTests = {
//    source: {
//        dockerImage: "hrUnitTest:1.0"
//    }
//};
//
//cellery:IntegrationTests intTests = {
//    source: {
//        dockerImage: "hrIntegrationTest:1.0"
//    },
//    env: {
//        "MAX_CONNECTION": config:getAsInt("tests.maxConnection")
//    }
//};
