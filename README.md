# Baduk-Online
## A morden Go online gaming platform
- Frontend 
    - React
    - Preact
- Backend 
    - Express  
    - MongoDB

## Tested Platform
- Windows
- Linux

## Online to play
- portal:
    - http://35.226.255.75:3000/

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

## connect to google cloud
- need to install gcloud first
```bash
gcloud beta compute ssh --zone "us-central1-a" "baduk-1" --project "weighty-works-296118"
```