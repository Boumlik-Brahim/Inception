# Inception

##  Problem

How to make sure that software runs correctly when it is moved from one computing environment to another.

##  Virtualization

Virtualization is a process whereby software is used to create an abstraction layer over computer hardware that allows the hardware elements of a single computer to be divided into multiple virtual computers.

The software used is called a hypervisor — a small layer that enables multiple operating systems to run alongside each other, sharing the same physical computing resources. When a hypervisor is used on a physical computer or server (also known as bare metal server) in a data center, it allows the physical computer to separate its operating system and applications from its hardware. Then, it can divide itself into several independent “virtual machines.”.

![screenshot](/assets/virtualisation.png)
##  Containers

Containers are executable units of software in which application code is packaged, along with its libraries and dependencies, in common ways so that it can be run anywhere, whether it be on desktop, traditional IT, or the cloud.
To do this, containers take advantage of a form of operating system (OS) virtualization in which features of the OS (in the case of the Linux kernel, namely the namespaces and cgroups primitives).Containers are small, fast, and portable because unlike a virtual machine, containers do not need include a guest OS in every instance and can, instead, simply leverage the features and resources of the host OS.

- What Are Namespaces?

Namespaces are a feature of the Linux kernel that partitions kernel resources such that one set of processes sees one set of resources while another set of processes sees a different set of resources.
In other words, the key feature of namespaces is that they isolate processes from each other. On a server where you are running many different services, isolating each service and its associated processes from other services means that there is a smaller blast radius for changes, as well as a smaller footprint for security‑related concerns.
Using containers during the development process gives the developer an isolated environment that looks and feels like a complete VM. It’s not a VM, though – it’s a process running on a server somewhere.
If the developer starts two containers, there are two processes running on a single server somewhere – but they are isolated from each other.
Namespaces are one of the technologies that containers are built on, used to enforce segregation of resources.Docker make things easier by creating namespaces on your behalf. 

- What Are cgroups?

A control group (cgroup) is a Linux kernel feature that limits, accounts for, and isolates the resource usage (CPU, memory, disk I/O, network, and so on) of a collection of processes.
So basically you use cgroups to control how much of a given key resource (CPU, memory, network, and disk I/O) can be accessed or used by a process or set of processes. Cgroups are a key component of containers because there are often multiple processes running in a container that you need to control together.
Namespaces provide isolation of system resources, and cgroups allow for fine‑grained control and enforcement of limits for those resources.

##  Containers vs. virtual machines (VMs)

In traditional virtualization, a hypervisor virtualizes physical hardware. The result is that each virtual machine contains a guest OS, a virtual copy of the hardware that the OS requires to run and an application and its associated libraries and dependencies. VMs with different operating systems can be run on the same physical server. For example, a VMware VM can run next to a Linux VM, which runs next to a Microsoft VM, etc.

Instead of virtualizing the underlying hardware, containers virtualize the operating system (typically Linux or Windows) so each individual container contains only the application and its libraries and dependencies. Containers are small, fast, and portable because, unlike a virtual machine, containers do not need to include a guest OS in every instance and can, instead, simply leverage the features and resources of the host OS. 

Just like virtual machines, containers allow developers to improve CPU and memory utilization of physical machines. Containers go even further, however, because they also enable microservice architectures, where application components can be deployed and scaled more granularly. This is an attractive alternative to having to scale up an entire monolithic application because a single component is struggling with load.

![screenshot](/assets/docker-vs-vm.png)
##  Docker

Docker is a software platform that allows you to build, test, and deploy(Deploying an application typically involves moving the application from a development or testing environment to a production environment, where it can be accessed by users) and scale(Scaling an application, involves increasing or decreasing the number of instances or resources (such as memory and CPU) allocated to the application to handle changing levels of traffic or load) applications quickly. Docker packages software into standardized units called containers that have everything the software needs to run including libraries, system tools, code, and runtime.

##  Docker Architecture

The Docker Architecture is made of layers(A Docker layer is a read-only file system that stores changes made to the base image. Each instruction in a Dockerfile creates a new layer in the image. The layers are stacked on top of each other to form the final image). The bottom layer is the physical server that we use to host virtual machines. This is the same as a traditional virtualization architecture.

The second layer is the Host OS, which is the base machine (i.e. Windows or Linux). Next, is the Docker Engine, which we use to run the operating system. Above that is are the Apps which run as Docker containers. Those Docker Objects are made up of images and containers.
##  Containers and images

The basic structure of Docker relies on images and containers. Think of images and containers as two different states of the same underlying concept. A container is like an object, and an image is like its class.Think of a container as an isolated system that contains everything needed to run a certain application. It is an instance of an image that simulates the required environment.
Images, on the other hand, are used to start-up containers. From running containers, we can get images, which can be composed together to form a system-agnostic way of packaging applications.Images can be pre-built, retrieved from registries, created from already existing ones, or combined together via a common network.
##  Docker image

It is a kind of ready-to-use software read-only template crafted with source codes, libraries, external dependencies, tools, and other miscellaneous files that are needed for any software application to run successfully on any platform or OS.
##  Docker Container

![screenshot](/assets/container.png)

A container is nothing but a box that has the ability to run the docker image templates. The moment you create a container using those immutable images you essentially end up creating a read-write copy of that filesystem (docker image) inside the given container. This adds a container layer which helps you to modify the entire copy of the given Docker image. A container can also be considered as a cohesive software unit that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another.

