# Hello World Application on Kubernetes

## Project Overview
This project deploys a "Hello World" web API on a Kubernetes cluster. The API is containerized using Docker and designed to handle HTTP requests on port 80. The application is simple, lightweight, and designed to run efficiently on Kubernetes with minimal costs.

## Prerequisites
- **Docker**: To build and push the application image.
- **Minikube**: To set up the Kubernetes cluster.
- **kubectl CLI**: To interact with the Kubernetes cluster.

## Setup Instructions

### 1. Cluster Provisioning
#### Minikube:
1. Install Minikube: [Minikube Installation Guide](https://minikube.sigs.k8s.io/docs/start/)
   - Select your target platform and follow the appropriate installation instructions.

2. Start the cluster:
   ```
   minikube start --nodes=2
   ```

### 2. Application Setup

1. Clone the repository and navigate to the project directory.

2. Build the Docker image:

```
docker build -t hello-world-app .
```
3. Test the application locally (optional):

```
docker run -p 80:80 hello-world-app
```
Open http://localhost in your browser. You should see the message Hello, World!.

4. Push the image to Docker Hub:

```
docker tag hello-world-app <your-dockerhub-username>/hello-world-app:latest
docker push <your-dockerhub-username>/hello-world-app:latest
```

### 3. Deployment Steps

1. Update deployment.yaml with your Docker Hub image:

```
image: <your-dockerhub-username>/hello-world-app:latest
```

2. Apply the Kubernetes manifests:

```
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

3. Verify the deployment:

```
kubectl get pods
kubectl get svc
```

### 4. Access the application:
1. Using Minikube:

```
minikube service hello-world-service
```

OR

2. Port-forwarding:

```
kubectl port-forward service/hello-world-service 80:80
```

Open http://localhost in your browser to view the application.


### Assumptions & Decisions
1. Used Python Flask for simplicity and readability.
2. Chose Minikube for local testing to minimize cost.
3. Used Docker Hub for image storage.



---

This solution provides a comprehensive guide to developing, containerizing, and deploying a "Hello World" application on Kubernetes. Let me know if you need help testing or extending this setup!
