# Inception

##  Problem

how to make sure that software runs correctly when it is moved from one computing environment to another.

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

Docker is a software platform that allows you to build, test, and deploy(Deploying an application typically involves moving the application from a development or testing environment to a production environment, where it can be accessed by users.) and scale(Scaling an application, involves increasing or decreasing the number of instances or resources (such as memory and CPU) allocated to the application to handle changing levels of traffic or load.) applications quickly. Docker packages software into standardized units called containers that have everything the software needs to run including libraries, system tools, code, and runtime.

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
    The COPY instruction in a Dockerfile is used to copy files from the host machine to the container's file system. The general syntax for the COPY instruction is: `COPY <src> <dest>` src is the path of the file or directory on the host machine, and dest is the path in the container where the files will be copied to.
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