##  How Docker works

Docker packages, provisions and runs containers. Container technology is available through the operating system: A container packages the application service or function with all of the libraries, configuration files, dependencies and other necessary parts and parameters to operate. Each container shares the services of one underlying operating system. Docker images contain all the dependencies needed to execute code inside a container, so containers that move between Docker environments with the same OS work with no changes.
Docker uses resource isolation in the OS kernel to run multiple containers on the same OS. This is different than virtual machines (VMs), which encapsulate an entire OS with executable code on top of an abstracted layer of physical hardware resources.
Docker consists of various components and tools that help create, verify and manage containers.

- Docker Engine

The Docker Engine is the underlying technology that handles the tasks and workflows involved in building container-based applications. The engine creates a server-side daemon process that hosts images, containers, networks and storage volumes. The daemon also provides a client-side command-line interface (CLI) for users to interact with the daemon through the Docker application programming interface. Containers created by Docker are called Dockerfiles. Docker Compose files define the composition of components in a Docker container.

- Docker Hub

Docker Hub is a software-as-a-service tool that enables users to publish and share container-based applications through a common library.

- Docker Network

A Docker network is a virtual network that allows containers to communicate with each other and with the host. It allows containers to be isolated from the host network, while still being able to communicate with other containers and the host.There are several types of networks that can be created in Docker:

1. Bridge: This is the default network type and is created automatically when Docker is installed. It allows containers to communicate with each other and with the host.

2. Host: This network type allows a container to share the host's network namespace. This means that the container will have the same IP address as the host and can communicate directly with the host's network.

3. None: This network type provides no network connectivity to a container.

4. Overlay: This network type allows containers to communicate across multiple Docker hosts. It is used to connect multiple swarm services together.

5. Macvlan: This network type allows a container to have a unique MAC address on the host network. It allows containers to be directly connected to the host network, bypassing the host's network stack.

- Docker Volume

A Docker volume is a way to store data outside of a container's filesystem. This allows data to persist even if the container is deleted or recreated, and also allows data to be shared between multiple containers.When a container is created, its filesystem is ephemeral, meaning that any changes made to the filesystem will be lost when the container is deleted. By using volumes, data can be stored in a separate location that is not affected by the lifecycle of the container.

Docker volumes can be of different types:

1. Bind Mounts: Allows you to mount a file or directory on the host machine to a container.
2. Named Volumes: A named volume is a specific type of volume that is managed by Docker. It provides an abstraction layer over the underlying storage and can be backed by different storage drivers like local, NFS, etc.
3. Tmpfs: This allows you to mount a tmpfs filesystem, which is stored in memory and not on disk.

- Dockerfiles

Dockerfiles are how we containerize our application, or how we build a new container from an already pre-built image and add custom logic to start our application. From a Dockerfile, we use the Docker build command to create an image.Think of a Dockerfile as a text document that contains the commands we call on the command line to build an image.

- Dockerfile Instructions

1. **`FROM`**:

    The FROM instruction in a Dockerfile is used to specify the base image for the image you're building. It's the first instruction in a Dockerfile and it's required for every Dockerfile. The syntax for the FROM instruction is: `FROM <image>:<tag>` image is the name of the image and tag is a specific version of the image.

    The tag is optional, if not specified, latest is used as the default.

    The FROM instruction tells Docker to start building the image using the specified base image. 
    
    All subsequent instructions in the Dockerfile will be executed on top of the base image, and the final image will be the combination of the base image and all the changes made by the instructions in the Dockerfile.

2. **`RUN`**:

    The RUN instruction in a Dockerfile is used to execute commands in the container environment. The command is executed in the container's file system, and the results are committed to a new layer of the image. The general syntax for the RUN instruction is: `RUN <command>` It's important to note that each RUN instruction creates a new layer in the image. In order to minimize the number of layers and reduce the size of the final image, you can chain multiple commands together in a single RUN instruction. 

    It's a best practice to use && or ; to chain multiple commands together in a RUN instruction in a Dockerfile to reduce the number of layers in the image and make the final image smaller.

    It's also important to note that the RUN command will execute in the container environment and the changes that made by the command will be persisted on the container filesystem.

3. **`COPY`**:

    The COPY instruction in a Dockerfile is used to copy files from the host machine to the container's file system.
    The general syntax for the COPY instruction is: `COPY <src> <dest>` src is the path of the file or directory on the host machine, and dest is the path in the container where the files will be copied to.
    It's important to note that the COPY instruction only copies files during the build process, it does not provide an ongoing synchronization between the host and the container. If you need to update the files in the container, you need to rebuild the image and relaunch the container.

    Also, COPY instruction is less performant than ADD instruction, it can't extract archives or access remote URLs. If you need to copy an archive or a remote URL, use ADD instruction instead.

    It's also important to note that, if you copy files from a directory that contains a .dockerignore file, the files ignored by the .dockerignore file will not be copied to the container.

4. **`EXPOSE`**:

    The EXPOSE instruction in a Dockerfile is used to inform Docker that the container will listen on the specified network ports at runtime. The general syntax for the EXPOSE instruction is: `EXPOSE <port> [<port>...]` port is the network port that the container will listen on at runtime. You can specify multiple ports by separating them with spaces.

    The EXPOSE instruction does not publish the specified ports to the host machine, it only informs Docker that the container will listen on those ports at runtime. In order to publish the ports, you need to use the -p or --publish option when running the docker run command.

    It's important to note that, EXPOSE is a way to document what ports the container will be listening on and it is not used to publish the ports to the host machine. Also, the EXPOSE instruction is optional, it's not required to run a container, it's added to the image metadata only.

