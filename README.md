This area builds a Docker image that runs tinyproxy.  At the high level it:

* Builds on Debian
* Installs tinyproxy
* Copies in the tinyproxy.conf, filter and hosts files
* Starts tinyproxy

We can build the image using:

```
docker build . -t mytinyproxy
```

Once the image is built, we can start container instances on Compute Engines.  To look inside the container
we can SSH into the compute engine and run:

```
docker exec -it <ContainerID> /bin/bash
```

we can run `netstat -an4` and should see something listening on port 443.

```
tcp        0      0 0.0.0.0:443             0.0.0.0:*               LISTEN 
```

# Configuration
Consider editing the `hosts` file to point to the correct Private Service Connect server.

We wanted to build a Terraform script to build a Compute Engine with a Container.  Unfortunately, this was not trivial.

* https://registry.terraform.io/modules/terraform-google-modules/container-vm/google/latest