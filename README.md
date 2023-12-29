# Inception Project README

## Overview
The Inception project is a comprehensive exercise in system administration, with a primary focus on utilizing Docker for virtualization. The goal is to create a multifaceted infrastructure using Docker containers, each hosting a specific service. This exercise challenges participants to apply their system administration skills in a practical, real-world scenario.

## Version
- **Version:** 2.1

## Objectives
- To deepen understanding of system administration concepts.
- To gain hands-on experience in using Docker for virtualization.
- To set up a small-scale infrastructure with various services.

## Project Requirements
### General Guidelines
- The project must be executed on a Virtual Machine.
- All configuration files should be placed in a `srcs` folder.
- A `Makefile` is required at the root of the directory to set up the application (i.e., build Docker images using `docker-compose.yml`).
- Extensive reading and research on Docker and related technologies are advised.

### Mandatory Part
- Set up an infrastructure composed of services under specific rules, entirely in a virtual machine using docker-compose.
- Use either the penultimate stable version of Alpine or Debian to build containers.
- Create custom Dockerfiles for each service, and integrate them into `docker-compose.yml` using a `Makefile`.
- Services to be set up include NGINX (with TLSv1.2 or TLSv1.3), WordPress + php-fpm, MariaDB, and appropriate volumes and docker-network for connectivity.
- Specific rules around the use of network configurations and containers.

### Bonus Part
- The bonus part includes setting up additional services like Redis cache for WordPress, a FTP server, a static website, Adminer, and a service of personal choice.

## Submission and Evaluation
- Projects must be submitted through a Git repository.
- Only the work within the repository will be evaluated.
- Ensure correct naming conventions for folders and files.

## Directory Structure
An example of the expected directory structure is provided below:
```
$> ls -alR
.
├── Makefile
├── srcs
│   ├── docker-compose.yml
│   ├── .env
│   └── requirements
│       ├── bonus
│       ├── mariadb
│       ├── nginx
│       ├── tools
│       └── wordpress
```

## Project Structure Diagram
![Project Structure](https://kroki.io/plantuml/svg/eNq1lE1v2zAMhu_-FRzWa6oAKQZMpyZIgR1WpIszFDsZcsQmQmXJpWSnQdH_PslpYqfOgOzrYMB6X5GiH9K6dl6Q34pCJx_8GgsEQikJnRtIQY-5rjBxSLVaouNJAlAIUkLmPLwCLK3xQhmkzIgC-d5sPFWI1Tspr5SWu8hdLD57DpeM8KlSFA433rFuAICgldtHAAzg9kf67Ws2n80W2d04Te9n82nPnY4X48k4vekZ39ObeU_spQH4qIwKhXkKHx_XtdVVgYc6BjCdcFYLYlrlrNi6J904Bv3G0mNnnzJLLL2yplFKS75jjkbDT80i0I5N4GDN4EEoXRFG0iGXLGMnTrM-2F3ax-JZvI9DfkX8L5nujS-zdNGIaOrsQWlscVwG6TTt-1DhXQOigb7ZbNjaF3_E_PNwODyvAVGXWKKRLrOmzbAfzyCYlTLPp5vTWN3GtMJZTWm3nzWP_5DQ1dWIh6dP7HcgtTPVKTX8NLsAUjUSB22XQneUzJZtIX5bRmrW4JsgMd5BHNjaFsguXuLcvTIpvGDTydseyyFXRsbetET-z5mH_O-P7uI-gD4uIiclV5hcB2zx4v0JcbOQug==)

## Security and Best Practices
- Credentials, API keys, and environment variables must be stored locally in a `.env` file and ignored by Git.
- Avoid using publicly stored credentials to prevent project failure.