5. **`ENTRYPOINT`**:

    The ENTRYPOINT instruction in a Dockerfile is used to configure the container's default command and arguments. It is the command that will be executed when the container is started. The general syntax for the ENTRYPOINT instruction is: `ENTRYPOINT ["executable", "param1", "param2"]`

    The ENTRYPOINT instruction can be specified in two forms: the exec form: `ENTRYPOINT ["executable", "param1", "param2"]`
    the shell form: `ENTRYPOINT command param1 param2`

    It's important to note that the ENTRYPOINT command will be executed every time the container is started. If you need to run a command or start a process that is specific to a single run of the container, it's better to use the CMD instruction, which allows you to specify arguments that will be passed to the ENTRYPOINT command.

    It's a best practice to use ENTRYPOINT instruction to configure the container's default command and arguments, as it makes it easier to understand how the container should be configured and used in different environments.

6. **`CMD`**:

    The CMD instruction in a Dockerfile is used to specify the default command and arguments that will be executed when a container is started from the image. The general syntax for the CMD instruction is: `CMD ["executable","param1","param2"]`

    The CMD instruction can also be specified in two forms: the exec form: `CMD ["executable", "param1", "param2"]` the shell form: `CMD command param1 param2`

    Like ENTRYPOINT, the exec form is recommended as it allows the container to start with a defined environment and prevents the shell from interpreting any arguments passed to the container.

    It's important to note that if an ENTRYPOINT instruction is also specified in the Dockerfile, the CMD arguments will be passed to the ENTRYPOINT command.

    It's a best practice to use CMD instruction to specify the default command and arguments that will be executed when a container is started from the image, as it makes it easier to understand how the container should be configured and used in different environments.

- How Dockerfile works

    A Dockerfile works in layers. These are the building blocks of Docker.The first layer starts with the FROMkeyword and defines which pre-built image we will use build an image. We can then define user permissions and startup scripts.

    In Docker, a container is an image with a readable layer build on top of a read-only layers. These layer are called intermediate images, and they are generated when we execute the commands in our Dockerfile during the build stage.

- Docker Compose

    Docker Compose is a Docker tool used to define and run multi-container applications. With Compose, you use a YML file to configure your application’s services and create all the app’s services from that configuration.

    Think of docker-compose as an automated multi-container workflow. Compose is an excellent tool for development, testing, CI workflows, and staging environments. According to the Docker documentation, the most popular features of Docker Compose are:

    - Multiple isolated environments on a single host
    - Preserve volume data when containers are created
    - Only recreate containers that have changed
    - Variables and moving a composition between environments
    - Orchestrate multiple containers that work together

![screenshot](/assets/docker-compose.png)

- Docker Compose file structure

- How Docker Compose works

    Docker Compose files work by applying mutiple commands that are declared within a single docker-compose.yml configuration file.

1. **`version`**:

    The version field specifies the version of the docker-compose file format that is being used. This field is optional but recommended, as it allows docker-compose to check compatibility with the version of the tool that you are using.

    The general syntax for the version field in the docker-compose.yml file is: `version: <version_number>`

    If you don't specify a version number in your docker-compose.yml file, docker-compose will use the latest version of the file format that is compatible with the version of docker-compose that you are using.

    It's a good practice to specify the version number of the file format in the docker-compose.yml file to ensure compatibility with the version of docker-compose that you are using and also to make it clear which version of the file format is being used.

2. **`services`**:

    The services field is used to define the services that are part of the application. Each service is a container that runs a specific process or set of processes. Each service can be configured with its own options and settings.

    The general syntax for the services field in the docker-compose.yml file is:
    `services:`
    
            <service_name_1>:
                <service_options_1>

    Each service can have its own options like build, image, ports, environment, volumes, depends_on, etc. These options can be used to configure the service according to your needs.

3. **`build`**:

    The build field is used to specify the build context that should be used to build a custom image for a service. The build context can be a directory or a git repository containing a Dockerfile and the files needed to build the image.

    The general syntax for the build field in the docker-compose.yml file is:
    `services:`

        <service_name>:
            build: <path_to_build_context>

4. **`container_name`**:

    The container_name field is used to specify the name that should be given to a container when it is created by docker-compose.

    The general syntax for the container_name field in the docker-compose.yml file is:
    `services:`

        <service_name>:
            container_name: <container_name>

