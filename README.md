# Hello, Kube

## A test using Oracle Kubernetes Engine (OKE)

This project will use Oracle Cloud Infrastructure to create a fully functional Kubernetes deployment using:

* 1 Kubernetes Cluster
* 3 Compute Instances
* 1 Load Balancer

All of these resources are included in the [Oracle 30 Day Trial](#https://www.oracle.com/cloud/free/).

### Pre-requisites

1. Allow OKE to manage resources in your tenancy
   * In OCI Console go to Identity > Policies
   * Click 'Create Policy'
   * Enter a name for the policy and in 'Policy Statements' enter `Allow service OKE to manage all-resources in tenancy`
   * Click 'Create'
2. Install Oracle Cloud Infrastructure Command Line Interface (oci_cli)
   * [Follow directions for your system to install and configure oci_cli here](#https://docs.cloud.oracle.com/iaas/Content/API/SDKDocs/cliinstall.htm)
   * Test your cli by entering `oci iam compartment list` which will return json with details about the compartments in your tenancy
3. Install kubectl
   * [Follow directions for your system to install and configure kubectl here](#https://kubernetes.io/docs/tasks/tools/install-kubectl/)

### Create a test Kubernetes cluster using OKE

1. Log into your Oracle Cloud tenancy [here](#https://www.oracle.com/cloud/sign-in.html)
2. In the menu, select 'Developer Services' > 'Container Clusters (OKE)'
3. Click 'Create Cluster'
4. Name your cluster as you see fit and leave all other options as their defaults
5. Click 'Create'
6. Once the cluster is done being created, click 'Access kubectl' which will display commands to copy and paste into your terminal to create the kubectl configurations
7. Download the file `hello_kube.yml` and navigate to it's location in your terminal
8. Enter `kubectl apply -f hello_kube.yml` to set the namespace, deployment, and load balancer service
9. After a moment enter `kubectl -n hello-kube-ns get services` and look for the public IP of your load balancer
10. With a web browser, navigate to the IP of your load balancer to view the Container ID of the pod you are accessing
11. Navigate to the same address again to see the Container ID change as you access different redundant pods for this application
    * If you do not see the container IDs changing, your browser may have chached the page. Try opening the page again in your browser's 'incognito mode'
    * Alternatively, try opening the page from multiple devices (e.g. your laptop and cell phone)
12. When done enter `kubectl -n hello-kube-ns delete all` into terminal to remove the deployment and terminate the load balancer

### Conclusion

Running Kubernetes is a challenging but rewarding task. Using Oracle Kubernetes Engine takes much of the pain out of managing and maintaining your cluster. Combine OKE with other solutions such as Autonomous Database to develop in a highly managable, scalable, and enterprise grade environment. Happy innovating.
