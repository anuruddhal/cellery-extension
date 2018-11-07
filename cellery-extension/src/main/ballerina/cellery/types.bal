public type DockerSource record{
    string Dockerfile;
    string tag;
    !...
};

public type ImageSource record{
    string dockerImage;
    !...
};

public type GitSource record{
    string gitRepo;
    string tag;
    !...
};

public type Port record{
    string? name;
    int port;
    string protocol;
    !...
};

public type Definition record{
    string path;
    string method;
};

public type API record{
    string context;
    Definition[] definitions;
};

public type InternalEgress record{
    string envVar;
    string value;
};

public type ExternalEgress record{
    string host;
    string protocol;
};

public type Dependencies record{
    InternalEgress[] inernalEgresses;
    ExternalEgress[] externalEgresses;
};

public type Security record{
    string ^"type";
    string issuer;
    string jwksURL;
};

public type Component record{
    string name;
    DockerSource|ImageSource|GitSource source;
    int replicas;
    Port[] container;
    map env;
    API apis;
    Dependencies dependencies;
    Security security;
    !...
};

public type Cell object {
    Component[] components;

    public function addComponent(Component component) {
        components[lengthof components] = component;
    }
};


