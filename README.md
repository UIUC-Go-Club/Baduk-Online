# Baduk-Online
## A morden Go online gaming platform
- Frontend React
- Backend Express with MongoDB

## Tested Platform
- Windows
- Linux

## Deployment
- Method 1
    - clone from both directory, need to pull both submodules
        ```bash
        git clone --recurse-submodules https://github.com/UIUC-Go/Baduk-Online.git
        ```
- Method 2
    - build docker
        ```bash
        docker build -t baduk
        ```
    
    - pull from dockerhub
        ```bash
        docker pull xiaohei99/baduk:latest
        ```
      
    - run docker image
        ```bash
        docker run --publish 3000:3000 baduk
        ```