5. **`restart`**:

    The restart field is used to configure the behavior of a service's container when it exits or stops.

    The general syntax for the restart field in the docker-compose.yml file is:
        `services:`

            <service_name>:
                restart: <policy>

    where <policy> can be one of the following options:

    - no: The container will not automatically restart when it exits or stops. This is the default behavior(This policy is good for one-off tasks or for containers that are only meant to run for a short period of time).

    - always: The container will always be restarted automatically if it exits or stops(This policy is good for services that are critical to the operation of your application and should always be running. It can be useful for stateless services, such as web servers, that can quickly recover from failures).

    - on-failure: The container will be restarted automatically if it exits with a non-zero exit code(This policy is good for services that are important to the operation of your application, but don't need to be running all the time. It can be useful for stateful services, such as databases, that may take longer to recover from failures).

    - unless-stopped: The container will always be restarted automatically unless it is explicitly stopped(This policy is good for services that are critical to the operation of your application and should always be running unless explicitly stopped).

    A good practice is to start with the on-failure policy and monitor the container's behavior, if the container is frequently failing, it's a sign that the service is not stable and you should consider using another policy such as always or unless-stopped.

6. **`env_file`**:

    The env_file field is used to specify one or more environment files that should be loaded to provide environment variables for a service's container.

    The general syntax for the env_file field in the docker-compose.yml file is:
        `services:`

            <service_name>:
                env_file:
                    - <path_to_env_file1>

    Environment files are plain text files that contain key-value pairs of environment variables, one per line, in the format VARIABLE=value.

7. **`networks`**:

    The networks field is used to specify the networks that a service should be connected to.

    The general syntax for the networks field in the docker-compose.yml file is:
        `services:`

            <service_name>:
                networks:
                    - <network_name1>
                
    Before you connect a service to a network, the network should be defined in the docker-compose.yml file or created before running the docker-compose up command.

    You can also use the default network that is created automatically by docker-compose if you don't specify any network for your service.

    - Define a network in docker-compose.yml:

    In a docker-compose.yml file, networks can be defined under the networks key at the top-level of the file. where you can specify the network name and the network driver options. you can also set some options like subnet and ip range for the network.
    `networks:`

        <network_name>:
            <network_driver_options>

    - Network driver options:

    In a docker-compose.yml file, the network_driver_options for a network can vary depending on the network driver you are using.

    The most common network drivers are:

    - bridge: This is the default network driver and it creates a virtual network that connects containers on the same host together.

    - host: This network driver allows the container to use the host's network stack. It does not create a separate network namespace for the container, so it shares the host's network interfaces.

    - overlay: This network driver creates a virtual network that spans multiple hosts, allowing containers to communicate with each other across hosts.

    - macvlan: This network driver allows the container to have its own MAC address on the host's network, making it appear as a physical device on the network.

8. **`ports`**:

    The ports(A port is a logical endpoint for network communication in a computer operating system) field is used to specify the port mappings(Port mapping refers to the process of forwarding a port from a host machine to a container. In other words, it allows the container to receive incoming network traffic on a specific port of the host machine. This enables the container to be accessed from outside the host machine) between the host and the container.

    The general syntax for the ports field in the docker-compose.yml file is:
        `services:`

            <service_name>:
                ports:
                    - "<host_port>:<container_port>"

    It's worth noting that if you don't specify a host port, Docker will automatically assign one.

9. **`volumes`**:

    The volumes field is used to specify the volumes that will be mounted to the container. A volume is a way to store data outside of a container's filesystem. This allows the data to persist even if the container is deleted, and also allows for sharing data between containers.

    The general syntax for the volumes field is:
        `volumes:`

            - <host_path>:<container_path>

    The <host_path> is the path on the host machine where the data will be stored, and <container_path> is the path inside the container where the data will be mounted.

    - Define a volume in docker-compose.yml:
        `volumes:`

            <container_path>:
                driver: local
                driver_opts:
                    type: none
                    device: /Users/bbrahim/Desktop/data/wordpress_volume
                    o: bind

    The <container_path> is the path inside the container where the data will be mounted, and the driver field specifies the type of volume to use.

    - driver:In Docker, a volume driver is a plugin that provides the underlying functionality for a specific type of volume. The volume driver is specified when a volume is created, and it determines how the volume is stored and accessed.

    - Local: This is the default volume driver, it uses the local filesystem of the host to store the data.

    - driver_opts:The driver_opts field in the docker-compose.yml file is used to specify additional options for a volume driver. These options depend on the specific volume driver in use.

    - device:The device option in the driver_opts field is used to specify the path to the device where the volume should be created.

    - o: bind:is specifying that the volume should be mounted as a bind mount. A bind mount allows you to mount a host directory as a data volume in a container. This means that the files in the host directory are directly accessible within the container, and any changes made to the files within the container will be reflected in the host directory as well.

- The difference between a docker image used with docker-compose and without docker-compose:

When using Docker Compose, a single docker-compose.yml file is used to define the services, networks, and volumes that make up an application. This file is used to configure the containers that are created from the images specified in the file, and to start and stop those containers as a group. On the other hand, when using a Docker image without Docker Compose, the image is used to create and run individual containers. This means that the configuration and startup of each container must be done manually, typically using the docker run command.

- The pertinence of directory structure in docker:

The directory structure in a Docker project is important because it helps to keep the project organized and maintainable. A well-organized directory structure can make it easier to understand how the project is put together, and can help to reduce the risk of errors or confusion when building and deploying the project. A common practice is to have a single root directory for the entire project, with sub-directories for each part of the project such as "Dockerfile" for the Dockerfile, "src" for the application's source code and "config" for the configuration files.
It is also a good practice to keep the files related to each service in separate directories. This way, you can easily find the files you need to work on and maintain, and it also makes it easy to reuse the services in multiple projects.

##  Nginx

NGINX (pronounced "engine-x") is a web server(A web server is a software or hardware system that is responsible for accepting HTTP requests from clients, such as web browsers, and returning the corresponding web pages or other resources in response) and reverse proxy server. It is known for its high performance and low resource consumption. NGINX is typically used to serve static files, handle HTTP requests, and act as a reverse proxy for other web servers such as Apache or Node.js. NGINX can also be used to load balance requests between multiple servers, and it can also be configured to act as a caching server to improve the performance of dynamic web applications. NGINX is widely used in production environments, and is known for its stability and reliability. It is also commonly used as a reverse proxy for containerized applications, such as those deployed with Docker.

- Reverse proxy server:

A reverse proxy server is a type of proxy server that sits behind the firewall in a private network, and directs client requests to the appropriate backend server. The primary purpose of a reverse proxy is to hide the identity of the servers behind it, and to handle tasks such as SSL termination, load balancing, and caching.

When a client makes a request to a website or application, the request is first sent to the reverse proxy server, which then forwards the request to the appropriate backend server. The reverse proxy server may also perform various tasks such as SSL termination, load balancing, and caching, before forwarding the request to the backend server.

The backend servers can be web servers, application servers, or other types of servers, and they can be located on-premises or in the cloud. The reverse proxy server acts as an intermediary between the client and the backend servers, and it can be used to improve the security, scalability, and performance of the overall system.

- SSL:

SSL stands for Secure Sockets Layer and, in short, it's the standard technology for keeping an internet connection secure and safeguarding any sensitive data that is being sent between two systems, preventing criminals from reading and modifying any information transferred, including potential personal details. The two systems can be a server and a client (for example, a shopping website and browser) or server to server (for example, an application with personal identifiable information or with payroll information).

It does this by making sure that any data transferred between users and sites, or between two systems remain impossible to read. It uses encryption algorithms to scramble data in transit, preventing hackers from reading it as it is sent over the connection. This information could be anything sensitive or personal which can include credit card numbers and other financial information, names and addresses.

TLS (Transport Layer Security) is just an updated, more secure, version of SSL.

- TLS:

TLS (Transport Layer Security) is a cryptographic protocol that provides secure communication over networks, particularly the Internet. It is designed to ensure the confidentiality, integrity, and authenticity of data transmitted over networks, and protect against tampering and eavesdropping.

The main goal of TLS is to establish a secure and private channel between two parties (e.g., a client and a server) for the exchange of information. It does this by using a combination of encryption, authentication, and integrity-checking techniques.

TLS uses a combination of public key and symmetric key cryptography to secure data transmission. It uses a public key infrastructure (PKI) system to establish trust and secure communications. The server sends its public key to the client, which uses it to encrypt the message, only the server can decrypt it using the private key.

TLS uses a series of steps to establish a secure connection between a client and a server. The steps are called a "handshake" and include the following:

- The client sends a request for a secure connection to the server.
- The server sends its digital certificate, which includes its public key, to the client.
- The client verifies the server's digital certificate and extracts the server's public key.
- The client generates a random number, called the "pre-master secret," and encrypts it with the server's public key.
- The server decrypts the pre-master secret using its private key and generates a master secret.
- Both the client and the server use the master secret to generate session keys, which are used to encrypt and decrypt data.

Once the secure connection is established, the client and the server can exchange data securely.

- OpenSSL:

OpenSSL is a widely-used open-source implementation of the Secure Sockets Layer (SSL) and Transport Layer Security (TLS) protocols. It provides a library of cryptographic functions and an extensive command-line tool set for working with SSL/TLS certificates and private keys, encryption and decryption, and more. OpenSSL is commonly used to secure communications between web servers and clients, to generate SSL/TLS certificates, and to provide secure key exchange and encryption for other network services. It is also frequently used as a general-purpose cryptographic library in a wide range of applications.

- req: used to generate a certificate signing request (CSR)
- x509: tells OpenSSL to create a self-signed certificate instead of generating a CSR to be signed by a certificate authority.
- nodes: option tells OpenSSL to not encrypt the private key
- days 365: specifies the number of days the certificate will be valid for.
- newkey rsa:2048: option specifies the type and size of the key pair to be generated.
- keyout: option specifies the file to which the private key should be written.
- out: option specifies the file to which the certificate should be written.
- subj: option sets the X.509 subject name of the certificate, including the country, state, location, organization, organizational unit, common name (hostname), and email address.

- Nginx configuration:

        server 
        {
            listen 443 http2 ssl;
            - listen on port 443 for incoming connections using the HTTP/2 protocol and the Secure Sockets Layer (SSL) protocol.
            listen [::]:443 http2 ssl;
            - listen on port 443 for incoming connections on the IPv6 address using (SSL) protocol.

            root /var/www/html/;
            - The root directive sets the root directory to /var/www/html/, meaning that files in this directory will be served when requested by clients.
            index index.php index.html index.htm;
            - The index directive sets the default index files to index.php, index.html, and index.htm, in that order.

            ssl_certificate /etc/ssl/certs/bbrahim.crt;
            - The ssl_certificate directive specifies the location of the SSL certificate file that will be used for the HTTPS connection.
            ssl_certificate_key /etc/ssl/private/bbrahim.key;
            - The ssl_certificate_key directive specifies the location of the private key for the SSL certificate.
            ssl_protocols TLSv1.3;
            - The ssl_protocols directive specifies which SSL/TLS protocol versions should be enabled for the connection.

            server_name $DOMAIN_NAME www.bbrahim.42.fr;
            - The "server_name" directive specifies the domain name(s) that this server block should respond to.
            location / {
                try_files $uri $uri/ /index.php?$args;
            }
            - The location directive specifies the location of the root directory and the index files.
            - The try_files directive is used to check if a requested file or directory exists, if not it rewrites the request to /index.php?$args. This is used to handle requests for PHP files, so that they are passed to the PHP-FPM process for handling.

            location ~ \.php$ {
                try_files $uri =404;
                include /etc/nginx/fastcgi_params;
                fastcgi_pass wordpress:9000;
                fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
                fastcgi_index index.php;
            }
            - The location block with the regular expression \.php$ is used to handle requests for PHP files.
            - the try_files directive is used to check for the existence of the requested file, and if it is not found, it returns a 404 error.
            - The include /etc/nginx/fastcgi_params directive includes the default fastcgi_params file, which contains various parameters for the fastcgi process.
            - The fastcgi_pass directive specifies the backend server to which the request should be passed, in this case wordpress:9000, which is the name of the service and the port on which it is listening.
            - The fastcgi_param directive sets the SCRIPT_FILENAME parameter, which is the path to the PHP script that should be executed.
            - The fastcgi_index directive sets the default index file, which is index.php.
        }

##  WordPress

WordPress is a free and open-source content management system (CMS) based on PHP and MySQL.

- Curl:

curl is a command-line tool that allows you to transfer data using various protocols, such as HTTP, HTTPS, FTP, and more. It supports a wide range of options for configuring the request, such as setting headers, customizing the request method, and sending data in the request body. It is commonly used for interacting with web services, testing web applications, and automating file transfers.

- wp-cli:

wp-cli is a command line interface for WordPress. It allows users to manage their WordPress sites through the command line, perform updates, manage plugins and themes, and perform other tasks. It is built on top of the WordPress codebase and can be used to automate various tasks, such as creating posts and pages, managing users, and managing comments.

- php-fpm

php-fpm (FastCGI Process Manager) is an extension for PHP that allows PHP scripts to be executed by a web server using the FastCGI protocol. It is designed to improve the performance and scalability of PHP-based web applications by running multiple PHP processes in the background and handling requests through a single, stable interface. This allows for better resource utilization and can help to reduce the impact of PHP script execution on web server performance.

- php-mysql

php-mysql is a package that allows the PHP 7.3 programming language to interact with the MySQL database server. It provides the necessary libraries and modules for PHP to connect to and execute queries on a MySQL server. This package is typically used in web development, as many web applications (such as WordPress) use PHP as the server-side programming language and MySQL as the database management system.

- FastCGI

FastCGI (Fast Common Gateway Interface) is a protocol that allows web servers to communicate with web applications or scripts, such as PHP, Ruby, or Python. It is an alternative to the more commonly used CGI (Common Gateway Interface) protocol. The main difference between the two is that FastCGI keeps a pool of processes running, which allows for faster and more efficient handling of multiple requests. This eliminates the need to start a new process for each incoming request, which reduces the overhead and improves the performance of the web application. Additionally, FastCGI also supports running multiple versions of the same application or script, which is useful for testing or upgrading.

- WordPress configuration:

        #!/bin/bash
        wp core download --path=/var/www/html --allow-root
        - The wp core download command is used to download the latest version of WordPress to a specified directory, in this case /var/www/html. The --path option allows you to specify the directory where WordPress will be installed, and the --allow-root flag allows the command to be run as the root user.

        rm -rf /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
        - This command is used to remove the files "wp-config-sample.php" and "wp-config.php" from the directory "/var/www/html/". 

        wp config create --dbname=$DB_NAME \
                        --dbuser=$DB_USER_NAME \
                        --dbpass=$DB_USER_PASS \
                        --dbhost=$HOST\
                        --skip-check \
                        --path=/var/www/html/ \
                        --allow-root \
        - This command is used to create a configuration file for WordPress using the WP-CLI command-line tool. It creates a wp-config.php file in the specified path "/var/www/html/" with the following parameters:
            - dbname: the name of the database to be used
            - dbuser: the username for the database
            - dbpass: the password for the database
            - dbhost: the hostname or IP address of the database server
            - skip-check: skips the database connection test
            - path: the path to the WordPress installation
            - allow-root: allows the command to be run as the root user
                        --extra-php<<PHP
        define('WP_CACHE', true);
        define('WP_REDIS_HOST', 'redis');
        define( 'WP_REDIS_PORT', 6379 );
        define( 'WP_REDIS_TIMEOUT', 1 );
        define( 'WP_REDIS_READ_TIMEOUT', 1 );
        define( 'WP_REDIS_DATABASE', 0 );
        PHP
        - The --extra-php option allows you to add additional PHP code to the generated wp-config.php file.
            - WP_CACHE is set to true to enable caching.
            - WP_REDIS_HOST is set to redis to specify the hostname of the Redis server.
            - WP_REDIS_PORT is set to 6379 which is the default port for Redis.
            - WP_REDIS_TIMEOUT and WP_REDIS_READ_TIMEOUT are set to 1 to specify the timeout for connecting to Redis in seconds.
            - WP_REDIS_DATABASE is set to 0 to specify the Redis database to use.

        wp core install --url=$DOMAIN_NAME \
                        --title="Inception" \
                        --admin_name=bbrahim \
                        --admin_password=admin@42 \
                        --admin_email=bbrahim@student.1337.ma --path=/var/www/html/ --allow-root
        - The command wp core install is used to install the WordPress core files, and set up the initial configuration for a new WordPress site.
            - `--url=$DOMAIN_NAME` is used to set the URL of the website, which will be used to access the site.
            - `--title="Inception"` sets the title of the website.
            - `--admin_name=bbrahim` sets the username for the administrator account of the website.
            - `--admin_password=admin@42` sets the password for the administrator account of the website.
            - `--admin_email=bbrahim@student.1337.ma` sets the email address for the administrator account of the website.
            - `--path=/var/www/html/` specifies the path where the WordPress files are located.
            - `--allow-root` allows the command to be executed with root privileges.

        wp user create boumlikbrahim \
                        boumlikbrahim@student.1337.ma \
                        --role=author \
                        --user_pass=wpuser@123 \
                        --allow-root \
                        --path=/var/www/html/
        - This command creates a new user on the WordPress website with the username "boumlikbrahim", email "boumlikbrahim@student.1337.ma", and password "wpuser@123". The user is given the role "author" and the command is executed on the WordPress installation located in the directory "/var/www/html/".

        service php7.3-fpm start
        - The service php7.3-fpm start command is used to start the PHP 7.3 FastCGI Process Manager (php-fpm) service. 

        wp plugin install redis-cache --path=/var/www/html --activate --allow-root
        - The command used to install and activate the Redis Cache plugin for WordPress.
            - The "--path" flag specifies the path to the WordPress installation.
            - "--activate" tells the command to activate the plugin after it has been installed.

        wp redis enable --path=/var/www/html/ --allow-root
        - Is used to enable the Redis caching plugin for a WordPress installation located at the specified path "/var/www/html/".

        service php7.3-fpm stop
        - The service php7.3-fpm stop command is used to stop the PHP 7.3 FastCGI Process Manager (php-fpm) service. 

        chown -R www-data:www-data /var/www/html
        - The first command, chown -R www-data:www-data /var/www/html, changes the ownership of the /var/www/html directory and all its contents to the www-data user and group.
        - The -R flag is used to change the ownership recursively for all files and directories inside /var/www/html.

        php-fpm7.3 -F
        - Is used to run the PHP-FPM (FastCGI Process Manager) service in the foreground. The -F option tells PHP-FPM to run in the foreground, rather than as a daemon process in the background.

##  Mariadb

MariaDB is a database(A database is a place to store information that you can quickly retrieve and use where you need it). MariaDB is very similar to MySQL (a database management system) and, in fact, a fork to MySQL. The MariaDB database is used for various purposes such as data warehousing, e-commerce, enterprise-level features, and logging applications.

- Database creation:

        CREATE DATABASE IF NOT EXISTS ma_base;
        - Creates a new database named "ma_base" if it does not already exist.
        - The "IF NOT EXISTS" clause is used to prevent an error from being generated if a database with the same name already exists.
        CREATE USER 'bbrahim' IDENTIFIED BY 'user42';
        - Creates a new user named "bbrahim" with the password "user42" in MySQL.
        GRANT ALL PRIVILEGES ON ma_base.* TO 'bbrahim'@'%';
        - The "GRANT" statement which is used to grant privileges to a user.
        - The "ALL PRIVILEGES" option grants all available privileges on the specified object, in this case, the "ma_base" database.
        - The ".*" after the database name means that all tables within the "ma_base" database are included.
        - The "TO" clause is followed by the user that the privileges are being granted to, in this case, 'bbrahim'.
        - The "@" sign is used to specify the hostname that the user is connecting from. In this case, the hostname is '%' which means that the user can connect from any host, it is a wildcard that matches any hostname.
        ALTER USER 'root'@'localhost' IDENTIFIED BY 'root42';
        - The "ALTER USER" statement is used to modify an existing user account.
        - The "IDENTIFIED BY" clause is used to set the new password for the user.

##  Adminer

Adminer is a simple, lightweight and easy-to-use database management tool written in PHP. It is an alternative to other popular database management tools such as phpMyAdmin and MySQL Workbench.

- apache2

Apache HTTP Server, commonly known as Apache, is a free and open-source web server software that is widely used to host websites and web applications.

- php

php is the core package that provides the PHP interpreter and runtime. It is used to process PHP scripts and execute the PHP code.

- php-mysql

php-mysql is a package that provides a set of PHP extensions for working with MySQL databases. It allows PHP scripts to connect to MySQL servers, execute SQL commands, and retrieve results.

- libapache2-mod-php

libapache2-mod-php is an Apache module that allows Apache to process PHP scripts. It embeds the PHP interpreter into the Apache process, allowing PHP code to be executed directly by the web server. This allows for much faster performance than using a separate PHP interpreter through CGI or FastCGI.

These packages are typically installed together to run PHP web applications on an Apache server. Once the packages are installed, the Apache web server can be configured to process PHP scripts.

- wget

wget is a command-line utility for downloading files from the internet. It supports various protocols including HTTP, HTTPS, and FTP. It can be used to download files from the command line or through shell scripts.

##  Redis cache

Redis (Remote Dictionary Server) is an in-memory data structure store that can be used as a caching system. It is an open-source, networked, in-memory, key-value data store with optional durability. It is often used as a caching layer in web applications to speed up data access and reduce the load on the database.

- caching layer

A caching layer in web applications is a system that stores frequently accessed data in a fast, in-memory storage system. This allows the web application to quickly retrieve the data, rather than having to fetch it from a slower, disk-based storage system such as a database. Caching can greatly improve the performance of web applications by reducing the number of requests to the database and the amount of data that needs to be transferred over the network.

Caching layers in web applications typically work by storing a copy of the data that is frequently accessed in memory. When a request for that data is made, the caching layer checks to see if the data is already in memory. If it is, the caching layer returns the data from memory, rather than fetching it from the database. This reduces the load on the database and improves the performance of the web application.

##  FTP server

File Transfer Protocol (FTP) is a standard network protocol used to transfer files between computers on a private or public network. FTP is a client-server protocol, where an FTP client establishes a connection to an FTP server and then uploads or downloads files to or from the server.

- FTP uses two channels to transfer files:

    -   Control channel: used to establish a connection, authenticate the user and to send commands between the client and the server.
    -   Data channel: used to transfer the actual data between the client and the server.

FTP clients are widely available for different platforms, such as Windows, Linux, and macOS, examples of popular FTP client is: FileZilla

- How FTP work:

The basic process of using FTP to transfer files is as follows:

1. The FTP client establishes a connection with the FTP server by sending a connection request to the server's IP address and port number (usually port 21).

2. Once the connection is established, the client sends an authentication request to the server by providing a username and password. The server checks the credentials and sends an acknowledgement if the authentication is successful.

3. After successful authentication, the client can use a set of FTP commands to interact with the server. For example, the client can use the "ls" command to list the files in the current directory, or the "get" command to download a file from the server.

4. To upload a file to the server, the client uses the "put" command, and to delete a file, the client uses the "delete" command.

5. Once the client is done with the file transfer, it sends a "quit" command to the server to close the connection.

- FTP connection modes:

1. Active mode:

    -   In this mode, the FTP client establishes a connection to the server's control port (usually port 21) and initiates a data transfer by sending a PORT command to the server.
    -   The server then establishes a connection with the client's data port (specified in the PORT command) to transfer the data.
    -   This mode is less secure because the client's IP address and port number are sent in the clear over the control channel, which could be intercepted by an attacker.

2. Passive mode:

    -   In this mode, the FTP client establishes a connection to the server's control port (usually port 21) and initiates a data transfer by sending a PASV command to the server.
    -   The server responds with the IP address and port number that the client should use to establish a data connection.
    -   The client then establishes a connection to the specified IP address and port number to transfer the data.
    -   This mode is more secure because the client's IP address and port number are not sent in the clear over the control channel, so it's less likely to be intercepted by an attacker.

- When you configure an FTP server to use passive mode, you typically need to specify a range of ports that the server can use for data connections. This is because in passive mode, the server is the one that initiates the data connection, and it will need to use a port that is available and not blocked by a firewall.

    -   "20:20" maps the host's port 20 to the container's port 20, this is the port used for the FTP-data connection in active mode.
    -   "21:21" maps the host's port 21 to the container's port 21, this is the port used for the control connection in both active and passive mode.
    -   "40000-40005:40000-40005" maps a range of ports on the host to a range of ports inside the container. This range of ports (40000-40005) will be used for the data connections in passive mode.

- vsftpd

vsftpd (Very Secure File Transfer Protocol Daemon) is a popular, lightweight, and secure FTP server for Linux. It is designed to be fast, stable, and secure, and it is often used to provide FTP services on Linux servers.
vsftpd can be configured through the use of a configuration file, typically located at /etc/vsftpd.conf. The file contains directives that control how the server behaves, including settings for virtual hosts, security, and performance.

- vsftpd configuration

        local_enable=YES
        - Enable the ability of local users to log in to the FTP server.
        allow_writeable_chroot=YES
        - Is used to allow users to write to their home directories when they are chrooted (jailed)(When a user is chrooted, they can only access files and directories within their home directory and its subdirectories) to their home directory.
        local_root=/home/bbrahim/ftp
        - Is used to specify the directory that the users will be chrooted to, it's also known as the root directory of the FTP service.
        pasv_enable=YES
        - Is used to enable or disable the passive mode in the FTP server.
        pasv_min_port=40000
        pasv_max_port=40005
        - Are used to specify the range of ports that the server can use for data connections in passive mode.
        userlist_file=/etc/vsftpd.userlist
        - Is used to specify the location of a file that contains a list of allowed or denied users for the FTP server.

- vsftpd script file

        #!/bin/bash

        adduser $FTP_CLIENT --disabled-password
        - Is used to create a new user on a Linux system without setting a password for the user.

        echo "$FTP_CLIENT:$FTP_PASS" | /usr/sbin/chpasswd
        - Is used to set or change the password for a user on a Linux system.

        echo "$FTP_CLIENT" | tee -a /etc/vsftpd.userlist
        - Is used to add a new user to the user list file /etc/vsftpd.userlist on a Linux system.

        mkdir -p /home/$FTP_CLIENT/ftp
        - Create the ftp folder

        chown nobody:nogroup /home/$FTP_CLIENT/ftp
        - Is used to change the ownership of the directory /home/$FTP_CLIENT/ftp on a Linux system.
        chmod a-w /home/$FTP_CLIENT/ftp
        - Remove write permissions for all users on the directory

        mkdir /home/$FTP_CLIENT/ftp/files
        chown $FTP_CLIENT:$FTP_CLIENT /home/$FTP_CLIENT/ftp/files
        - create the directory for file uploads and assign ownership to the user

        service vsftpd start
        service vsftpd stop

        /usr/sbin/vsftpd

##  cadvisor

cAdvisor (short for container Advisor) is an open-source tool developed by Google for monitoring and analyzing the resource usage of containers.
It provides detailed information about the resource usage of containers running on a machine, including CPU, memory, network, and disk usage.
cAdvisor runs as a daemon on the host machine and automatically discovers all containers running on the machine.
It then collects performance data from the containers and makes that data available through a RESTful API or a web-based user interface.
