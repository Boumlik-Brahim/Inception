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

##  Docker image      

##  How Docker works
