<h1>
  <img src="https://github.com/wikiZ/RedGuardImage/raw/main/42d448a4cd030c05bacb8bde759b5d8.png" align="left" height="120px" alt="RedGuard logo"/>
  <span>RedGuard in Kubernetes</span>
</h1>

**Using [RedGuard](https://github.com/wikiZ/RedGuard) redirector on Kubernetes.**

## Overview
Use this Helm-chart to run RedGuard redirector on k8s (k3s) clusters.

What is RedGuard
RedGuard, a derivative tool based on command and control (C2) front flow control technology, has a lighter design, efficient traffic interaction, and reliable compatibility with development in the go programming language.As cyber attacks are constantly evolving , the red and blue team exercises become progressively more complex, RedGuard is designed to provide a better C2 channel hiding solution for the red team, that provides the flow control for the C2 channel, blocks the "malicious" analysis traffic, and better completes the entire attack task.

RedGuard is a C2 front flow control tool that can avoid Blue Team, AVS, EDR, Cyberspace Search Engine detects.
## Features
* ConfigMap with RedGuard Config
* Port forwarding (LoadBalancer, NodePort or Ingress-controller port streaming)

```yaml
service:
  type: LoadBalancer
  ports:
    - name: http
      port: 80
      targetPort: 80
      protocol: TCP
    - name: https
      port: 443
      targetPort: 443
      protocol: TCP
```
You can change (customize) ports in `value.yaml`.
## Installation
Before running helm in k8s, you need to build a Docker image with RedGuard. An example would be the `Dockerfile` from the repository.
### Prerequisites
* Kubernetes or k3s
* Helm install
* `kubectl` configured to authenticate to a Kubernetes cluster with a valid `kubeconfig` file
* Docker on local machine
### CLI
1. Clone repo.
```bash
git clone https://github.com/3ayazaya/RedGuard-k8s
cd RedGuard-k8s/charts
```

2. Build Docker image with RedGuard (if you need it).

```bash
export BUILD_ARCHS="linux/amd64,linux/arm64"
docker buildx build --platform $BUILD_ARCHS --progress plain --pull -t <image:tag> --push . --no-cache
```
3. Change `values.yaml` if need in `charts` folder.
4. Install Helm-chart with RedGuard in k8s (k3s) cluster.

```bash
helm install redguard redguard -f redguard/values.yaml -n <namespace> --create-namespace
```